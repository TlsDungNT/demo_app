import 'package:demo_app/account_screen.dart';
import 'package:demo_app/home_screen.dart';
import 'package:demo_app/mail_box_screen.dart';
import 'package:demo_app/member_ship_screen.dart';
import 'package:demo_app/scan_screen.dart';
import 'package:demo_app/utilities/dialog/input_dialog.dart';
import 'package:demo_app/utilities/fade_index_stack.dart';
import 'package:demo_app/utilities/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppAdmin extends StatefulWidget {
  const AppAdmin({Key? key}) : super(key: key);

  @override
  _AppAdminState createState() => _AppAdminState();
}

class _AppAdminState extends State<AppAdmin>
    with SingleTickerProviderStateMixin {
  late HomeScreen homeScreen;
  late MemberShipScreen memberShipScreen;
  late ScanScreen scanScreen;
  late MailBoxScreen mailBoxScreen;
  late AccountScreen accountScreen;

  late TabController tabController;

  final screen = <Widget>[];
  final items = <BottomNavigationBarItem>[];
  var currentTabIndex = 0;

  DateTime dateTime = DateTime.now();

  final inputValue = TextEditingController();

  @override
  void dispose() {
    inputValue.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void initState() {
    homeScreen = HomeScreen();
    memberShipScreen = MemberShipScreen();
    scanScreen = ScanScreen();
    mailBoxScreen = MailBoxScreen();
    accountScreen = AccountScreen();

    screen.addAll([
      homeScreen,
      memberShipScreen,
      scanScreen,
      mailBoxScreen,
      accountScreen,
    ]);

    items.addAll([
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        activeIcon: Icon(Icons.home),
        label: 'Trang chủ',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.card_membership),
        activeIcon: Icon(Icons.card_membership),
        label: 'Đặc quyền',
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.home,
          color: Colors.transparent,
        ),
        label: '',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.message),
        activeIcon: Icon(Icons.message),
        label: 'Hộp thư',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person),
        activeIcon: Icon(Icons.person),
        label: 'Tài khoản',
      ),
    ]);

    tabController =
        TabController(length: items.length, initialIndex: 0, vsync: this);
    tabController.addListener(() {
      print('click tap');
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(),
      bottomNavigationBar: buildBottomNavigationBar(),
      floatingActionButton: GestureDetector(
        onTap: () {
          showInputDialog(
              inputValue: inputValue,
              context: context,
              message: "",
              onConfirm: () {
                print('Nội dung: ${inputValue.text}');
              });
        },
        child: Container(
          padding: const EdgeInsets.only(top: 52),
          child: Container(
            height: 40,
            width: 40,
            child: Icon(
              Icons.qr_code_scanner,
              color: Colors.white,
            ),
            decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(Radius.circular(12))),
          ),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
    );
  }

  Widget buildBody() {
    return FadeIndexedStack(index: currentTabIndex, children: screen);
    // return IndexedStack(
    //   index: currentTabIndex,
    //   children: screen,
    // );
  }

  Widget buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: items,
      currentIndex: currentTabIndex,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedLabelStyle: TextStyle(fontSize: 12),
      onTap: (index) {
        if (index == 1) {
          Utils.showSheet(
            context,
            child: buildDatePicker(),
            onClicked: () {
              final value = DateFormat('dd/MM/yyyy').format(dateTime);
              print('date: $value');
              // Utils.showSnackBar(context, 'Selected "$value"');
              //
              Navigator.pop(context);
            },
          );
          // final values = ['Ha Noi', 'Ho Chi MInh'];
          // showValueBottomSheet(
          //   context: context,
          //   values: values,
          //   title: 'Localtion',
          //   onSelected: (index, value) {
          //     print('$index - $value');
          //   },
          // );
        } else if (index != currentTabIndex) {
          setState(() {
            currentTabIndex = index;
          });
        }
      },
      selectedItemColor: Colors.red,
      backgroundColor: Colors.white,
    );
  }

  Widget buildDatePicker() => SizedBox(
        height: 180,
        child: CupertinoDatePicker(
          minimumYear: 2015,
          maximumYear: DateTime.now().year,
          initialDateTime: dateTime,
          mode: CupertinoDatePickerMode.date,
          use24hFormat: true,
          onDateTimeChanged: (dateTime) =>
              setState(() => this.dateTime = dateTime),
        ),
      );
}
