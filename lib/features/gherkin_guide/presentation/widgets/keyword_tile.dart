import 'package:flutter/material.dart';
import '../../../../app/theme/app_colors.dart';

class KeywordTile extends StatelessWidget {
  const KeywordTile(
      {super.key, required this.keyword, required this.description});
  final String keyword;
  final String description;
  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.only(bottom: 9),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.line)),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 7),
              decoration: BoxDecoration(
                  color: AppColors.mint,
                  borderRadius: BorderRadius.circular(9)),
              child: Text(keyword,
                  style: const TextStyle(
                      fontWeight: FontWeight.w800,
                      color: AppColors.navy,
                      fontSize: 12))),
          const SizedBox(width: 12),
          Expanded(
              child: Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(description,
                      style: const TextStyle(fontSize: 12.5, height: 1.4)))),
        ]),
      );
}
