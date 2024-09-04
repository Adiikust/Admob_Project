import 'package:admob/core/constants/constants.dart';
import 'package:admob/core/utils/ad_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  RxBool isBottomBannerAdLoaded = false.obs;
  BannerAd? bannerAd;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadBannerAd();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: Constants.admob.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              alignment: Alignment.center,
              color: Colors.brown,
              child: Text(
                Constants.admob[index],
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            );
          },
        ),
      ),
      persistentFooterButtons: [
        isBottomBannerAdLoaded.value
            ? Align(
                alignment: Alignment.center,
                child: Container(
                  color: Colors.red,
                  width: bannerAd?.size.width.toDouble(),
                  height: bannerAd?.size.height.toDouble(),
                  child: AdWidget(ad: bannerAd!),
                ),
              )
            : Container(
                height: 50,
                width: double.maxFinite,
                color: Colors.red,
              )
      ],
    );
  }

  Future<void> loadBannerAd() async {
    BannerAd(
      size: AdSize.banner,
      adUnitId: AdHelper.bannerAdUnitId,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          print("Banner Ad loaded");
          bannerAd = ad as BannerAd?;
          isBottomBannerAdLoaded.value = true;
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
          print("Banner failed to load ad: $error");
        },
      ),
      request: const AdRequest(),
    ).load();
    // _bottomBannerAd!.load();
  }
}
