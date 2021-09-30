class UserConvert {
  UserConvert({
    required this.userInfo,
  });
  late final List<UserInfo> userInfo;

  UserConvert.fromJson(Map<String, dynamic> json) {
    userInfo =
        List.from(json['user_info']).map((e) => UserInfo.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['user_info'] = userInfo.map((e) => e.toJson()).toList();
    return _data;
  }
}

class UserInfo {
  UserInfo({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });
  late final int albumId;
  late final int id;
  late final String title;
  late final String url;
  late final String thumbnailUrl;

  UserInfo.fromJson(Map<String, dynamic> json) {
    albumId = json['albumId'];
    id = json['id'];
    title = json['title'];
    url = json['url'];
    thumbnailUrl = json['thumbnailUrl'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['albumId'] = albumId;
    _data['id'] = id;
    _data['title'] = title;
    _data['url'] = url;
    _data['thumbnailUrl'] = thumbnailUrl;
    return _data;
  }
}
