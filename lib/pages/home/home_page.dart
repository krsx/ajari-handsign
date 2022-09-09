import 'package:ajari_app_v2/utils/artikel_card.dart';
import 'package:ajari_app_v2/utils/theme.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController = TextEditingController();
  late FocusNode focusNodeSearch;

  @override
  void initState() {
    // TODO: implement initState
    focusNodeSearch = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    focusNodeSearch.dispose();
    searchController.dispose();
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
            height: 60,
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
                      hintText: 'Password',
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
          SizedBox(
            height: 24,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              "Artikel",
              style: semiBoldTextStyle.copyWith(fontSize: 16),
            ),
          ),
          Container(
            height: 140,
            child: ListView(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              children: [
                ArtikelCard(),
                ArtikelCard(),
                ArtikelCard(),
              ],
            ),
          )
        ],
      );
    }

    Widget body() {
      return Container(
        // padding: const EdgeInsets.symmetric(horizontal: 24),
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
            artikel(),
          ],
        ),
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
