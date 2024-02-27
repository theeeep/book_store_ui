import 'package:book_store_ui/common/color_extention.dart';
import 'package:flutter/material.dart';

class RecentlyCell extends StatelessWidget {
  final Map bObj;
  const RecentlyCell({super.key, required this.bObj});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      width: media.width * 0.32,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Colors.teal,
                  offset: Offset(0, 2),
                  blurRadius: 5,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                bObj["img"].toString(),
                width: media.width * 0.32,
                height: media.width * 0.50,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            bObj["name"].toString(),
            textAlign: TextAlign.left,
            maxLines: 3,
            style: TextStyle(
              color: TColor.text,
              fontSize: 13,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            bObj["author"].toString(),
            textAlign: TextAlign.left,
            style: TextStyle(
              color: TColor.subTitle,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}
