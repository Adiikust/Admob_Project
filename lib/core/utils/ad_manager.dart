import 'dart:developer';

import 'package:admob/core/utils/ad_helper.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdManager {
  RxBool isBottomBannerAdLoaded = false.obs;
  RxBool isCollapsibleBannerAdLoaded = false.obs;
  RxBool isNativeLoad = false.obs;
  bool isAppOpenAd = false;
  AppOpenAd? _appOpenAd;
  InterstitialAd? _interstitialAd;
  BannerAd? bannerAd;
  BannerAd? collapsibleBannerAd;
  NativeAd? nativeAd;

  Future<void> loadAppOpenAd() async {
    await AppOpenAd.load(
      adUnitId: AdHelper.appOpenAdUnitId,
      request: const AdRequest(),
      adLoadCallback: AppOpenAdLoadCallback(onAdLoaded: (ad) {
        print('open app Ad loaded');
        _appOpenAd = ad;
      }, onAdFailedToLoad: (error) {
        print('open app failed to load ad: $error');
      }),
    );
  }

  Future<void> showAppOpenAd() async {
    if (_appOpenAd != null) {
      _appOpenAd?.show();
    } else {
      loadAppOpenAd();
    }
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

  Future<void> loadCollapsibleBannerAd() async {
    BannerAd(
      size: AdSize.banner,
      adUnitId: AdHelper.bannerAdUnitId,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          print("collapsible Banner Ad loaded");
          collapsibleBannerAd = ad as BannerAd?;
          isCollapsibleBannerAdLoaded.value = true;
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
          print("collapsible Banner failed to load ad: $error");
        },
      ),

      ///Note: collapsible user for direction
      request: const AdRequest(extras: {"collapsible": "bottom"}),
    ).load();
    // _bottomBannerAd!.load();
  }

  Future<void> loadNativeAd() async {
    try {
      NativeAd(
        adUnitId: AdHelper.nativeAdvancedAdUnitId,

        ///Note: factoryId user for custom native ads
        //factoryId: ,
        listener: NativeAdListener(
          onAdLoaded: (ad) {
            print("Native Ad loaded");
            nativeAd = ad as NativeAd?;
            isNativeLoad.value = true;
          },
          onAdFailedToLoad: (ad, error) {
            ad.dispose();
            print("Native failed to load ad: $error");
          },
        ),
        request: const AdRequest(),

        ///Note: TemplateType use for default ads view
        nativeTemplateStyle:
            NativeTemplateStyle(templateType: TemplateType.small),
      ).load();
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> loadInterstitialAd() async {
    try {
      InterstitialAd.load(
        adUnitId: AdHelper.interstitialAdUnitId,
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (ad) {
            print("Interstitial Ad loaded");
            _interstitialAd = ad;
          },
          onAdFailedToLoad: (LoadAdError error) {
            print('InterstitialAd failed to load: $error');
          },
        ),
      );
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> showInterstitialAd() async {
    if (_interstitialAd != null) {
      _interstitialAd?.show();
    } else {
      loadInterstitialAd();
    }
  }

  /// App State
  void listenToAppStateChange() {
    AppStateEventNotifier.stopListening();
    AppStateEventNotifier.appStateStream
        .forEach((element) => onAppStateChange(element));
  }

  void onAppStateChange(AppState appState) {
    if (appState == AppState.foreground) {
      if (_appOpenAd != null) {
        print("show app open ad");
        print(appState);
        showAppOpenAd();
      } else {
        print("show app load ad");
        print(appState);
        showAppOpenAd();
      }
    } else {
      print("show app load ad");
      print(appState);
      showAppOpenAd();
    }
  }
}
