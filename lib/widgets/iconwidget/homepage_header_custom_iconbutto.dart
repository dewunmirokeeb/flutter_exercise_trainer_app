import 'package:flutter/material.dart';

class AppCustomIconButton extends StatelessWidget {
  const AppCustomIconButton({
    required this.icon,
    required this.onTap,
    required this.color,
    this.size,
    Key? key,
  }) : super(key: key);

  final Function() onTap;
  final IconData icon;
  final double? size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: Icon(
          icon,
          size: size ?? 25,
          color: color,
        ),
      ),
    );
  }
}
