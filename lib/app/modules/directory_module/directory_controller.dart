import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:collection/collection.dart';
import 'package:navasankalp_application/app/data/model/directory_model.dart';
import 'package:navasankalp_application/app/data/provider/navasankalp_be_provider.dart';
import 'package:navasankalp_application/app/utils/common.dart';
import 'package:url_launcher/url_launcher.dart';

class DirectoryController extends GetxController {
  DirectoryController();
  final ScrollController controller = ScrollController();
  final directoryData = DirectoryModel().obs;
  final _provider = NavaSankalpBEProvider();
  final groupedMap = Map<dynamic, List<Datum>>().obs;
  Future getDirectory() async {
    directoryData.value = await _provider.getDirectory();
    groupedMap.value = groupBy(
      directoryData.value.data!.toList(),
      (Datum model) => model.head,
    );
    return groupedMap;
  }

  void launchPhone(String phonenumber) async {
    final Uri url = Uri(scheme: 'tel', path: phonenumber);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      print("cannot launch this url");
    }
  }

  void launchEmail(String email) async {
    final Uri url = Uri(scheme: 'mailto', path: email);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      print("cannot launch this url");
    }
  }

  @override
  void onReady() {
    super.onReady();
    Common.safeApiCall(getDirectory());
  }
}
