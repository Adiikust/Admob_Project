import 'package:admob/core/utils/ad_manager.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final AdManager adManager = AdManager();

  @override
  void onInit() {
    super.onInit();
    loadAds();
  }

  void loadAds() {
    // adManager.loadAppOpenAd();
    // adManager.loadInterstitialAd();
    adManager.loadBannerAd();
    // adManager.listenToAppStateChange();
  }
}
