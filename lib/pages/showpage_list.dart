import 'package:first_app/data/global_variables.dart';
import 'package:first_app/pages/show_details..dart';
import 'package:flutter/material.dart';

class ShowPageList extends StatefulWidget {
  const ShowPageList({super.key});

  @override
  State<ShowPageList> createState() => _ShowPageListState();
}

class _ShowPageListState extends State<ShowPageList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: LayoutBuilder(
        builder: (context, Constraints) {
          if (Constraints.maxWidth > 600) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3,
              ),
              itemCount: cart.length,
              itemBuilder: (context, index) {
                final product = cart[index];
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: SizedBox(
                      height: 200,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return ShowDetails(products: product);
                              },
                            ),
                          );
                        },
                        child: Card(
                          color: index.isOdd ? Colors.white70 : Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product["name"],
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 21,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "\$${product["price"]}",
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Image(
                                    image: AssetImage(
                                      product["image"].toString(),
                                    ),
                                    height: 110,
                                    width: 200,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return ListView.builder(
              itemCount: cart.length,
              itemBuilder: (context, index) {
                final product = cart[index];
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: SizedBox(
                      height: 200,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return ShowDetails(products: product);
                              },
                            ),
                          );
                        },
                        child: Card(
                          color: index.isOdd ? Colors.white70 : Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product["name"],
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 21,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "\$${product["price"]}",
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Image(
                                    image: AssetImage(
                                      product["image"].toString(),
                                    ),
                                    height: 110,
                                    width: 200,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
