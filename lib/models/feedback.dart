class FeedBack {
  final int userId;
  final int propertyId;
  final int rating;
  final String comment;

  FeedBack({
    required this.userId,
    required this.propertyId,
    required this.rating,
    required this.comment,
  });

  // Convert JSON to Feedback
  factory FeedBack.fromJson(Map<String, dynamic> json) {
    return FeedBack(
      userId: json['user_id'],
      propertyId: json['property_id'],
      rating: json['rating'],
      comment: json['comment'] ?? '',
    );
  }

  // Convert Feedback to JSON
  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'property_id': propertyId,
      'rating': rating,
      'comment': comment,
    };
  }
}
