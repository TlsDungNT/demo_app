import 'package:demo_app/widgets/app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context: context, title: "Trang chủ"),
      body: buildBody(),
    );
  }
}

Widget buildBody() {
  return Container(
    width: double.infinity,
    height: double.infinity,
    padding: EdgeInsets.all(8),
    decoration: BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xffffc0c0),
            Color(0xfff9fdff),
            Color(0xfff9fdff),
            Color(0xfff9fdff),
            Color(0xfff9fdff),
            Color(0xfff9fdff),
            Color(0xfff9fdff),
            Color(0xfff9fdff),
          ]),
    ),
    child: SingleChildScrollView(
      physics: ScrollPhysics(),
      child: Column(
        children: [
          buildSearchbarAndCoint(),
          buildElectronicWallet(),
          buildMenus(),
          buildHotMenus(),
          buildBestSellingProduct(),
        ],
      ),
    ),
  );
}

Widget buildSearchbarAndCoint() {
  return Row(
    children: <Widget>[
      Flexible(child: buildSeach()),
      SizedBox(width: 16),
      buildCoint(),
    ],
  );
}

Widget buildSeach() {
  return Container(
    height: 48,
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.black26,
      borderRadius: BorderRadius.circular(50),
    ),
    child: TextField(
      autocorrect: false,
      textCapitalization: TextCapitalization.words,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          contentPadding: const EdgeInsets.all(8),
          hintText: 'Tìm kiếm',
          icon: Icon(
            Icons.search,
            color: Colors.white,
          ),
          fillColor: Colors.black26,
          hintStyle:
              TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
    ),
  );
}

Widget buildCoint() {
  return Container(
    height: 48,
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.black26,
      borderRadius: BorderRadius.circular(50),
    ),
    child: Row(
      children: [
        Icon(
          Icons.shopping_cart_rounded,
          color: Colors.white,
        ),
        SizedBox(
          width: 8,
        ),
        Text(
          "1 000",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
        )
      ],
    ),
  );
}

Widget buildElectronicWallet() {
  return Container(
    margin: const EdgeInsets.only(top: 16),
    padding: const EdgeInsets.all(8),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
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
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                  child: Text(
                "Số dư ví",
                style: TextStyle(color: Colors.black87, fontSize: 16),
              )),
              Text(
                "1 000 000 đ",
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              Icon(
                Icons.add_circle,
                color: Colors.blue,
              ),
            ],
          ),
        ),
        Container(
          height: 1,
          width: double.infinity,
          color: Colors.black26,
        ),
        Container(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              Expanded(
                child: buildItemElectronicWallet(
                    imageName: "assets/icon_waller.jpg", title: "Nạp tiền"),
                flex: 1,
              ),
              Expanded(
                child: buildItemElectronicWallet(
                    imageName: "assets/icon_barcode.png", title: "Quét mã"),
                flex: 1,
              ),
              Expanded(
                child: buildItemElectronicWallet(
                    imageName: "assets/icon_send.jpg", title: "Chuyển tiền"),
                flex: 1,
              ),
              Expanded(
                child: buildItemElectronicWallet(
                    imageName: "assets/icon_history.jpg", title: "Giao dịch"),
                flex: 1,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget buildItemElectronicWallet(
    {required String imageName, required String title}) {
  return Column(
    children: [
      Image(
        image: AssetImage(imageName),
        width: 48,
      ),
      SizedBox(
        height: 8,
      ),
      Text(title),
    ],
  );
}

Widget buildMenus() {
  return Column(
    children: [
      Container(
        padding: const EdgeInsets.only(top: 16, bottom: 16),
        child: GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
          itemBuilder: (ctx, index) {
            return buildItemMenu();
          },
          itemCount: 7,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Xem tất cả dịch vụ ",
            style: TextStyle(
                color: Color(0xFF2f6bff), fontWeight: FontWeight.bold),
          ),
          Container(
            child: Text(
              "Mới",
              style: TextStyle(color: Colors.white),
            ),
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Color(0xffdb2323),
              borderRadius: BorderRadius.circular(30),
            ),
          )
        ],
      ),
    ],
  );
}

Widget buildItemMenu() {
  return Column(
    children: [
      Container(
        height: 64,
        width: 64,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.orangeAccent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon(
          Icons.shopping_cart,
          color: Colors.white,
          size: 32,
        ),
      ),
      SizedBox(
        height: 8,
      ),
      Text(
        "Đi chợ",
        style: TextStyle(fontSize: 16),
      ),
    ],
  );
}

Widget buildHotMenus() {
  final double widthItem = 150;
  final double heightItem = 220;
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Text("Đừng bỏ lỡ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),),
      GridView.builder(
        gridDelegate:
        SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
        childAspectRatio: widthItem/heightItem),
        itemBuilder: (ctx, index) {
          return buildHotMenuItem(withItem: widthItem, heightItem: heightItem);
        },
        itemCount: 6,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
      ),
    ],
  );
}

Widget buildHotMenuItem({required double withItem, required double heightItem}) {
  return Container(
    margin: const EdgeInsets.all(8),
    width: withItem,
    height: heightItem,
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
      children: <Widget>[
        ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            child: Image.asset(
              "assets/banner_hotmenu.jpg",
              fit: BoxFit.fill,
            )),
        Container(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
            child: Text(
              "Trà vải tươi dầm phúc long - Giảm 40%",
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
          child: Row(
            children: [
              Icon(
                Icons.arrow_circle_down,
                color: Color(0xffd33333),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                "Nhận ngay",
                style: TextStyle(
                    color: Color(0xff355586), fontWeight: FontWeight.bold),
              )
            ],
          ),
        )
      ],
    ),
  );
}

Widget buildBestSellingProduct(){
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


Widget buildHeaderBestSellingProduct(){
  return Row(
    children: [
      Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color(0xfff6f6f6),
        ),
        child: Icon(Icons.shopping_cart_rounded, color: Colors.orangeAccent,),
      ),
      Container(
        margin: const EdgeInsets.only(left: 16),
        child: RichText(text: TextSpan(
            children: [
              TextSpan(text: "Sản phẩm bán chạy nhất\n", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              TextSpan(text: "Lựa chọn hàng đầu dành cho bạn", style: TextStyle(fontSize: 16)),
            ]
        )),
      )
    ],
  );
}

Widget buildContentBestSellingProduct(){
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.white,
    ),
    child: buildListItemBestSellingProduct(),
  );
}

Widget buildListItemBestSellingProduct(){
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

Widget buildItemBestSellingProduct({int index = 0}){
  return Container(
    width: 128,
    child: Column(
      children: [
        Image(image: AssetImage("assets/banner_hotsell_1.jpg"), fit: BoxFit.fill),
        Text("Rau muống"),
        Visibility(
            visible: index == 0,
            child: Text("50 000đ", style: TextStyle(color: Colors.black87, decoration: TextDecoration.lineThrough),)),
        Text("10 000đ", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
      ],
    ),
  );
}
