import 'package:get/get.dart';
import 'package:navasankalp_application/app/data/model/transaction_model.dart';
import 'package:navasankalp_application/app/data/provider/navasankalp_be_provider.dart';

class TransactionController extends GetxController {
  TransactionController();
  final NavaSankalpBEProvider _provider = NavaSankalpBEProvider();
  final transactionList = List<TransactionModel>.empty(growable: true).obs;
  Future getTransaction() async {
    transactionList.value = await _provider.getTransactions();
  }

  @override
  void onReady() {
    super.onReady();
    if (transactionList.isEmpty) {
      getTransaction();
    } else {
      getTransaction();
    }
  }
}
