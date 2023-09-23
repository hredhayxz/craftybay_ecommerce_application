import 'package:craftybay_ecommerce_application/presentation/ui/widgets/section_title.dart';
import 'package:flutter/material.dart';

class SelectProductColor extends StatefulWidget {
  const SelectProductColor({super.key, required this.colors, required this.onSelected, required this.initialSelected});
  final List<Color> colors;
  final Function(int selectIndex) onSelected;
  final int initialSelected;

  @override
  State<SelectProductColor> createState() => _SelectProductColorState();
}

class _SelectProductColorState extends State<SelectProductColor> {
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
                borderRadius: BorderRadius.circular(20),
                onTap: () {
                  _selectedColorIndex = index;
                  widget.onSelected(index);
                  if (mounted) {
                    setState(() {});
                  }
                },
                child: CircleAvatar(
                  radius: 18,
                  backgroundColor: widget.colors[index],
                  child: _selectedColorIndex == index
                      ? const Icon(
                          Icons.done,
                          color: Colors.white,
                        )
                      : null,
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
