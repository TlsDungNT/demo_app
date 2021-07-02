import 'dart:ui';

import 'package:demo_app/widgets/home_banner.dart';
import 'package:demo_app/widgets/home_electronic_wallet.dart';
import 'package:demo_app/widgets/home_hot_menus.dart';
import 'package:demo_app/widgets/home_menus.dart';
import 'package:demo_app/widgets/home_search_button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>  {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
          onTap: () {
            print('click body');
          },
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.pink.shade50,
                      Colors.white,
                      Colors.white,
                    ],
                  ),
                ),
              ),
              buildBody(context),
            ],
          )),
    );
  }
}

Widget buildBody(BuildContext context) {
  return SafeArea(
    child: SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      physics: ScrollPhysics(),
      child: Column(
        children: [
          HomeSearchWidget(),
          HomeBannerWidget(),
          HomeElectronicWallet(),
          HomeWidgetMenu(),
          HomeHotMenu(),
          buildBestSellingProduct(),
          buildListVocher(),
        ],
      ),
    ),
  );
}



Widget buildBestSellingProduct() {
  return Container(
    margin: const EdgeInsets.only(top: 16),
    decoration: BoxDecoration(
      color: Color(0xffdb2323),
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.7),
          spreadRadius: 1,
          blurRadius: 7,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ],
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        buildHeaderBestSellingProduct(),
        buildContentBestSellingProduct(),
      ],
    ),
  );
}

Widget buildHeaderBestSellingProduct() {
  return Row(
    children: [
      Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color(0xfff6f6f6),
        ),
        child: Icon(
          Icons.shopping_cart_rounded,
          color: Colors.orangeAccent,
        ),
      ),
      Container(
        margin: const EdgeInsets.only(left: 16),
        child: RichText(
            text: TextSpan(children: [
          TextSpan(
              text: "Sản phẩm bán chạy nhất\n",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          TextSpan(
              text: "Lựa chọn hàng đầu dành cho bạn",
              style: TextStyle(fontSize: 16)),
        ])),
      )
    ],
  );
}

Widget buildContentBestSellingProduct() {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.white,
    ),
    child: buildListItemBestSellingProduct(),
  );
}

Widget buildListItemBestSellingProduct() {
  return Container(
    height: 180,
    child: ListView.builder(
      primary: false,
      // physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 8,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return buildItemBestSellingProduct(index: index);
      },
    ),
  );
}

Widget buildItemBestSellingProduct({int index = 0}) {
  return Container(
    width: 128,
    child: Column(
      children: [
        Image(
            image: AssetImage("assets/banner_hotsell_1.jpg"), fit: BoxFit.fill),
        Text("Rau muống"),
        Visibility(
            visible: index == 0,
            child: Text(
              "50 000đ",
              style: TextStyle(
                  color: Colors.black87,
                  decoration: TextDecoration.lineThrough),
            )),
        Text("10 000đ",
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
      ],
    ),
  );
}

Widget buildListVocher() {
  return Container(
    margin: const EdgeInsets.all(16),
    height: 250,
    child: ListView.builder(
      primary: false,
      // physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 8,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return buildItemVocher(index: index);
      },
    ),
  );
}

Widget buildItemVocher({int index = 0}) {
  return Container(
    width: 250,
    margin: const EdgeInsets.only(right: 16, bottom: 16),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.7),
          spreadRadius: 1,
          blurRadius: 7,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            child: Image.asset(
              "assets/banner_hot_sell.jpg",
              fit: BoxFit.fill,
            )),
        Container(
            width: double.infinity,
            padding: const EdgeInsets.all(8),
            child: Text(
              "LAZADA",
              style: TextStyle(
                  color: Colors.black26,
                  fontWeight: FontWeight.w500,
                  fontSize: 16),
            )),
        Container(
            width: double.infinity,
            padding: const EdgeInsets.only(left: 8, bottom: 8),
            child: Text(
              "Giảm ngay 15,000 đ",
              style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                  fontSize: 16),
            )),
        Container(
            width: double.infinity,
            padding: const EdgeInsets.only(left: 8, bottom: 8),
            child: Row(
              children: [
                Icon(
                  Icons.shopping_cart_rounded,
                  color: Color(0xFF2f6bff),
                ),
                Text(
                  "100 điểm",
                  style: TextStyle(color: Color(0xFF2f6bff), fontSize: 16),
                )
              ],
            )),
      ],
    ),
  );
}
