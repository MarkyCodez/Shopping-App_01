import 'package:first_app/pages/showpage_list.dart';
import 'package:flutter/material.dart';

class HomeScreenWidget extends StatefulWidget {
  const HomeScreenWidget({super.key});

  @override
  State<HomeScreenWidget> createState() => _HomeScreenWidgetState();
}

class _HomeScreenWidgetState extends State<HomeScreenWidget> {
  
  final border = const OutlineInputBorder(
    borderSide: BorderSide(
      width: 2,
      style: BorderStyle.solid,
      color: Colors.white,
    ),
    borderRadius: BorderRadius.horizontal(
      left: Radius.circular(20),
    ),
  );
  final List<String> filters = ["All", "Adidas", "Nike", "Jordan", "Bata"];
  late String selectedFilter;
  @override
  void initState() {
    super.initState();
    setState(() {
      selectedFilter = filters[0];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Padding(
                  padding: const EdgeInsets.only(right: 5.0),
                  child: Text(
                    "Shoes \nCollection",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              ),
              Expanded(
                child: TextField(
                  style: Theme.of(context).textTheme.bodySmall,
                  decoration: InputDecoration(
                    hintText: "Select",
                    hintStyle: const TextStyle(
                      color: Colors.white,
                    ),
                    prefixIcon: const Icon(
                      Icons.search,
                      size: 28,
                      color: Colors.white,
                    ),
                    focusedBorder: border,
                    enabledBorder: border,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: SizedBox(
              height: 60,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filters.length,
                itemBuilder: (context, index) {
                  final filter = filters[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedFilter = filter;
                        });
                      },
                      child: Chip(
                        label: Text(filter),
                        labelStyle: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: selectedFilter == filter
                              ? Colors.white
                              : Colors.black,
                        ),
                        labelPadding: const EdgeInsets.symmetric(horizontal: 10.0),
                        backgroundColor: selectedFilter == filter
                            ? Colors.black54
                            : Colors.white,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const ShowPageList(),
        ],
      ),
    );
  }
}
