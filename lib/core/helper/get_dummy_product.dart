import 'dart:io';

import 'package:fruit_hub/core/entities/product_entity.dart';
import 'package:fruit_hub/core/entities/review_entity.dart';

// Creating sample ReviewEntity objects
final List<ReviewEntity> sampleReviews = [
  ReviewEntity(
    name: "John Doe",
    image: "https://example.com/user1.jpg",
    ratting: 4.5,
    date: "2025-03-01",
    reviewDescription: "Really fresh and delicious fruit! Highly recommend.",
  ),
  ReviewEntity(
    name: "Jane Smith",
    image: "https://example.com/user2.jpg",
    ratting: 4.0,
    date: "2025-03-05",
    reviewDescription: "Good quality, but delivery was a bit slow.",
  ),
];

// Creating a ProductEntity object
final ProductEntity sampleProduct = ProductEntity(
  name: "Organic Apple",
  description: "Fresh, crisp, and organically grown apples from local farms.",
  code: "APP001",
  price: 2.99,
  isFeaturedItem: true,
  imageFile: File("/path/to/local/image.jpg"), // Replace with actual file path
  imageUrl: "https://example.com/products/apple.jpg",
  expirationsMonth: 6,
  isOrganic: true,
  numberOfCalories: 95,
  unitAmount: 1,
  reviewEntities: sampleReviews,
);


List<ProductEntity> getDummyProduct() => [
  sampleProduct, 
  sampleProduct, 
  sampleProduct, 
  sampleProduct, 
  sampleProduct, 
  sampleProduct,
    sampleProduct, 
  sampleProduct, 
  sampleProduct, 
  sampleProduct, 
  sampleProduct, 
  sampleProduct,
    sampleProduct, 
  sampleProduct, 
  sampleProduct, 
  sampleProduct, 
  sampleProduct, 
  sampleProduct,
];