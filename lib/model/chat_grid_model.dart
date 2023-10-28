class ChatGridModel {
  final String title;
  final String image;

  ChatGridModel({
    required this.title,
    required this.image,
  });

  factory ChatGridModel.fromJson(Map<String, dynamic> json) => ChatGridModel(
        title: json["title"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "image": image,
      };
}
