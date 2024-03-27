import 'package:get/get.dart';
import 'package:navasankalp_application/app/data/model/history_model.dart';
import 'package:navasankalp_application/app/data/provider/global_data_provider.dart';
import 'package:navasankalp_application/app/data/provider/navasankalp_be_provider.dart';
import 'package:navasankalp_application/app/utils/common.dart';

class HistoryController extends GetxController {
  final NavaSankalpBEProvider _provider = Get.find<NavaSankalpBEProvider>();
  final GlobalDataProvider _globalDataProvider = Get.find<GlobalDataProvider>();
  final historyList = List<HistoryModel>.empty(growable: true).obs;

  HistoryController() {
    historyList.value = _globalDataProvider.historydata;
  }

  Future getHistory() async {
    historyList.value =
        _globalDataProvider.historydata = await _provider.getHistory();
  }

  @override
  void onReady() {
    super.onReady();
    if (historyList.isEmpty) {
      Common.safeApiCall(getHistory());
    } else {
      Common.safeApiCall(getHistory(), showBloackingUI: false);
    }
  }
}
