
// To parse this JSON data, do
//
//     final homeModel = homeModelFromJson(jsonString);

import 'dart:convert';

HomeModel homeModelFromJson(String str) => HomeModel.fromJson(json.decode(str));

String homeModelToJson(HomeModel data) => json.encode(data.toJson());

class HomeModel {
    List<Carousel>? carousel;
    List<Carousel>? sponsoredBanner;
    List<Carousel>? nonsponsoredBanner;

    HomeModel({
        this.carousel,
        this.sponsoredBanner,
        this.nonsponsoredBanner,
    });

    factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        carousel: json["carousel"] == null ? [] : List<Carousel>.from(json["carousel"]!.map((x) => Carousel.fromJson(x))),
        sponsoredBanner: json["sponsoredBanner"] == null ? [] : List<Carousel>.from(json["sponsoredBanner"]!.map((x) => Carousel.fromJson(x))),
        nonsponsoredBanner: json["nonsponsoredBanner"] == null ? [] : List<Carousel>.from(json["nonsponsoredBanner"]!.map((x) => Carousel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "carousel": carousel == null ? [] : List<dynamic>.from(carousel!.map((x) => x.toJson())),
        "sponsoredBanner": sponsoredBanner == null ? [] : List<dynamic>.from(sponsoredBanner!.map((x) => x.toJson())),
        "nonsponsoredBanner": nonsponsoredBanner == null ? [] : List<dynamic>.from(nonsponsoredBanner!.map((x) => x.toJson())),
    };
}

class Carousel {
    int? id;
    String? image;
    String? link;
    int? active;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? sponsored;

    Carousel({
        this.id,
        this.image,
        this.link,
        this.active,
        this.createdAt,
        this.updatedAt,
        this.sponsored,
    });

    factory Carousel.fromJson(Map<String, dynamic> json) => Carousel(
        id: json["id"],
        image: json["image"],
        link: json["link"],
        active: json["active"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        sponsored: json["sponsored"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "link": link,
        "active": active,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "sponsored": sponsored,
    };
}



// // To parse this JSON data, do
// //
// //     final homeModel = homeModelFromJson(jsonString);

// import 'dart:convert';

// HomeModel homeModelFromJson(String str) => HomeModel.fromJson(json.decode(str));

// String homeModelToJson(HomeModel data) => json.encode(data.toJson());

// class HomeModel {
//   List<BannerModel>? carousel;
//   List<BannerModel>? banner;

//   HomeModel({
//     this.carousel,
//     this.banner,
//   });

//   factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
//         carousel: json["carousel"] == null
//             ? []
//             : List<BannerModel>.from(
//                 json["carousel"]!.map((x) => BannerModel.fromJson(x))),
//         banner: json["banner"] == null
//             ? []
//             : List<BannerModel>.from(
//                 json["banner"]!.map((x) => BannerModel.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "carousel": carousel == null
//             ? []
//             : List<dynamic>.from(carousel!.map((x) => x.toJson())),
//         "banner": banner == null
//             ? []
//             : List<dynamic>.from(banner!.map((x) => x.toJson())),
//       };
// }

// class BannerModel {
//   int? id;
//   String? image;
//   String? link;
//   int? active;
//   String? createdAt;
//   String? updatedAt;

//   BannerModel({
//     this.id,
//     this.image,
//     this.link,
//     this.active,
//     this.createdAt,
//     this.updatedAt,
//   });

//   factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
//         id: json["id"],
//         image: json["image"],
//         link: json["link"],
//         active: json["active"],
//         createdAt: json["created_at"],
//         updatedAt: json["updated_at"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "image": image,
//         "link": link,
//         "active": active,
//         "created_at": createdAt,
//         "updated_at": updatedAt,
//       };
// }
