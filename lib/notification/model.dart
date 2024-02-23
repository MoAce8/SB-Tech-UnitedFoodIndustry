class NotificationDataModel {

  final dynamic image;
  final dynamic body;
  final dynamic title;
  final dynamic type;
  final dynamic id;
  final dynamic url;

  NotificationDataModel({ this.image, required this.body, required this.title, required this.type, required this.id, this.url});

  factory NotificationDataModel.fromJson(Map<String, dynamic> json) {
    return NotificationDataModel(
        image: json['image'],
        body: json['body'],
        title: json['title'],
        type: json['type'],
        id: json['id'],
        url: json['url']);
  }

  Map<String, dynamic> toJson (){
    return {
      'image' : image,
      'body' : body,
      'title' : title,
      'type' : type,
      'id' : id,
      'url' : url,
    };
  }
}