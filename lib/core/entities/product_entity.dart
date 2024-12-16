// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:fruit_hub/core/entities/review_entity.dart';


class ProductEntity {
  final String name;
  final String description;
  final String code;
  final num price;
  final bool isFeaturedItem;
  final File imageFile;
  String? imageUrl;
  final int expirationsMonth;
  final bool isOrganic;
  final int numberOfCalories;
  final int unitAmount;
  final num averageRating = 0;
  final num ratingCount = 0;
  final List<ReviewEntity> reviewEntities;
  ProductEntity( {
    required this.name,
    required this.description,
    required this.code,
    required this.price,
    required this.isFeaturedItem,
    required this.imageFile,
    this.imageUrl,
    required this.expirationsMonth,
    required this.isOrganic,
    required this.numberOfCalories,
    required this.unitAmount,
   required this.reviewEntities,
  });
}
