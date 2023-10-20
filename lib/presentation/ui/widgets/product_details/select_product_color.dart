import 'package:craftybay_ecommerce_application/application/utility/app_colors.dart';
import 'package:craftybay_ecommerce_application/presentation/ui/widgets/section_title.dart';
import 'package:flutter/material.dart';

class ProductColorPicker extends StatefulWidget {
  const ProductColorPicker(
      {super.key,
      required this.colors,
      required this.onSelected,
      required this.initialSelected});

  final List<String> colors;
  final Function(int selectIndex) onSelected;
  final int initialSelected;

  @override
  State<ProductColorPicker> createState() => _ProductColorPickerState();
}

class _ProductColorPickerState extends State<ProductColorPicker> {
  int _selectedColorIndex = 0;

  @override
  void initState() {
    _selectedColorIndex = widget.initialSelected;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SectionTitle(title: 'Color'),
        const SizedBox(
          height: 16,
        ),
        SizedBox(
          height: 28,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: widget.colors.length,
            itemBuilder: (context, index) {
              return InkWell(
                borderRadius: BorderRadius.circular(4),
                onTap: () {
                  _selectedColorIndex = index;
                  widget.onSelected(index);
                  if (mounted) {
                    setState(() {});
                  }
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(4),
                      color: _selectedColorIndex == index
                          ? AppColors.primaryColor
                          : null),
                  alignment: Alignment.center,
                  child: Text(widget.colors[index]),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                width: 8,
              );
            },
          ),
        ),
      ],
    );
  }
}
