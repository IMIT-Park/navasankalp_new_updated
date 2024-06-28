import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:navasankalp_application/app/modules/home_module/home_controller.dart';
import 'package:navasankalp_application/app/routes/app_pages.dart';
import 'package:navasankalp_application/app/themes/app_colors.dart';
import 'package:navasankalp_application/app/themes/app_text_theme.dart';
import 'package:navasankalp_application/app/utils/common.dart';
import 'package:navasankalp_application/app/utils/extensions.dart';
import 'package:navasankalp_application/app/utils/nava_sankalp_icons.dart';
import 'package:navasankalp_application/app/utils/widgets/app_button/app_button.dart';
import 'package:navasankalp_application/app/utils/widgets/app_drawer/app_drawer.dart';

class HomePage extends GetWidget<HomeController> {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      extendBodyBehindAppBar: true,
      key: homeController.scaffoldKey,
      drawer: const CustomAppDrawer(),
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            floating: false,
            delegate: CustomSliverDelegate(
              expandedHeight:
                  Common.getDeviceSepcificDouble(210, desktopValue: 240),
            ),
          ),
          SliverList(
              delegate:
                  SliverChildBuilderDelegate(childCount: 1, (context, index) {
            return homePageBody();
          }))
        ],
      ),
    );
  }

  Widget homePageBody() {
    HomeController homeController = Get.find();

    return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Common.getDeviceSepcificDouble(20, desktopValue: 30),
        ),
        child: OrientationBuilder(
          builder: (context, orientation) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: MediaQuery.of(context).orientation ==
                            Orientation.portrait
                        ? homeController.socialMedia
                        : []),
                SizedBox(
                  height: Common.getDeviceSepcificDouble(20, desktopValue: 10),
                ),
                Text(
                  "Contribution",
                  maxLines: 1,
                  style: AppTextStyles.base.s16.poppins.w900,
                ),
                GridView.builder(
                  padding: EdgeInsets.symmetric(
                      vertical:
                          Common.getDeviceSepcificDouble(10, desktopValue: 20)),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio:
                        Common.getDeviceSepcificDouble(2.3, desktopValue: 2),
                    crossAxisCount: MediaQuery.of(context).orientation ==
                            Orientation.portrait
                        ? 3
                        : 6,
                  ),
                  itemCount: homeController.amount.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Obx(
                      () => InkWell(
                        onTap: () {
                          homeController.selectedAmountButton(
                            index,
                            homeController.amount[index],
                          );
                          homeController.contributionAmount =
                              homeController.amount[index];
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color:
                                    homeController.selectedButton.value == index
                                        ? AppColors.kPrimaryColor
                                        : AppColors.transparent,
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(8),
                              )),
                          elevation: 0.3,
                          shadowColor: AppColors.lightGray,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "₹ ${homeController.amount[index]}",
                                style: AppTextStyles.getAppTextStyleCustomized(
                                  textColor:
                                      homeController.selectedButton.value ==
                                              index
                                          ? AppColors.kPrimaryColor
                                          : AppColors.lightGray,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
                AppButton(
                  margin: EdgeInsets.symmetric(
                      vertical:
                          Common.getDeviceSepcificDouble(20, desktopValue: 30)),
                  onPressed: () {
                    homeController
                        .makeContribution(homeController.contributionAmount!);
                  },
                  text: "Pay Now",
                ),
                Obx(
                  () => GridView.builder(
                    padding: EdgeInsets.symmetric(
                        vertical:
                            Common.getDeviceSepcificDouble(5, desktopValue: 5)),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: homeController
                            .homedata.value.nonsponsoredBanner?.length ??
                        0,
                    itemBuilder: (BuildContext context, int index) {
                      return sponsoredAds(
                        isLinkNeeded: homeController.homedata.value
                                    .nonsponsoredBanner![index].link ==
                                ""
                            ? false
                            : true,
                        imageUrl: homeController
                                .homedata.value.nonsponsoredBanner![index].image
                                ?.attachAssetBaseURL() ??
                            "",
                        onTap: () {
                          Common.launchUrls(homeController
                              .homedata.value.nonsponsoredBanner![index].link
                              .toString());
                        },
                      );
                    },
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 2,
                      childAspectRatio:
                          Common.getDeviceSepcificDouble(2.3, desktopValue: 2),
                      crossAxisCount: MediaQuery.of(context).orientation ==
                              Orientation.portrait
                          ? 1
                          : 2,
                    ),
                  ),
                ),
                Text(
                  "Sponsored by",
                  maxLines: 1,
                  style: AppTextStyles.base.s16.poppins.w900,
                ),
                SizedBox(
                  height: Common.getDeviceSepcificDouble(10, desktopValue: 10),
                ),
                Obx(
                  () => GridView.builder(
                    padding: EdgeInsets.symmetric(
                        vertical:
                            Common.getDeviceSepcificDouble(5, desktopValue: 5)),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount:
                        homeController.homedata.value.sponsoredBanner?.length ??
                            0,
                    itemBuilder: (BuildContext context, int index) {
                      return sponsoredAds(
                        isLinkNeeded: homeController.homedata.value
                                    .sponsoredBanner![index].link ==
                                ""
                            ? false
                            : true,
                        imageUrl: homeController
                                .homedata.value.sponsoredBanner![index].image
                                ?.attachAssetBaseURL() ??
                            "",
                        onTap: () {
                          Common.launchUrls(homeController
                              .homedata.value.nonsponsoredBanner![index].link
                              .toString());
                        },
                      );
                    },
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 2,
                      mainAxisSpacing: 5,
                      childAspectRatio:
                          Common.getDeviceSepcificDouble(2.3, desktopValue: 2),
                      crossAxisCount: MediaQuery.of(context).orientation ==
                              Orientation.portrait
                          ? 1
                          : 2,
                    ),
                  ),
                ),
              ],
            );
          },
        ));
  }
}

Widget appIconButton(
    {required String name,
    required IconData iconData,
    required VoidCallback onTap}) {
  return Card(
    elevation: 1,
    child: SizedBox(
      height: Common.getDeviceSepcificDouble(73, desktopValue: 120),
      width: Common.getDeviceSepcificDouble(116, desktopValue: 120),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData,
              color: AppColors.kPrimaryColor,
              size: Common.getDeviceSepcificDouble(25, desktopValue: 35),
            ),
            Text(name,
                textAlign: TextAlign.center, style: AppTextStyles.base.s16.w900)
          ],
        ),
      ),
    ),
  );
}

Widget sponsoredAds(
    {required bool? isLinkNeeded,
    required VoidCallback? onTap,
    required String imageUrl}) {
  return Padding(
    padding: EdgeInsets.symmetric(
        vertical: Common.getDeviceSepcificDouble(10, desktopValue: 10)),
    child: Stack(
      children: [
        isLinkNeeded == true
            ? InkWell(
                onTap: onTap,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.fitWidth,
                    width: Get.width,
                  ),
                ),
              )
            : ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.fitWidth,
                  width: Get.width,
                ),
              ),
      ],
    ),
  );
}

class CustomSliverDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final bool hideTitleWhenExpanded;
  CustomSliverDelegate(
      {required this.expandedHeight, this.hideTitleWhenExpanded = true});
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final homeController = Get.find<HomeController>();
    final appBarSize = expandedHeight - shrinkOffset;
    final proportion = 2 - (expandedHeight / appBarSize);
    proportion < 0 || proportion > 1 ? 0.0 : proportion;
    return OrientationBuilder(
      builder: (context, orientation) {
        return Stack(
          fit: StackFit.passthrough,
          children: [
            SizedBox(
              height: Common.getDeviceSepcificDouble(
                  MediaQuery.of(context).orientation == Orientation.portrait
                      ? 200
                      : 280,
                  desktopValue: 200),
              child: AppBar(
                flexibleSpace: const Image(
                  image: AssetImage(
                    "assets/home_background_top.jpg",
                  ),
                  fit: BoxFit.fitWidth,
                ),
                backgroundColor: AppColors.transparent,
                leading: Builder(builder: (context) {
                  return IconButton(
                    icon: const Icon(NavaSankalp.menu_left,color: AppColors.white),
                    onPressed: () {
                      return Scaffold.of(context).openDrawer();
                    },
                  );
                }),
                actions: [
                  IconButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.notification);
                      },
                      icon: const Icon(NavaSankalp.bell,color: AppColors.white,))
                ],
                elevation: 0.0,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: Common.getDeviceSepcificDouble(
                      MediaQuery.of(context).orientation == Orientation.portrait
                          ? 0
                          : 10,
                      desktopValue: 140),
                  right: Common.getDeviceSepcificDouble(
                      MediaQuery.of(context).orientation == Orientation.portrait
                          ? 0
                          : 10,
                      desktopValue: 140),
                  top: Common.getDeviceSepcificDouble(
                      MediaQuery.of(context).orientation == Orientation.portrait
                          ? 120
                          : 90,
                      desktopValue: 140)),
              child: Align(
                  alignment:
                      MediaQuery.of(context).orientation == Orientation.portrait
                          ? Alignment.center
                          : Alignment.topLeft,
                  child: Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         Expanded(
                          child: CarouselSlider.builder(
                            itemBuilder: (_, index, __) {
                              return InkWell(
                                onTap: () {
                                  Common.launchUrls(homeController
                                      .homedata.value.carousel![index].link
                                      .toString());
                                },
                                child: Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: Common.getDeviceSepcificDouble(
                                          10,
                                          desktopValue: 10),
                                      vertical: Common.getDeviceSepcificDouble(20,
                                          desktopValue: 10)),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        Common.getDeviceSepcificDouble(5,
                                            desktopValue: 5)),
                                    image: DecorationImage(
                                      image: NetworkImage(homeController.homedata
                                              .value.carousel?[index].image
                                              ?.attachAssetBaseURL() ??
                                          ""),
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                ),
                              );
                            },
                            options: CarouselOptions(
                              viewportFraction: 1,
                              enableInfiniteScroll: true,
                              autoPlay: true,
                              autoPlayAnimationDuration: const Duration(seconds: 2),
                              onPageChanged: (index, _) {},
                            ),
                            itemCount: homeController.homedata.value.carousel?.length ?? 0,
                          ),
                        ),
                        MediaQuery.of(context).orientation ==
                                Orientation.portrait
                            ? const SizedBox()
                            : 
                            Column(children: homeController.socialMedia)
                      ],
                    ),
                  )),
            )
          ],
        );
      },
    );
  }

  @override
  double get maxExtent =>
      expandedHeight +
      expandedHeight / Common.getDeviceSepcificDouble(2, desktopValue: 3);
  @override
  double get minExtent => Common.getDeviceSepcificDouble(100, desktopValue: 10);
  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
