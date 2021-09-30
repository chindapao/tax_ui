import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<AdminInfo>> fetchAllUsers() async {
  List<AdminInfo> listModel = [];
  var responseData =
      await http.get(Uri.parse("http://fakeapi.jsonparseronline.com/posts"));
  if (responseData.statusCode == 200) {
    var data = jsonDecode(responseData.body);
    for (var i in data) {
      listModel.add(AdminInfo.fromJson(i));
    }
    print("DATA========");
    print(data);
  }
  return listModel;
}

class UserAdmin {
  UserAdmin({
    required this.adminInfo,
  });
  late final List<AdminInfo> adminInfo;

  UserAdmin.fromJson(Map<String, dynamic> json) {
    adminInfo = List.from(json['admin_info'])
        .map((e) => AdminInfo.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['admin_info'] = adminInfo.map((e) => e.toJson()).toList();
    return _data;
  }
}

class AdminInfo {
  AdminInfo({
    required this.id,
    required this.title,
    required this.userId,
    required this.content,
    required this.likes,
    required this.hits,
    required this.categoryId,
    required this.imageUrl,
  });
  late final int id;
  late final String title;
  late final int userId;
  late final String content;
  late final int likes;
  late final int hits;
  late final int categoryId;
  late final String imageUrl;

  AdminInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    userId = json['userId'];
    content = json['content'];
    likes = json['likes'];
    hits = json['hits'];
    categoryId = json['categoryId'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['userId'] = userId;
    _data['content'] = content;
    _data['likes'] = likes;
    _data['hits'] = hits;
    _data['categoryId'] = categoryId;
    _data['imageUrl'] = imageUrl;
    return _data;
  }
}
