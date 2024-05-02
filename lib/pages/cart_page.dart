import "package:flutter/material.dart";
import "package:provider/provider.dart";
import './cart_item.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});
  @override
  State<CartPage> createState() => _CartPage();
}

class _CartPage extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final chez = Provider.of<CartItem>(context).chezen;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
          itemCount: chez.length,
          itemBuilder: (context, index) {
            final value = chez[index];
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(value["image"] as String),
                radius: 25,
              ),
              trailing: IconButton(
                onPressed: () {
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("Delete item"),
                        content: const Text("Are you sure delete to delete item?"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Provider.of<CartItem>(context, listen: false)
                                  .removeProduct(value);
                              Navigator.of(context).pop();
                            },
                            style: TextButton.styleFrom(
                                foregroundColor: Colors.blue,
                                fixedSize: Size(20, 30)),
                            child: const Text(
                              "Yes",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            style: TextButton.styleFrom(
                                foregroundColor: Colors.red,
                                fixedSize: Size(20, 30)),
                            child: const Text(
                              "No",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                  size: 35,
                ),
              ),
              title: Text(
                value["name"].toString(),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                "\$${value["price"]}",
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
              contentPadding: const EdgeInsets.all(10),
            );
          },
        ),
      ),
    );
  }
}
