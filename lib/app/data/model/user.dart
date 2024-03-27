// class User {
//   int? id;
//   String? name;
//   String? avatar;
//   DateTime? createdAt;

//   User({id, name, avatar, createdAt});

//   User.fromJson(Map<String, dynamic> json) {
//     id = int.tryParse(json['id']);
//     name = json['name'];
//     avatar = json['avatar'];
//     createdAt = DateTime.tryParse(json['createdAt']);
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['name'] = name;
//     data['id'] = id?.toString();
//     data['avatar'] = avatar;
//     data['createdAt'] = createdAt?.toIso8601String();
//     return data;
//   }
// }
