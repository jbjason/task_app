class Product {
  Product({
    required this.id,
    required this.caption,
    required this.videoUrl,
    required this.createdAt,
  });

  final String id;
  final String caption;
  final String videoUrl;
  final DateTime createdAt;

  factory Product.fromJson(dynamic json) => Product(
        id: json['id'].toString(),
        caption: json['caption'].toString(),
        videoUrl: json['video_url'].toString(),
        createdAt: DateTime.parse(json['created_at'].toString()),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "caption": caption,
        "video_url": videoUrl,
        "created_at": createdAt.toIso8601String(),
      };
}
