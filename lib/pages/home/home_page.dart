import 'package:ajari_app_v2/pages/home/category/category_all.dart';
import 'package:ajari_app_v2/pages/home/category/category_mudah.dart';
import 'package:ajari_app_v2/pages/home/category/category_sedang.dart';
import 'package:ajari_app_v2/pages/home/category/category_sulit.dart';
import 'package:ajari_app_v2/utils/artikel_card.dart';
import 'package:ajari_app_v2/utils/theme.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TextEditingController searchController = TextEditingController();
  late FocusNode focusNodeSearch;

  List imageArtikel = [
    'assets/images/article1.png',
    'assets/images/article2.png',
    'assets/images/article1.png',
  ];

  List titleArtikel = [
    'Perkembangan Bahasa Isyarat di Bali ',
    'Manfaat Belajar Bahasa Isyarat Menurut Para Ahli',
    'Bagaimana Pendidikan Anak Tuna Rungu yang Baik dan Benar',
  ];

  bool selectSemua = false;
  bool selectMudah = false;
  bool selectSedang = false;
  bool selectSulit = false;

  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    focusNodeSearch = FocusNode();
    tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    focusNodeSearch.dispose();
    searchController.dispose();
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget userProfile() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Container(
                height: 50,
                width: 50,
                child: Image.asset("assets/images/image_user.png"),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Selamat pagi",
                  style: regulerTextStyle.copyWith(color: darkGrayColor),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  "Krisna Erlangga",
                  style: semiBoldTextStyle.copyWith(fontSize: 18),
                ),
              ],
            )
          ],
        ),
      );
    }

    Widget searchTextField() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: GestureDetector(
          onTap: () {
            focusNodeSearch.requestFocus();
          },
          child: Container(
            height: 50,
            width: double.infinity - 48,
            decoration: BoxDecoration(
              // color: (focusNodeEmail.hasFocus) ? purpleColor : grayColor,
              color: grayColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                Icon(
                  Icons.search,
                  size: 22,
                  color: darkGrayColor,
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TextField(
                    obscureText: true,
                    focusNode: focusNodeSearch,
                    controller: searchController,
                    style: regulerTextStyle,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Cari',
                      hintStyle: regulerTextStyle.copyWith(
                        color: darkGrayColor,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    }

    Widget artikel() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              "Artikel",
              style: semiBoldTextStyle.copyWith(fontSize: 16),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 120,
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: imageArtikel.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(
                    left: (index == 0) ? 24 : 0,
                    right: (index == imageArtikel.length) ? 0 : 20,
                  ),
                  child: ArtikelCard(
                    imageUrl: imageArtikel[index],
                    title: titleArtikel[index],
                  ),
                );
              },
            ),
          )
        ],
      );
    }

    Widget categories() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: DefaultTabController(
          length: 4,
          child: TabBar(
            overlayColor: MaterialStateProperty.all(Colors.transparent),
            indicatorWeight: 0,
            splashFactory: NoSplash.splashFactory,
            controller: tabController,
            unselectedLabelColor: purpleColor,
            labelColor: whiteColor,
            labelStyle: mediumTextStyle.copyWith(fontSize: 13),
            labelPadding: const EdgeInsets.symmetric(
              horizontal: 6,
              vertical: 0,
            ),
            indicatorSize: TabBarIndicatorSize.label,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: purpleColor,
            ),
            tabs: [
              Tab(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(
                      color: purpleColor,
                      width: 2,
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Semua",
                    ),
                  ),
                ),
              ),
              Tab(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(
                      color: purpleColor,
                      width: 2,
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Mudah",
                    ),
                  ),
                ),
              ),
              Tab(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(
                      color: purpleColor,
                      width: 2,
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Sedang",
                    ),
                  ),
                ),
              ),
              Tab(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(
                      color: purpleColor,
                      width: 2,
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Sulit",
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget categories_body() {
      return Expanded(
        child: TabBarView(
          controller: tabController,
          physics: NeverScrollableScrollPhysics(),
          children: [
            CategoryAll(),
            CategoryMudah(),
            CategorySedang(),
            CategorySulit(),
          ],
        ),
      );
    }
    // Widget categories() {
    //   return Row(
    //     mainAxisAlignment: MainAxisAlignment.spaceAround,
    //     children: [
    //       SizedBox(
    //         width: 24,
    //       ),
    //       GestureDetector(
    //         onTap: () {
    //           setState(() {
    //             selectSemua = !selectSemua;
    //             if (selectSedang) {
    //               selectSedang = false;
    //             }
    //             if (selectSulit) {
    //               selectSulit = false;
    //             }
    //             if (selectMudah) {
    //               selectMudah = false;
    //             }
    //             print(selectSemua);
    //           });
    //         },
    //         child: Container(
    //           padding: EdgeInsets.symmetric(
    //             horizontal: 16,
    //             vertical: 10,
    //           ),
    //           decoration: BoxDecoration(
    //             borderRadius: BorderRadius.circular(18),
    //             color: (selectSemua) ? purpleColor : whiteColor,
    //             border: Border.all(
    //               color: purpleColor,
    //               width: 2,
    //             ),
    //           ),
    //           child: Text(
    //             "Semua",
    //             style: mediumTextStyle.copyWith(
    //               fontSize: 12,
    //               color: (selectSemua) ? whiteColor : purpleColor,
    //             ),
    //           ),
    //         ),
    //       ),
    //       GestureDetector(
    //         onTap: () {
    //           setState(() {
    //             selectMudah = !selectMudah;
    //             if (selectSedang) {
    //               selectSedang = false;
    //             }
    //             if (selectSulit) {
    //               selectSulit = false;
    //             }
    //             if (selectSemua) {
    //               selectSemua = false;
    //             }
    //             print(selectMudah);
    //           });
    //         },
    //         child: Container(
    //           padding: EdgeInsets.symmetric(
    //             horizontal: 16,
    //             vertical: 10,
    //           ),
    //           decoration: BoxDecoration(
    //             borderRadius: BorderRadius.circular(18),
    //             color: (selectMudah) ? purpleColor : whiteColor,
    //             border: Border.all(
    //               color: purpleColor,
    //               width: 2,
    //             ),
    //           ),
    //           child: Text(
    //             "Mudah",
    //             style: mediumTextStyle.copyWith(
    //               fontSize: 12,
    //               color: (selectMudah) ? whiteColor : purpleColor,
    //             ),
    //           ),
    //         ),
    //       ),
    //       GestureDetector(
    //         onTap: () {
    //           setState(() {
    //             selectSedang = !selectSedang;
    //             if (selectMudah) {
    //               selectMudah = false;
    //             }
    //             if (selectSulit) {
    //               selectSulit = false;
    //             }
    //             if (selectSemua) {
    //               selectSemua = false;
    //             }
    //             print(selectSedang);
    //           });
    //         },
    //         child: Container(
    //           padding: EdgeInsets.symmetric(
    //             horizontal: 16,
    //             vertical: 10,
    //           ),
    //           decoration: BoxDecoration(
    //             borderRadius: BorderRadius.circular(18),
    //             color: (selectSedang) ? purpleColor : whiteColor,
    //             border: Border.all(
    //               color: purpleColor,
    //               width: 2,
    //             ),
    //           ),
    //           child: Text(
    //             "Sedang",
    //             style: mediumTextStyle.copyWith(
    //               fontSize: 12,
    //               color: (selectSedang) ? whiteColor : purpleColor,
    //             ),
    //           ),
    //         ),
    //       ),
    //       GestureDetector(
    //         onTap: () {
    //           setState(() {
    //             selectSulit = !selectSulit;
    //             if (selectSedang) {
    //               selectSedang = false;
    //             }
    //             if (selectMudah) {
    //               selectMudah = false;
    //             }
    //             if (selectSemua) {
    //               selectSemua = false;
    //             }
    //             print(selectSulit);
    //           });
    //         },
    //         child: Container(
    //           padding: EdgeInsets.symmetric(
    //             horizontal: 16,
    //             vertical: 10,
    //           ),
    //           decoration: BoxDecoration(
    //             borderRadius: BorderRadius.circular(18),
    //             color: (selectSulit) ? purpleColor : whiteColor,
    //             border: Border.all(
    //               color: purpleColor,
    //               width: 2,
    //             ),
    //           ),
    //           child: Text(
    //             "Sulit",
    //             style: mediumTextStyle.copyWith(
    //               fontSize: 12,
    //               color: (selectSulit) ? whiteColor : purpleColor,
    //             ),
    //           ),
    //         ),
    //       ),
    //       SizedBox(
    //         width: 24,
    //       ),
    //     ],
    //   );
    // }

    Widget body() {
      return Container(
        // padding: con st EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 24,
            ),
            userProfile(),
            const SizedBox(
              height: 24,
            ),
            searchTextField(),
            const SizedBox(
              height: 24,
            ),
            artikel(),
            const SizedBox(
              height: 24,
            ),
            categories(),
            categories_body(),
          ],
        ),
        // child: Container(
        //   width: MediaQuery.of(context).size.width - 48,
        //   height: double.minPositive,
        //   child: ListView(
        //     children: [
        //       const SizedBox(
        //         height: 24,
        //       ),
        //       userProfile(),
        //       const SizedBox(
        //         height: 24,
        //       ),
        //       searchTextField(),
        //       const SizedBox(
        //         height: 24,
        //       ),
        //       artikel(),
        //       const SizedBox(
        //         height: 24,
        //       ),
        //       categories(),
        //       categories_body(),
        //     ],
        //   ),
        // ),
      );
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: whiteColor,
        body: body(),
      ),
    );
  }
}
