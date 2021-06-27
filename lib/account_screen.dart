import 'package:demo_app/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context: context, title: "Tài khoản"),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.only(top: 8, bottom: 8),
      color: Colors.black12,
      child: SingleChildScrollView(
        child: Column(
          children: [
            buildProfile(),
            SizedBox(height: 8),
            buildListMenu(),
            buildRate()
          ],
        ),
      ),
    );
  }

  Widget buildProfile() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Color(0xffffd662),
              borderRadius: BorderRadius.circular(50),
            ),
            child: CircleAvatar(
              child: Text(
                'DN',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              backgroundColor: Color(0xffffebb0),
              foregroundColor: Colors.white,
            ),
          ),
          SizedBox(
            width: 16,
          ),
          Expanded(
            child: RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: "Nguyễn Tiến Dũng \n",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              TextSpan(
                  text: "0984 998 545",
                  style: TextStyle(height: 1.5, color: Colors.black54)),
            ], style: TextStyle(color: Colors.black87))),
          ),
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Color(0xfffff2e9),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              "Chưa xác thực",
              style: TextStyle(color: Color(0xffff821e)),
            ),
          ),
          Icon(
            Icons.keyboard_arrow_right,
            color: Colors.black54,
            size: 32,
          )
        ],
      ),
    );
  }

  Widget buildListMenu() {
    return ListView.separated(
      itemCount: 8,
      separatorBuilder: (BuildContext context, int index) {
        return Container(
          color: Colors.white,
          child: Divider(
            height: 1,
            indent: 32,
            endIndent: 16,
          ),
        );
      },
      itemBuilder: (BuildContext context, int index) {
        return buildMenu(index: index);
      },
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
    );
  }

  Widget buildMenu({int index = 0}) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      child: Row(
        children: [
          CircleAvatar(
            child: Icon(Icons.card_giftcard),
            foregroundColor: Colors.redAccent,
            backgroundColor: Colors.white,
          ),
          SizedBox(
            width: 16,
          ),
          Expanded(
              child: Text(
            "Điểm tích luỹ",
            style: TextStyle(fontSize: 16, color: Colors.black87),
          )),
          Visibility(
            visible: index == 0,
            child: Icon(
              Icons.volunteer_activism,
              color: Color(0xff355586),
            ),
          ),
          Visibility(
            visible: index == 0,
            child: Text("1,000 điểm",
                style: TextStyle(color: Color(0xff355586), fontSize: 16)),
          ),
          Icon(
            Icons.keyboard_arrow_right,
            color: Colors.black54,
            size: 32,
          )
        ],
      ),
    );
  }

  Widget buildRate() {
    return Container(
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Color(0xffffe6d7),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.7),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: RichText(
                    text: TextSpan(
                        style: TextStyle(color: Colors.black87),
                        children: [
                          TextSpan(
                              text: "Đánh giá của bạn",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                          TextSpan(text: "\n"),
                          TextSpan(
                              text:
                                  "Sẽ thật tuyệt vời nếu VinID nhận được đánh giá của bạn nhằm nâng cao chất lượng dịch vụ")
                        ]),
                  ),
                  flex: 3,
                ),
                Expanded(
                  child: Image(
                    image: AssetImage("assets/img_rocket.png"),
                  ),
                  flex: 1,
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))),
            child: Row(
              children: [
                Expanded(
                  child: Icon(
                    Icons.star_rounded,
                    size: 32,
                    color: Colors.black54,
                  ),
                  flex: 1,
                ),
                Expanded(
                  child: Icon(
                    Icons.star_rounded,
                    size: 32,
                    color: Colors.black54,
                  ),
                  flex: 1,
                ),
                Expanded(
                  child: Icon(
                    Icons.star_rounded,
                    size: 32,
                    color: Colors.black54,
                  ),
                  flex: 1,
                ),
                Expanded(
                  child: Icon(
                    Icons.star_rounded,
                    size: 32,
                    color: Colors.black54,
                  ),
                  flex: 1,
                ),
                Expanded(
                  child: Icon(
                    Icons.star_rounded,
                    size: 32,
                    color: Colors.black54,
                  ),
                  flex: 1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
