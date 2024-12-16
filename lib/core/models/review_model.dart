import 'package:fruit_hub/core/entities/review_entity.dart';

class ReviewModel {
  final String name;
  final String image;
  final num ratting;
  final String data;
  final String reviewDescription;

  ReviewModel(
      {required this.name,
      required this.image,
      required this.ratting,
      required this.data,
      required this.reviewDescription});

  factory ReviewModel.fromEntity(ReviewEntity entity) {
    return ReviewModel(
        name: entity.name,
        image: entity.image,
        ratting: entity.ratting,
        data: entity.date,
        reviewDescription: entity.reviewDescription);
  }

  factory ReviewModel.fromJson(Map<String, dynamic> map) {
    return ReviewModel(
        name: map['name'],
        image: map['image'],
        ratting: map['ratting'],
        data: map['data'],
        reviewDescription: map['reviewDescription']);
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
      'ratting': ratting,
      'data': data,
      'reviewDescription': reviewDescription
    };
  }

  ReviewEntity toEntity() {
    return ReviewEntity(
        name: name,
        image: image,
        ratting: ratting,
        date: data,
        reviewDescription: reviewDescription);
  }
}
