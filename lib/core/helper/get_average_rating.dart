num getAvgRating(dynamic reviewsData) {
  if (reviewsData == null || (reviewsData is List && reviewsData.isEmpty)) {
    return 0.0; // Return 0 if no reviews
  }
  
  List<dynamic> reviews = reviewsData is List ? reviewsData : [];
  var sum = 0.0;
  for (var review in reviews) {
    // Check if the review has a rating field and it's a number
    if (review is Map && review.containsKey('ratting')) {
      sum += (review['ratting'] is num) ? review['ratting'] : 0;
    }
  }
  
  return reviews.isEmpty ? 0.0 : sum / reviews.length;
}