import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NavItem extends StatelessWidget {
  final String svgPath;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const NavItem({
    super.key,
    required this.svgPath,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            svgPath,
            colorFilter: ColorFilter.mode(
              selected ? Colors.blue : Colors.grey,
              BlendMode.srcIn,
            ),
            width: 24,
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              color: selected ? Colors.blue : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
