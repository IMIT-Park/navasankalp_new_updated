import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:navasankalp_application/app/data/model/slogan_model.dart';
import 'package:navasankalp_application/app/data/provider/navasankalp_be_provider.dart';
import 'package:navasankalp_application/app/utils/common.dart';

class SloganController extends GetxController {
  final _provider = NavaSankalpBEProvider();
  final sloganList = List<SloganModel>.empty(growable: true).obs;

  Future getSlogans() async {
    sloganList.value = await _provider.getSlogan();
  }

  void copyToClipboard(String textToCopy) {
    Clipboard.setData(ClipboardData(text: textToCopy));
    Get.showSnackbar(
      GetSnackBar(
        message: 'Copied : $textToCopy',
        duration: const Duration(seconds: 2),
      ),
    );
    
  }

  @override
  void onReady() {
    super.onReady();
    if (sloganList.isEmpty) {
      Common.safeApiCall(getSlogans());
    } else {
      Common.safeApiCall(getSlogans(), showBloackingUI: false);
    }
  }
}
