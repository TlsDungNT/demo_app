import 'package:flutter/material.dart';

class HomeElectronicWallet extends StatelessWidget {
  const HomeElectronicWallet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildElectronicWallet();
  }


  Widget buildElectronicWallet() {
    return Container(
      child: Row(
        children: [
          Expanded(
              child: buildIteamElectronicWallet(Icons.ac_unit, "Điểm tích luỹ",
                  "1,000", Icons.keyboard_arrow_right)),
          const SizedBox(
            width: 16,
          ),
          Expanded(
              child: buildIteamElectronicWallet(Icons.account_balance_wallet,
                  "Ví của tôi", "0đ", Icons.keyboard_arrow_right)),
        ],
      ),
    );
  }

  Widget buildIteamElectronicWallet(
      IconData iconData, String title, String subTitle, IconData iconDataRight) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 1, color: Colors.black12),
          color: Colors.white),
      child: Row(
        children: [
          Icon(
            iconData,
            color: Colors.blueAccent,
            size: 20,
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: "${title}",
                    style: TextStyle(color: Colors.black54, fontSize: 16)),
                TextSpan(text: "\n"),
                TextSpan(
                    text: "${subTitle}",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
              ]),
            ),
          ),
          Icon(
            iconDataRight,
            color: Colors.blueAccent,
            size: 20,
          ),
        ],
      ),
    );
  }
}


