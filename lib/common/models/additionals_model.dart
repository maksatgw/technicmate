class Additionals {
  int? additionalTypeId;
  String? inx;
  String? data;

  Additionals({this.additionalTypeId, this.inx, this.data});

  Additionals.fromJson(Map<String, dynamic> json) {
    additionalTypeId = json['additional_type_id'];
    inx = json['inx'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['additional_type_id'] = additionalTypeId;
    data['inx'] = inx;
    data['data'] = this.data;
    return data;
  }
}
