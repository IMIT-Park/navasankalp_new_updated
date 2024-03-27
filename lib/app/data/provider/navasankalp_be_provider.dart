import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:navasankalp_application/app/data/api/api_connect.dart';
import 'package:navasankalp_application/app/data/model/account_model.dart';
import 'package:navasankalp_application/app/data/model/blocklist_model.dart';
import 'package:navasankalp_application/app/data/model/directory_model.dart';
import 'package:navasankalp_application/app/data/model/district_model.dart';
import 'package:navasankalp_application/app/data/model/history_model.dart';
import 'package:navasankalp_application/app/data/model/home_model.dart';
import 'package:navasankalp_application/app/data/model/login_model.dart';
import 'package:navasankalp_application/app/data/model/mandalamlist_model.dart';
import 'package:navasankalp_application/app/data/model/notification_model.dart';
import 'package:navasankalp_application/app/data/model/paymentrequest_model.dart';
import 'package:navasankalp_application/app/data/model/slogan_model.dart';
import 'package:navasankalp_application/app/data/model/transaction_model.dart';
import 'package:navasankalp_application/app/utils/common.dart';

class NavaSankalpBEProvider {
  NavaSankalpBEProvider();

//history api

  Future<List<HistoryModel>> getHistory() async {
    final response = await ApiConnect.instance.get("DCC_history");
    return response.getBody(decoder: HistoryModel.listFromJson);
  }

//transaction api

  Future<List<TransactionModel>> getTransactions() async {
    final response = await ApiConnect.instance.get("history");
    return response.getBody(
      decoder: (data) => TransactionModel.listFromJson(data['data']),
    );
  }

  //notification api

  Future<List<NotificationModel>> getNotification() async {
    final response = await ApiConnect.instance.get("getNotification");
    return response.getBody(
      decoder: (data) => NotificationModel.listFromJson(data['data']),
    );
  }

  //slogan api

  Future<List<SloganModel>> getSlogan() async {
    final response = await ApiConnect.instance.get("slogans");
    return response.getBody(decoder: SloganModel.listFromJson);
  }

  Future<UserLoginRespons> loginUser(UserLoginRequest model) async {
    final response = await ApiConnect.instance
        .post("google-login", userLoginRequestToJson(model));

    return response.getBody(decoder: (data) {
      return UserLoginRespons.fromJson(data);
    });
  }

// Get request of Account

  Future<AccountModel> getAccountDetails() async {
    final response = await ApiConnect.instance.get("userprofile");
    return response.getBody(
      decoder: (data) => AccountModel.fromJson(data["data"]),
    );
  }

// Post request of Account
  Future<AccountModel> updateAccountdata(AccountPostModel accmodel) async {
    final response = await ApiConnect.instance
        .post("userprofile", accountPostModelToJson(accmodel));
    return response.getBody(decoder: (data) => AccountModel.fromJson(data));
  }

  //  district list
  Future<List<DistrictModel>> getDistrict() async {
    final response = await ApiConnect.instance.get("districts");
    return response.getBody(
      decoder: (data) => DistrictModel.listFromJson(data['districts']),
    );
  }

  //  block list
  Future<List<BlockModel>> getblockList(BlockRequestModel blockmodel) async {
    final response = await ApiConnect.instance
        .post("blocks", blockRequestModelToJson(blockmodel));
    return response.getBody(
      decoder: (data) => BlockModel.listFromJson(data),
    );
  }
  // Future<List<BlockModel>> getblockList() async {
  //   final response = await ApiConnect.instance.get("blocks");
  //   return response.getBody(decoder: BlockModel.listFromJson);
  // }

//  mandalam list
  Future<List<MandalamModel>> getMandalamList(
      MandalamListRequest mandalammodel) async {
    final response = await ApiConnect.instance
        .post("mandalam", mandalamlistPostModelToJson(mandalammodel));

    return response.getBody(
        decoder: (data) => MandalamModel.listFromJson(data['data']));
  }

  //payment api

  paymentRequest(PaymentRequestModel model) async {
    final response =
        await ApiConnect.instance.post("pay", paymentRequestModelToJson(model));
    return response.getBody(
      decoder: (data) => Common.showSuccess(data),
    );
  }

//home api
  Future<HomeModel> getHomeData() async {
    final response = await ApiConnect.instance.get("home");
    return response.getBody(decoder: (data) => HomeModel.fromJson(data));
  }

  //directory api
  Future<DirectoryModel> getDirectory() async {
    final response = await ApiConnect.instance.get("directories");
    return response.getBody(decoder: (data) => DirectoryModel.fromJson(data));
  }
//image upload

  Future sendImage(String imageURL) async {
    final file = XFile(imageURL);
    final form = {
      'photo': MultipartFile(await file.readAsBytes(), filename: file.name)
    };
    final response =
        await ApiConnect.instance.post("profilePhoto", FormData(form));
    return response;
  }

  Future<String> changeNotificationRequest(
      NoficationReadRequestModel model) async {
    final response = await ApiConnect.instance
        .post("markAsRead", noficationReadRequestModelToJson(model));
    return response.getBody(
      decoder: (data) => data['message'],
    );
  }
}
