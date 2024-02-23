class FCMDataModel {
  final dynamic image;
  final dynamic body;
  final dynamic title;
  final dynamic type;
  final dynamic orderId;
  final dynamic url;

  FCMDataModel(
      {this.image,
        required this.body,
        required this.title,
        required this.type,
        required this.orderId,
        this.url});

  factory FCMDataModel.fromJson(Map<String, dynamic> json) {
    return FCMDataModel(
        image: json['image'],
        body: json['body'],
        title: json['title'],
        type: json['type'],
        orderId: json['order_id'],
        url: json['url']);
  }
}