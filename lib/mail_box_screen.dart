import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MailBoxScreen extends StatefulWidget {
  const MailBoxScreen({Key? key}) : super(key: key);

  @override
  _MailBoxScreenState createState() => _MailBoxScreenState();
}

class _MailBoxScreenState extends State<MailBoxScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return SafeArea(
      child: ListView.separated(
        itemCount: 3,
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemBuilder: (BuildContext context, int index) {
          return buildListMailBox(
              index: index,
              iconAvatar: Icons.alarm,
              backgroundAvatar: Colors.green,
              titleMsg: "Thông báo",
              contentMsg:
                  "Cập nhật thông tin giao dịch hoàn thành",
              dateMsg: "26/06/2021");
        },
      ),
    );
  }

  Widget buildListMailBox(
      {required int index,
      required IconData iconAvatar,
      required Color backgroundAvatar,
      required String titleMsg,
      required String contentMsg,
      required String dateMsg}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          CircleAvatar(
            child: Icon(iconAvatar),
            backgroundColor: backgroundAvatar,
            foregroundColor: Colors.white,
          ),
          SizedBox(
            width: 16,
          ),
          Expanded(
            child: RichText(
                text: TextSpan(children: [
              TextSpan(
                text: "${titleMsg}\n",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: contentMsg,
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
              )
            ], style: TextStyle(color: Colors.black87))),
          ),
          Text(
            dateMsg,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
