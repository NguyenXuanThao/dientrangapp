import 'package:flutter/material.dart';

import '../../../../theme/app_colors.dart';

class TabHomeProductItem extends StatelessWidget {
  final String image;
  final String name;
  final VoidCallback? onTap;

  const TabHomeProductItem(
      {Key? key, required this.name, required this.image, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.grey6Color,
            ),
            child: Center(
              child: Image.asset(
                image,
                width: 30,
                height: 30,
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          SizedBox(
              width: 60,
              child: Center(
                  child: Text(
                name,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 12),
              )))
        ],
      ),
    );
  }
}
