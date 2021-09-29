class ShopInfo {
  ShopInfo({
    required this.shop,
  });
  late final List<Shop> shop;

  ShopInfo.fromJson(Map<String, dynamic> json) {
    shop = List.from(json['shop']).map((e) => Shop.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['shop'] = shop.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Shop {
  Shop({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.avatar,
    required this.email,
    required this.age,
    required this.gender,
    required this.maritalStatus,
    required this.address,
    required this.phone,
    required this.website,
  });
  late final int id;
  late final String firstName;
  late final String lastName;
  late final String username;
  late final String avatar;
  late final String email;
  late final int age;
  late final String gender;
  late final String maritalStatus;
  late final Address address;
  late final String phone;
  late final String website;

  Shop.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    username = json['username'];
    avatar = json['avatar'];
    email = json['email'];
    age = json['age'];
    gender = json['gender'];
    maritalStatus = json['maritalStatus'];
    address = Address.fromJson(json['address']);
    phone = json['phone'];
    website = json['website'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['firstName'] = firstName;
    _data['lastName'] = lastName;
    _data['username'] = username;
    _data['avatar'] = avatar;
    _data['email'] = email;
    _data['age'] = age;
    _data['gender'] = gender;
    _data['maritalStatus'] = maritalStatus;
    _data['address'] = address.toJson();
    _data['phone'] = phone;
    _data['website'] = website;
    return _data;
  }
}

class Address {
  Address({
    required this.house,
    required this.street,
    required this.city,
    required this.zipcode,
    required this.country,
    required this.geo,
  });
  late final String house;
  late final String street;
  late final String city;
  late final String zipcode;
  late final String country;
  late final Geo geo;

  Address.fromJson(Map<String, dynamic> json) {
    house = json['house'];
    street = json['street'];
    city = json['city'];
    zipcode = json['zipcode'];
    country = json['country'];
    geo = Geo.fromJson(json['geo']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['house'] = house;
    _data['street'] = street;
    _data['city'] = city;
    _data['zipcode'] = zipcode;
    _data['country'] = country;
    _data['geo'] = geo.toJson();
    return _data;
  }
}

class Geo {
  Geo({
    required this.lat,
    required this.lng,
  });
  late final String lat;
  late final String lng;

  Geo.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lng = json['lng'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['lat'] = lat;
    _data['lng'] = lng;
    return _data;
  }
}
