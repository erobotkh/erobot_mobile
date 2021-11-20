class Post {
  String? type;
  String? body;
  String? updatedAt;
  String? createdAt;
  int? commentCount;
  int? reactionCount;
  String? id;
  List<ImageModel>? images;
  User? author;

  Post({
    this.type,
    this.body,
    this.updatedAt,
    this.createdAt,
    this.commentCount,
    this.reactionCount,
    this.id,
    this.images,
    this.author,
  });

  Post.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    body = json['body'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    commentCount = json['comment_count'];
    reactionCount = json['reaction_count'];
    id = json['id'];
    if (json['images'] != null) {
      images = <ImageModel>[];
      json['images'].forEach((v) {
        images?.add(ImageModel.fromJson(v));
      });
    }
    author = json['author'] != null ? User.fromJson(json['author']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['type'] = type;
    data['body'] = body;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['comment_count'] = commentCount;
    data['reaction_count'] = reactionCount;
    data['id'] = id;
    if (images != null) {
      data['images'] = images?.map((v) => v.toJson()).toList();
    }
    if (author != null) {
      data['author'] = author?.toJson();
    }
    return data;
  }
}

class ImageModel {
  String? type;
  String? id;
  String? url;

  ImageModel({this.type, this.id, this.url});

  ImageModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    id = json['id'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['type'] = type;
    data['id'] = id;
    data['url'] = url;
    return data;
  }
}

class User {
  String? id;
  String? type;
  String? firstName;
  String? lastName;
  String? email;

  User({this.id, this.type, this.firstName, this.lastName, this.email});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    return data;
  }
}
