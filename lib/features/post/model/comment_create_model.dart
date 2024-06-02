class CommentCreateModel {
  String? postTypeId;
  String? replyPost;
  String? text;

  CommentCreateModel({this.postTypeId, this.text, this.replyPost});

  CommentCreateModel.fromJson(Map<String, dynamic> json) {
    postTypeId = json['post_type_id'];
    replyPost = json['reply_post_id'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['post_type_id'] = postTypeId;
    data['reply_post_id'] = replyPost;
    data['text'] = text;
    return data;
  }
}
