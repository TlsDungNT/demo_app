import 'package:demo_app/model/Menu.dart';
import 'package:flutter/material.dart';

class HomeWidgetMenu extends StatefulWidget {
  const HomeWidgetMenu({Key? key}) : super(key: key);

  @override
  _HomeWidgetMenuState createState() => _HomeWidgetMenuState();
}

class _HomeWidgetMenuState extends State<HomeWidgetMenu> {
  final lstMenu = <Menu>[];

  @override
  void initState() {
    lstMenu.addAll([
      Menu("ic_function_maket.png", "Đi chợ"),
      Menu("ic_function_food.png", "Ăn uống"),
      Menu("ic_function_vinmart.png", "VinMart"),
      Menu("ic_function_maket.png", "Vincom"),
      Menu("ic_service_utility_payment.png", "Tiện ích"),
      Menu("ic_service_my_house.png", "Vinhomes"),
      Menu("ic_function_tech.png", "Techcombank"),
    ]);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = 4;
    final height = 5;
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: width / height,
        mainAxisSpacing: 8,
        crossAxisSpacing: 24,
      ),
      itemBuilder: (ctx, index) {
        final menu = lstMenu[index];
        return buildItemMenu(menu);
      },
      itemCount: lstMenu.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
    );
  }

  Widget buildItemMenu(Menu menuIteam) {
    return Container(
      child: Wrap(
        alignment: WrapAlignment.center,
        children: [
          Container(
              margin: const EdgeInsets.all(8),
              child: Image.asset("assets/${menuIteam.images}", fit: BoxFit.cover,)),
          Text("${menuIteam.title}", textAlign: TextAlign.center,style: TextStyle(fontSize: 12),),
        ],
      ),
    );
  }
}