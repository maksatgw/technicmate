class PostCreateModel {
  int? postTypeId;
  String? text;

  PostCreateModel({this.postTypeId, this.text});

  PostCreateModel.fromJson(Map<String, dynamic> json) {
    postTypeId = json['post_type_id'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['post_type_id'] = postTypeId;
    data['text'] = text;
    return data;
  }
}
