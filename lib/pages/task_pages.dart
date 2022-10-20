import 'package:flutter/material.dart';

import 'package:flutter_task_3/const/consts.dart';
import 'package:flutter_task_3/model/shop_model.dart';

class AppleShopPages extends StatefulWidget {
  static const path = 'apple shop';
  const AppleShopPages({Key? key}) : super(key: key);

  @override
  State<AppleShopPages> createState() => _AppleShopPagesState();
}

class _AppleShopPagesState extends State<AppleShopPages> {
  final List<ShopModel> _list = [];
  int _countFavourite = 0;
  Size? _size;
  @override
  void didChangeDependencies() {
    _size = MediaQuery.of(context).size;

    _list.addAll([
      ShopModel(image: MyImages.goldIphone.image, isFavourite: false),
      ShopModel(image: MyImages.iPad.image, isFavourite: true),
      ShopModel(image: MyImages.ihoneEight.image, isFavourite: false),
      ShopModel(image: MyImages.macBook.image, isFavourite: false),
      ShopModel(image: MyImages.goldIphone.image, isFavourite: false),
      ShopModel(image: MyImages.goldIphone.image, isFavourite: false),
      ShopModel(image: MyImages.appleRed.image, isFavourite: false),
      ShopModel(image: MyImages.iPad.image, isFavourite: false),
      ShopModel(image: MyImages.ihoneEight.image, isFavourite: false),
      ShopModel(image: MyImages.macBook.image, isFavourite: false),
      ShopModel(image: MyImages.goldIphone.image, isFavourite: false),
    ]);

    for (var item in _list) {
      if (item.isFavourite!) {
        _countFavourite++;
      }
    }
    setState(() {});
    super.didChangeDependencies();
  }

  bool? _changeFavourite(bool? isFavourite) => !isFavourite!;
  void _onCountedFavourite(bool? isFavourite) {
    if (isFavourite!) {
      _countFavourite++;
    } else if (!isFavourite) {
      _countFavourite--;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.grey,
        elevation: .0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            SizedBox(
              height: 10,
            ),
            Text(
              'Apple Product',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Center(child: const Text("Apple Products")),
        backgroundColor: Colors.deepOrange,
        elevation: .0,
        bottomOpacity: .0,
        actions: [
          Container(
            padding:
                const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
            margin: const EdgeInsets.only(
              right: 10,
              top: 10,
              bottom: 10,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.orange),
            child: Text(_countFavourite.toString()),
          ),
        ],
      ),
      backgroundColor: Colors.deepOrange,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            ///Lifestyle sale
            Padding(
              padding: const EdgeInsets.only(
                left: 10.0,
                right: 10,
                top: 15,
              ),
              child: Container(
                // height: _size!.width * 0.6,
                width: double.infinity,
                padding: const EdgeInsets.only(
                    bottom: 25, left: 40, right: 40, top: 80),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  image: DecorationImage(
                      image: AssetImage(MyImages.ihoneEight.image!),
                      fit: BoxFit.cover),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ///text
                    const Text(
                      "Lifestyle sale",
                      style: TextStyle(fontSize: 33, color: Colors.white),
                    ),
                    const SizedBox(
                      height: 40,
                    ),

                    ///Shop now button
                    SizedBox(
                      height: 45,
                      width: double.infinity,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: .0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                          ),
                          onPressed: () {},
                          child: const Text(
                            "Shop now",
                            style: TextStyle(color: Colors.black),
                          )),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),

            //items grid
            GridView.builder(
                padding: const EdgeInsets.only(
                  left: 10.0,
                  right: 10,
                  top: 15,
                ),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20),
                itemCount: _list.length,
                itemBuilder: (context, index) => InkWell(
                      splashColor: Colors.blue,
                      onTap: () {
                        bool? isFavourite =
                            _changeFavourite(_list[index].isFavourite);
                        _list[index].setFavourite = isFavourite;

                        _onCountedFavourite(isFavourite);
                        setState(() {});
                      },
                      borderRadius: BorderRadius.circular(20),
                      child: getCardItem(
                          image: _list[index].image,
                          isFavourite: _list[index].isFavourite),
                    ))
          ],
        ),
      )),
    );
  }

  Widget getCardItem({String? image, bool? isFavourite}) {
    return Card(
      elevation: .0,
      color: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: const EdgeInsets.all(0),
      child: Container(
        padding: const EdgeInsets.only(bottom: 310, right: 20),
        alignment: Alignment.bottomRight,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image:
                DecorationImage(fit: BoxFit.cover, image: AssetImage(image!))),
        child: Icon(
          isFavourite! ? Icons.favorite : Icons.favorite_border,
          size: 35,
          color: Colors.red,
        ),
      ),
    );
  }
}
