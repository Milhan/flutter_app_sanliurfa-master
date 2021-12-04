import 'package:flutter/material.dart';
import 'package:flutter_app_sanliurfa/core/colors.dart';
import 'package:flutter_app_sanliurfa/widget/app_baslik_text.dart';
import 'package:flutter_app_sanliurfa/widget/app_icerik_text.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  List tarihiMekanResim = [
    "one.jpg",
    "two.jpg",
    "tree.jpg",
  ];
  List yemeIcmeResim = [
    "yeme-icme-1.jpg",
    "yeme-icme-2.jpg",
    "yeme-icme-3.jpg",
    "yeme-icme-4.jpg",
    "yeme-icme-5.jpg",
  ];
  List onerilenMekan = [
    "onerilen-mekan-1.jpg",
    "onerilen-mekan-2.jpg",
    "onerilen-mekan-3.jpg",
  ];

  List kategoriler = [
    "onerilen-mekan-1.jpg",
    "onerilen-mekan-2.jpg",
    "onerilen-mekan-3.jpg",
    "onerilen-mekan-2.jpg",
    "onerilen-mekan-3.jpg",
  ];

  List kategorIsme = [
    "onerilen-mekan-1.jpg",
    "onerilen-mekan-2.jpg",
    "onerilen-mekan-3.jpg",
    "onerilen-mekan-2.jpg",
    "onerilen-mekan-3.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          appbarIcon(),
          SizedBox(height: 20),
          baslik(),
          SizedBox(height: 10),
          tabbarbaslik(tabController: _tabController),
          SizedBox(height: 15),
          Container(
            padding: EdgeInsets.only(left: 20),
            height: 300,
            width: double.maxFinite,
            child: TabBarView(
              controller: _tabController,
              children: [
                //4.1 Tabbar Tarihi Mekanlar
                tabbarViewDetay(disardanGelenListe: tarihiMekanResim),

                //4-2. Tabbar Yeme-İçme
                tabbarViewDetay(disardanGelenListe: yemeIcmeResim),

                //4-2. Tabbar Önerilen Mekanlar
                tabbarViewDetay(disardanGelenListe: onerilenMekan),
              ],
            ),
          ),
          SizedBox(height: 30),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppBaslikText(text: "Kategoriler", size: 20),
                ApppIcerikText(
                  text: "Hepsini Göster",
                  size: 13,
                  renk: AppColors.textColor2,
                )
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            height: 100,
            width: double.maxFinite,
            margin: EdgeInsets.only(left: 20),
            child: ListView.builder(
                itemCount: kategoriler.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {
                  return Container(
                    margin: EdgeInsets.only(right: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/" + kategoriler[index]),
                                  fit: BoxFit.cover),
                            )),
                        SizedBox(height: 5),
                        Container(
                          child: ApppIcerikText(
                            text: "Kaynak",
                            size: 12,
                            renk: AppColors.textColor2,
                          ),
                        )
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}

class tabbarViewDetay extends StatelessWidget {
  const tabbarViewDetay({
    Key? key,
    required this.disardanGelenListe,
  }) : super(key: key);

  final List disardanGelenListe;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: disardanGelenListe.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.only(right: 20),
            width: 200,
            height: 300,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                color: Colors.white,
                image: DecorationImage(
                    image: AssetImage(
                        "assets/images/" + disardanGelenListe[index]),
                    fit: BoxFit.cover)),
          );
        });
  }
}

class tabbarbaslik extends StatelessWidget {
  const tabbarbaslik({
    Key? key,
    required TabController tabController,
  })  : _tabController = tabController,
        super(key: key);

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      child: Align(
        alignment: Alignment.centerLeft,
        child: TabBar(
            labelPadding: EdgeInsets.only(left: 20, right: 20),
            controller: _tabController,
            labelColor: AppColors.mainColor,
            unselectedLabelColor: Colors.grey.withOpacity(0.5),
            isScrollable: true,
            indicatorSize: TabBarIndicatorSize.label,
            tabs: [
              Tab(
                  icon: Icon(Icons.dashboard_customize_sharp),
                  text: "Tarihi Mekanlar"),
              Tab(icon: Icon(Icons.food_bank_outlined), text: "Yeme-İçme"),
              Tab(icon: Icon(Icons.place_outlined), text: "Önerilen Mekanlar"),
            ]),
      ),
    );
  }
}

class baslik extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20),
      child: AppBaslikText(
        text: "Tarihin Sıfır Noktası",
      ),
    );
  }
}

class appbarIcon extends StatelessWidget {
  const appbarIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 70, left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.menu, color: Colors.black54),
          Icon(Icons.access_alarm),
        ],
      ),
    );
  }
}
