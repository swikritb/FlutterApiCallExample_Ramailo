class PostsDataUiModel {
  int userId;
  int id;
  String title;
  String body;

  PostsDataUiModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  Map<String, dynamic> toMap() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };

  factory PostsDataUiModel.fromMap(Map<String, dynamic> json) =>
      PostsDataUiModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );
}
