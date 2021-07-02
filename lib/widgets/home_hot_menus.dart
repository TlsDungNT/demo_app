import 'package:demo_app/model/HotMenu.dart';
import 'package:flutter/material.dart';

class HomeHotMenu extends StatefulWidget {
  const HomeHotMenu({Key? key}) : super(key: key);

  @override
  _HomeHotMenuState createState() => _HomeHotMenuState();
}

class _HomeHotMenuState extends State<HomeHotMenu> {
  final lstHotMenus = <HotMenu>[];

  @override
  void initState() {
    lstHotMenus.addAll([
      HotMenu("https://cdn-www.vinid.net/fd9096db-news-web-2-219x123.jpg", "Sale ào ào như mưa rào tháng 6", Icons.assignment_ind_sharp, "Tham gia ngay"),
      HotMenu("https://cdn-www.vinid.net/2da1a21a-pl_web-1024x576.jpg", "Trà vải Phúc Long giảm 40%", Icons.remove_red_eye, "Xem ngay"),
      HotMenu("https://cdn-www.vinid.net/80f663e0-mcdonalds_web-1024x576.jpg", "[Hà Nội + Miền Nam] McDonald's giảm giá tới 50%", Icons.remove_red_eye, "Xem ngay"),
      HotMenu("https://cdn-www.vinid.net/f33dd059-venuco-1024x576.jpg", "Voucher Venuco Giảm thêm 15%", Icons.remove_red_eye, "Xem ngay"),
      HotMenu("https://cdn-www.vinid.net/8396ff50-merriman_web-1024x576.jpg", "[Toàn quốc] Thời trang nam Merriman giảm 200K", Icons.remove_red_eye, "Xem ngay"),
      HotMenu("https://cdn-www.vinid.net/2020/04/390c3573-20200403_appvinid_bannerweb_dottie-1024x576.jpg", " [Toàn quốc] Thời trang Dottie giảm 100K áp dụng cả hàng sale ", Icons.remove_red_eye, "Xem ngay"),
    ]);
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        children: [
          buildHeader(),
          buildBody(),
        ],
      ),
    );
  }


Widget buildHeader() {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: Row(
      children: [
        Expanded(
            child: Text(
              'VinID có gì hot?',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            )),
        TextButton(
          onPressed: () {},
          child: Text(
            'Tất cả',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    ),
  );
}

Widget buildBody() {
  return Container(
    child: GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1.1,
      ),
      itemBuilder: (ctx, index) {
        return buildItem(lstHotMenus[index]);
      },
      itemCount: lstHotMenus.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
    ),
  );
}

Widget buildItem(HotMenu hotMenu) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      boxShadow: [
        const BoxShadow(
          color: Color.fromRGBO(25, 1, 52, 0.12),
          blurRadius: 2,
          spreadRadius: 0,
          offset: Offset(0, 1),
        )
      ],
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Image.network(
                hotMenu.urlImage),
            const SizedBox(height: 8),
            Flexible(
              child: Text(
                hotMenu.title,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(hotMenu.iconData, size: 16, color: Colors.red[300],),
                Text(hotMenu.titleAction, style: TextStyle(fontSize: 12, color: Colors.blue[800]),)
              ],
            )
          ],
        ),
      ),
    ),
  );
}
}