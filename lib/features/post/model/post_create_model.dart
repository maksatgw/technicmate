class PostCreateModel {
  int? postTypeId;
  String? text;

  PostCreateModel({this.postTypeId, this.text});

  PostCreateModel.fromJson(Map<String, dynamic> json) {
    postTypeId = json['post_type_id'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['post_type_id'] = this.postTypeId;
    data['text'] = this.text;
    return data;
  }
}
