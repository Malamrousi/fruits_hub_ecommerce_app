import 'dart:io';

import 'package:fruit_hub/core/entities/product_entity.dart';
import 'package:fruit_hub/core/models/review_model.dart';

class ProductModel {
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
  final List<ReviewModel> reviewModels;
  final int sellingAmount;
  ProductModel({
    required this.name,
    required this.description,
    required this.code,
    required this.price,
    required this.isFeaturedItem,
    required this.imageFile,
    this.imageUrl,
    this.sellingAmount = 0,
    required this.expirationsMonth,
    required this.isOrganic,
    required this.numberOfCalories,
    required this.unitAmount,
    required this.reviewModels,
  });

  // factory ProductModel.fromProductEntity(ProductEntity productEntity) {
  //   return ProductModel(
  //       reviewModels: productEntity.reviewEntities
  //           .map((e) => ReviewModel.fromEntity(e))
  //           .toList(),
  //       name: productEntity.name,
  //       description: productEntity.description,
  //       code: productEntity.code,
  //       price: productEntity.price,
  //       isFeaturedItem: productEntity.isFeaturedItem,
  //       imageFile: productEntity.imageFile,
  //       imageUrl: productEntity.imageUrl,
  //       expirationsMonth: productEntity.expirationsMonth,
  //       isOrganic: productEntity.isOrganic,
  //       numberOfCalories: productEntity.numberOfCalories,
  //       unitAmount: productEntity.unitAmount);
  // }

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      name: json['name'],
      description: json['description'],
      code: json['code'],
      price: json['price'],
      isFeaturedItem: json['isFeaturedItem'],
      imageFile: File(json['imageFile']),
      imageUrl: json['imageUrl'],
      expirationsMonth: json['expirationsMonth'],
      isOrganic: json['isOrganic'],
      numberOfCalories: json['numberOfCalories'],
      unitAmount: json['unitAmount'],
      reviewModels: List<ReviewModel>.from(
          json['reviewModels'].map((e) => ReviewModel.fromJson(e))),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'code': code,
      'price': price,
      'isFeaturedItem': isFeaturedItem,
      'imageUrl': imageUrl,
      'expirationsMonth': expirationsMonth,
      'sellingAmount': sellingAmount,
      'isOrganic': isOrganic,
      'numberOfCalories': numberOfCalories,
      'unitAmount': unitAmount,
      'reviewModels': reviewModels.map((e) => e.toJson()).toList()
    };
  }

ProductEntity toEntity() {

    return ProductEntity(
        name: name,
        description: description,
        code: code,
        price: price,
        isFeaturedItem: isFeaturedItem,
        imageFile: imageFile,
        imageUrl: imageUrl,
        expirationsMonth: expirationsMonth,
        isOrganic: isOrganic,
        numberOfCalories: numberOfCalories,
        unitAmount: unitAmount,
        reviewEntities: reviewModels.map((e) => e.toEntity()).toList());
  }
}
