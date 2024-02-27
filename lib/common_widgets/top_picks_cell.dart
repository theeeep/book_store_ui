import 'package:book_store_ui/common/color_extention.dart';
import 'package:flutter/material.dart';

class TopPicksCell extends StatelessWidget {
  final Map iObj;
  const TopPicksCell({super.key, required this.iObj});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return SizedBox(
      width: media.width * 0.32,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                    color: Colors.teal, offset: Offset(0, 2), blurRadius: 5),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                iObj["img"].toString(),
                width: media.width * 0.32,
                height: media.width * 0.50,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 15),
          Text(
            iObj["name"].toString(),
            textAlign: TextAlign.center,
            maxLines: 3,
            style: TextStyle(
              color: TColor.text,
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            iObj["author"].toString(),
            style: TextStyle(
              color: TColor.subTitle,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
