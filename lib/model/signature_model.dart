class SignatureModel {
  SignatureModel({
    required this.data2,
  });
  late final Data data2;

  SignatureModel.fromJson(Map<String, dynamic> json) {
    data2 = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data2 = <String, dynamic>{};
    _data2['data'] = data2.toJson();
    return _data2;
  }
}

class Data {
  Data({
    required this.imageSyncArray,
  });
  late final List<ImageSyncArray> imageSyncArray;

  Data.fromJson(Map<String, dynamic> json) {
    imageSyncArray = List.from(json['imageSyncArray'])
        .map((e) => ImageSyncArray.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['imageSyncArray'] = imageSyncArray.map((e) => e.toJson()).toList();
    return _data;
  }
}

class ImageSyncArray {
  ImageSyncArray({
    required this.id,
    required this.localId,
    required this.category,
    required this.subCategory,
    required this.imageType,
    required this.imagePath,
    required this.imageBase64,
    required this.empId,
    required this.isActive,
    required this.isSync,
    required this.createdDate,
    this.serverImageUrl,
  });
  late final int id;
  late final String localId;
  late final String category;
  late final String subCategory;
  late final String imageType;
  late final String imagePath;
  late final String imageBase64;
  late final String empId;
  late final bool isActive;
  late final bool isSync;
  late final String createdDate;
  late final dynamic serverImageUrl;

  ImageSyncArray.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    localId = json['localId'];
    category = json['category'];
    subCategory = json['subCategory'];
    imageType = json['imageType'];
    imagePath = json['imagePath'];
    imageBase64 = json['imageBase64'];
    empId = json['empId'];
    isActive = json['isActive'];
    isSync = json['isSync'];
    createdDate = json['createdDate'];
    serverImageUrl = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['localId'] = localId;
    _data['category'] = category;
    _data['subCategory'] = subCategory;
    _data['imageType'] = imageType;
    _data['imagePath'] = imagePath;
    _data['imageBase64'] = imageBase64;
    _data['empId'] = empId;
    _data['isActive'] = isActive;
    _data['isSync'] = isSync;
    _data['createdDate'] = createdDate;
    _data['serverImageUrl'] = serverImageUrl;
    return _data;
  }
}
