import 'package:erobot_mobile/app/data/models/image_model.dart';
import 'package:erobot_mobile/app/data/models/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post_model.g.dart';

@JsonSerializable()
class PostModel {
  String? type;
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
