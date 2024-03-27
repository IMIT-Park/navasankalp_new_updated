import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:navasankalp_application/app/data/model/account_model.dart';
import 'package:navasankalp_application/app/data/model/blocklist_model.dart';
import 'package:navasankalp_application/app/data/model/district_model.dart';
import 'package:navasankalp_application/app/data/model/mandalamlist_model.dart';
import 'package:navasankalp_application/app/data/provider/navasankalp_be_provider.dart';
import 'package:navasankalp_application/app/utils/common.dart';
import 'package:navasankalp_application/app/utils/nava_sankalp_icons.dart';
import 'package:navasankalp_application/app/utils/widgets/app_drawer/drawer_controller.dart';
class AccountController extends GetxController {
  final NavaSankalpBEProvider _beProvider = Get.find<NavaSankalpBEProvider>();
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController districtController = TextEditingController();
  TextEditingController blockController = TextEditingController();
  TextEditingController mandalamController = TextEditingController();

  final accountmodel = AccountModel().obs;
  final districts = DistrictModel().obs;
  final booth = 1.obs;
  final block = BlockModel().obs;
  final mandalam = MandalamModel().obs;
  Future<void> postAccountData() async {
    final addAccountModel = AccountPostModel();
    addAccountModel.name = nameController.value.text;
    addAccountModel.address = addressController.value.text;
    addAccountModel.district = districts.value.id;
    addAccountModel.booth = booth.value;
    addAccountModel.block = block.value.id;
    addAccountModel.mandalam = mandalam.value.id;
    addAccountModel.photo = imagePath.value;
    var response = await _beProvider.updateAccountdata(addAccountModel);
    log(response.district.toString());
    DrawersController drawerController = Get.find<DrawersController>();
    await drawerController.getUserData();
  }

// Get account data
  final blockmodel = BlockModel().obs;
  Future<void> getAccountData() async {
    accountmodel.value = await _beProvider.getAccountDetails();
    nameController.text = accountmodel.value.name.toString();
    addressController.text = accountmodel.value.address.toString();
    phoneController.text = accountmodel.value.phoneNumber.toString();
    districts.value = DistrictModel(
        id: accountmodel.value.district,
        district: accountmodel.value.districtName);
    districtController.text = accountmodel.value.districtName.toString();
    booth.value = accountmodel.value.booth!.toInt();
    block.value = BlockModel(
        id: accountmodel.value.block, name: accountmodel.value.blockName);
    blockController.text = accountmodel.value.blockName.toString();
    mandalam.value = MandalamModel(
        id: accountmodel.value.mandalam, name: accountmodel.value.mandalamName);
    mandalamController.text = accountmodel.value.mandalamName.toString();
    imagePath.value = accountmodel.value.photo.toString();
  }

  final boothlist = [1, 2, 3, 4, 5].obs;
  final districtlists = List<DistrictModel>.empty(growable: true).obs;

  // Get district list
  final districtmodel = DistrictModel().obs;
  Future getDistrictlist() async {
    final districtlist = await _beProvider.getDistrict();
    districtlists.value = districtlist;
  }

// Get block list
  final blockRequest = BlockRequestModel().obs;
  final blocklists = List<BlockModel>.empty(growable: true).obs;
  Future getBlocklist() async {
    blockRequest.value.districtId = districts.value.id;
    final blockList = await _beProvider.getblockList(blockRequest.value);
    blocklists.value = blockList;
  }

  // Get mandalam list
  final mandalamPostList = MandalamListRequest().obs;
  final mandalamlist = List<MandalamModel>.empty(growable: true).obs;
  Future getMandalamList() async {
    mandalamPostList.value.block = block.value.id.toString();
    final mandalam = await _beProvider.getMandalamList(mandalamPostList.value);
    mandalamlist.value = mandalam;
  }

// textfield validation
  final nameformKey = GlobalKey<FormState>();
  final addressformKey = GlobalKey<FormState>();

  final isEditing = RxBool(false);
  void toggleEditing() {
    isEditing.value = !isEditing.value;
    if (!isEditing.value) {
      uploadImage();
    }
    if (districts.value.district!.isEmpty ||
        block.value.name!.isEmpty ||
        mandalam.value.name!.isEmpty) {
      Common.showError("Please fill missing fields");
    }
  }

// edit icon function
  final editIconValue = Rx<IconData>(NavaSankalp.edit);
  final isEnabled = false.obs;
  void enableMandalam(bool enabled) {
    isEnabled.value = enabled;
  }

  void enableBlock(bool enabled) {
    isEnabled.value = enabled;
  }

// profile image functions
  final imagePath = "".obs;
  final _picker = ImagePicker();
  Future<void> openImagePicker() async {
    final pickedImage = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      imagePath.value = pickedImage.path;
    } else {
      Common.showError('No image selected.');
    }
  }

  Future<void> uploadImage() async {
    if (imagePath.isEmpty) return;
    final response = await _beProvider.sendImage(imagePath.value);
    return response;
  }

  @override
  void onReady() {
    super.onReady();
    Common.safeApiCall(
      getAccountData(),
    );
    Common.safeApiCall(getBlocklist());
    Common.safeApiCall(getDistrictlist());
  }
}
