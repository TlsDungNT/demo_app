import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class HomeSearchWidget extends StatelessWidget {
  const HomeSearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: buildSearchButton()),
        const SizedBox(
          width: 16,
        ),
        buildGiftButton(),
      ],
    );
  }

  Widget buildSearchButton() {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16),
      height: 40,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(50)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.search),
          const SizedBox(
            width: 16,
          ),
          DefaultTextStyle(
              style: const TextStyle(fontSize: 16, color: Colors.black38),
              child: AnimatedTextKit(
                animatedTexts: [
                  RotateAnimatedText("Bạn đang muốn tìm..."),
                  RotateAnimatedText("Nạp điểm"),
                  RotateAnimatedText("Ưu đãi, giảm giá"),
                  RotateAnimatedText("Phúc Long, Tocotoco"),
                ],
                repeatForever: true,
                pause: Duration(milliseconds: 300),
              ))
        ],
      ),
    );
  }

  Widget buildGiftButton() {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(50)),
      child: Icon(Icons.card_giftcard_outlined),
    );
  }
}