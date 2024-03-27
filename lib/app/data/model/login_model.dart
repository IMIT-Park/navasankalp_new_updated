import 'dart:convert';
// To parse this JSON data, do
//
//     final userLogin = userLoginFromJson(jsonString);


// To parse this JSON data, do
//
//     final userLoginRespons = userLoginResponsFromJson(jsonString);


UserLoginRespons userLoginResponsFromJson(String str) => UserLoginRespons.fromJson(json.decode(str));

String userLoginResponsToJson(UserLoginRespons data) => json.encode(data.toJson());

class UserLoginRespons {
    String? message;
    User? user;
    dynamic userProfile;
    String? accessToken;
    String? refreshToken;

    UserLoginRespons({
        this.message,
        this.user,
        this.userProfile,
        this.accessToken,
        this.refreshToken,
    });

    factory UserLoginRespons.fromJson(Map<String, dynamic> json) => UserLoginRespons(
        message: json["message"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        userProfile: json["userProfile"],
        accessToken: json["access_token"],
        refreshToken: json["refresh_token"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "user": user?.toJson(),
        "userProfile": userProfile,
        "access_token": accessToken,
        "refresh_token": refreshToken,
    };
}

class User {
    int? id;
    int? isAdmin;
    String? role;
    String? username;
    String? email;
    String? phone;
    int? status;
    DateTime? createdAt;
    DateTime? updatedAt;
    dynamic deviceToken;
    String? deviceType;

    User({
        this.id,
        this.isAdmin,
        this.role,
        this.username,
        this.email,
        this.phone,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.deviceToken,
        this.deviceType,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        isAdmin: json["is_admin"],
        role: json["role"],
        username: json["username"],
        email: json["email"],
        phone: json["phone"],
        status: json["status"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        deviceToken: json["device_token"],
        deviceType: json["device_type"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "is_admin": isAdmin,
        "role": role,
        "username": username,
        "email": email,
        "phone": phone,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "device_token": deviceToken,
        "device_type": deviceType,
    };
}


UserLoginRequest userLoginRequestFromJson(String str) => UserLoginRequest.fromJson(json.decode(str));
String userLoginRequestToJson(UserLoginRequest data) => json.encode(data.toJson());
class UserLoginRequest {
    String? googleToken;
 
    UserLoginRequest({
        this.googleToken,

    });
    factory UserLoginRequest.fromJson(Map<String, dynamic> json) => UserLoginRequest(
        googleToken: json["google_token"],
  
    );
    Map<String, dynamic> toJson() => {
        "google_token": googleToken,

    };
}