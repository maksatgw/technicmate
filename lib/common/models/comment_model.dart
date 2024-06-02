class CommentModel {
  String? postId;
  String? text;
  String? userId;
  int? likeCount;
  String? createdAt;
  String? commentId;

  CommentModel(
      {this.postId,
      this.text,
      this.userId,
      this.likeCount,
      this.createdAt,
      this.commentId});

  CommentModel.fromJson(Map<String, dynamic> json) {
    postId = json['post_id'];
    text = json['text'];
    userId = json['user_id'];
    likeCount = json['like_count'];
    createdAt = json['created_at'];
    commentId = json['comment_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['post_id'] = postId;
    data['text'] = text;
    data['user_id'] = userId;
    data['like_count'] = likeCount;
    data['created_at'] = createdAt;
    data['comment_id'] = commentId;
    return data;
  }
}
