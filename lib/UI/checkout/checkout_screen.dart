import 'package:flutter/material.dart';
import 'package:myapp/UI/_core/bag_provider.dart';
import 'package:myapp/model/dish.dart';
import 'package:provider/provider.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BagProvider bagProvider = Provider.of<BagProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Sacola"),
        actions: [
          TextButton(
            onPressed: () {
              bagProvider.clearBag();
            },
            child: Text("Limpar"),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text("Pedidos", textAlign: TextAlign.center),
              Column(
                children: List.generate(
                  bagProvider.getMapByAmount().keys.length,
                  (index) {
                    Dish dish =
                        bagProvider.getMapByAmount().keys.toList()[index];
                    return ListTile(
                      onTap: () {},
                      leading: Image.asset(
                        'assets/dishes/default.png',
                        width: 50,
                      ),
                      title: Text(dish.name),
                      subtitle: Text("R\$${dish.price.toStringAsFixed(2)}"),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {
                              bagProvider.removeDish(dish);
                            },
                            icon: Icon(Icons.remove),
                          ),
                          Text(
                            bagProvider.getMapByAmount()[dish].toString(),
                            style: TextStyle(fontSize: 16.0),
                          ),
                          IconButton(
                            onPressed: () {
                              bagProvider.addAllDishes([dish]);
                            },
                            icon: Icon(Icons.add),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
