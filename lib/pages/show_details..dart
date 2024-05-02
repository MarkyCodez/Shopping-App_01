import "package:first_app/pages/cart_item.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";

class ShowDetails extends StatefulWidget {
  final Map<String, dynamic> products;
  const ShowDetails({super.key, required this.products});
  @override
  State<ShowDetails> createState() => _ShowDetails();
}

class _ShowDetails extends State<ShowDetails> {
  late int selectedSize;
  @override
  void initState() {
    super.initState();
    setState(() {
      selectedSize = 0;
    });
  }

  void onTap() {
    if (selectedSize != 0) {
      Provider.of<CartItem>(context, listen: false).addProduct({
        "id": 1,
        "name": widget.products["name"],
        "price": widget.products["price"],
        "company": widget.products["company"],
        "image": widget.products["image"],
        "sizes": selectedSize,
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Added Succesfully"),
          duration: Duration(seconds: 2),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Size not Selected."),
          showCloseIcon: true,
          elevation: 10,
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
      print(Provider.of<String>(context));

    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Text(
                widget.products["name"],
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const Spacer(
                flex: 1,
              ),
              Image.asset(
                widget.products["image"] as String,
                height: 500,
                width: 350,
              ),
              const Spacer(
                flex: 1,
              ),
              Container(
                height: 194,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(15),
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "\$${widget.products["price"]}",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    SizedBox(
                      height: 60,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: (widget.products["sizes"] as List<int>).length,
                        itemBuilder: (context, index) {
                          final size = (widget.products["sizes"][index]);
                          return Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedSize = size;
                                });
                              },
                              child: Chip(
                                label: Text(
                                  size.toString(),
                                  style: TextStyle(
                                    color: selectedSize == size
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                                labelPadding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                backgroundColor: selectedSize == size
                                    ? Theme.of(context).primaryColor
                                    : Colors.white,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: ElevatedButton.icon(
                        onPressed: onTap,
                        icon: const Icon(
                          Icons.shopping_bag_rounded,
                          size: 35,
                        ),
                        label: Text(
                          "Add to Cart",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(280, 47),
                          elevation: 5,
                          foregroundColor: Colors.white,
                          backgroundColor: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
