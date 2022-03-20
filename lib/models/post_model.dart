import 'package:erobot_mobile/models/image_model.dart';
import 'package:erobot_mobile/models/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post_model.g.dart';

@JsonSerializable()
class PostModel {
  String? type;
  String? title;
  String? body;
  String? updatedAt;
  String? createdAt;
  int? commentCount;
  int? reactionCount;
  String? id;
  List<ImageModel>? images;
  UserModel? author;

  PostModel({
    this.type,
    this.title,
    this.body,
    this.updatedAt,
    this.createdAt,
    this.commentCount,
    this.reactionCount,
    this.id,
    this.images,
    this.author,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) => _$PostModelFromJson(json);
  Map<String, dynamic> toJson() => _$PostModelToJson(this);
}
