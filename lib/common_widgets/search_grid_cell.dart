// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:book_store_ui/common/color_extention.dart';

class SearchGrid extends StatelessWidget {
  final Map sObj;
  final int index;
  const SearchGrid({
    Key? key,
    required this.sObj,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: TColor.searchBGColor[index % TColor.searchBGColor.length],
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 2),
      child: Column(
        children: [
          Text(
            sObj["name"].toString(),
            maxLines: 1,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              sObj["img"].toString(),
              width: media.width * 0.24,
              height: media.width * 0.23 * 1.5,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
