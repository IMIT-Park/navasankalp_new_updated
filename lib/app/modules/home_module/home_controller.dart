import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:navasankalp_application/app/data/model/home_model.dart';
import 'package:navasankalp_application/app/data/model/paymentrequest_model.dart';
import 'package:navasankalp_application/app/data/provider/navasankalp_be_provider.dart';
import 'package:navasankalp_application/app/modules/home_module/home_page.dart';
import 'package:navasankalp_application/app/routes/app_pages.dart';
import 'package:navasankalp_application/app/utils/common.dart';
import 'package:navasankalp_application/app/utils/nava_sankalp_icons.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class HomeController extends GetxController {
  final homedata = HomeModel().obs;
  final _provider = NavaSankalpBEProvider();
  Future getHomeData() async {
    homedata.value = await _provider.getHomeData();
  }

  @override
  void onReady() {
    super.onReady();
    Common.safeApiCall(getHomeData());
  }

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final NavaSankalpBEProvider provider = NavaSankalpBEProvider();

  // final amountKey = GlobalKey<FormState>();

  List<String> amount = [
    '100',
    '200',
    '500',
    '1000',
    '2000',
    '5000',
  ];

  final socialMedia = [
    Flexible(
      flex: 20,
      child: appIconButton(
        name: "History",
        iconData: NavaSankalp.history,
        onTap: () {
          Get.toNamed(AppRoutes.history);
        },
      ),
    ),
    Flexible(
      flex: 20,
      child: appIconButton(
        name: "Directory",
        iconData: NavaSankalp.directory,
        onTap: () {
          Get.toNamed(AppRoutes.directory);
        },
      ),
    ),
    Flexible(
      flex: 20,
      child: appIconButton(
        name: "Slogan",
        iconData: NavaSankalp.slogan,
        onTap: () {
          Get.toNamed(AppRoutes.slogan);
        },
      ),
    )
  ];

  final amountController = TextEditingController();
  var selectedButton = 0.obs;
  var selectedAmount = "".obs;
  final RxInt counter = 0.obs;
  String? contributionAmount;

  bool isDrawerOpen() {
    return scaffoldKey.currentState?.isDrawerOpen ?? false;
  }

  void openDrawer() {
    scaffoldKey.currentState?.openDrawer();
  }

  void closeDrawer() {
    scaffoldKey.currentState?.closeDrawer();
  }

  int selectedAmountButton(
    int index,
    String amount,
  ) {
    selectedButton.value = index;
    selectedAmount.value = amount;
    update();
    return selectedButton.value;
  }

  void makeContribution(
    String amount,
  ) {
    selectedAmount.value = amount;
    final selectedAmount1 = double.parse(amount);
    startPayment(selectedAmount1);
  }

  final paymentrequest = PaymentRequestModel();

  Razorpay? _razorpay;
  @override
  void onInit() {
    selectedButton.value = 10;
    _razorpay = Razorpay();
    _razorpay!.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess);
    _razorpay!.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentError);
    super.onInit();
  }

  void handlePaymentSuccess(PaymentSuccessResponse response) async {
    paymentrequest.paymentId = response.paymentId;
    paymentrequest.amount = amount.toString();
    paymentrequest.status = "Success";
    await provider.paymentRequest(paymentrequest);
  }

  void handlePaymentError(PaymentFailureResponse response) async {
    paymentrequest.paymentId = response.error!["reason"];
    paymentrequest.amount = contributionAmount;
    paymentrequest.status = "Failure";
    await provider.paymentRequest(paymentrequest);
  }

  void startPayment(double amount) {
    var options = {
      'key': 'rzp_live_odrmJ2TVl6Ux2P',
      'amount': amount * 100,
      'name': 'Navasankalp',
      'description': 'Payments',
      'prefill': {
        'contact': '1234567890',
        'email': 'test@example.com',
      },
    };
    try {
      _razorpay!.open(options);
    } catch (e) {
      debugPrint("Error: $e");
    }
  }

  // Function to load the web page

  @override
  void onClose() {
    _razorpay!.clear();
    super.onClose();
  }

  final isVisible = RxBool(true); // Use RxBool for reactive updates

  void handleScroll(ScrollDirection direction) {
    if (direction == ScrollDirection.forward) {
      isVisible.value = false;
    } else if (direction == ScrollDirection.reverse) {
      isVisible.value = true;
    }
  }
}
