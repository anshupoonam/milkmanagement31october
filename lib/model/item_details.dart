class ItemDetails {
  bool? isSuccess;
  int? status;
  String? message;
  dynamic stackTrace;
  List<Data>? data;

  ItemDetails(
      {this.isSuccess, this.status, this.message, this.stackTrace, this.data});

  ItemDetails.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    status = json['status'];
    message = json['message'];
    stackTrace = json['stackTrace'];
    if (json['data'] != null) {
      
      json['data'].forEach((v) {
        data!.add( Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['isSuccess'] = isSuccess;
    data['status'] = status;
    data['message'] = message;
    data['stackTrace'] = stackTrace;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? itemId;
  String? itemCode;
  String? itemName;
  String? printName;
  String? barCode;
  String? hsnCode;
  String? packing;
  double? mrp;
  double? pts;
  double? ptr;
  dynamic taxValue;
  String? imageUrl;
  String? unqCode;

  Data(
      {this.itemId,
      this.itemCode,
      this.itemName,
      this.printName,
      this.barCode,
      this.hsnCode,
      this.packing,
      this.mrp,
      this.pts,
      this.ptr,
      this.taxValue,
      this.imageUrl,
      this.unqCode});

  Data.fromJson(Map<String, dynamic> json) {
    itemId = json['item_id'];
    itemCode = json['item_code'];
    itemName = json['item_name'];
    printName = json['print_name'];
    barCode = json['bar_code'];
    hsnCode = json['hsn_code'];
    packing = json['packing'];
    mrp = json['mrp'];
    pts = json['pts'];
    ptr = json['ptr'];
    taxValue = json['tax_value'];
    imageUrl = json['image_url'];
    unqCode = json['unq_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['item_id'] = itemId;
    data['item_code'] = itemCode;
    data['item_name'] = itemName;
    data['print_name'] = printName;
    data['bar_code'] = barCode;
    data['hsn_code'] = hsnCode;
    data['packing'] = packing;
    data['mrp'] = mrp;
    data['pts'] = pts;
    data['ptr'] = ptr;
    data['tax_value'] = taxValue;
    data['image_url'] = imageUrl;
    data['unq_code'] = unqCode;
    return data;
  }
}

