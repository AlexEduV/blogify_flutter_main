import 'package:blogify_flutter_main/presentation/pages/home_page/widgets/rounded_button.dart';
import 'package:flutter/material.dart';

class CategorySelector extends StatefulWidget {

  final int? selectedIndex;
  final List<String> items;
  final Function(int)? onItemTapped;

  const CategorySelector({
    required this.items,
    this.selectedIndex,
    this.onItemTapped,
    super.key,
  });

  @override
  State<CategorySelector> createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.0),
        border: Border(
          bottom: BorderSide(
            color: Colors.grey[300]!,
            width: 0.5,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[200]!,
            offset: const Offset(0, 2),
            blurRadius: 5.0,
            spreadRadius: 2.0,
          ),
        ],
      ),
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(widget.items.length, (index) {

          return RoundedButton(
            text: widget.items[index],
            filled: widget.selectedIndex == index,
            onTap: () => widget.onItemTapped != null ? widget.onItemTapped!(index) : () {},
          );

        })
      ),
    );
  }
}
