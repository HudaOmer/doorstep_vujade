class VisitRequest {
  final int id;
  final int propertyId;
  final int userId;
  final String visitorName;
  final String visitorEmail;
  final String visitDate;
  final String requestedAt;

  VisitRequest({
    required this.id,
    required this.propertyId,
    required this.userId,
    required this.visitorName,
    required this.visitorEmail,
    required this.visitDate,
    required this.requestedAt,
  });

  factory VisitRequest.fromJson(Map<String, dynamic> json) {
    return VisitRequest(
      id: json['id'],
      propertyId: json['property_id'],
      userId: json['user_id'],
      visitorName: json['visitor_name'],
      visitorEmail: json['visitor_email'],
      visitDate: json['visit_date'],
      requestedAt: json['requested_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'property_id': propertyId,
      'user_id': userId,
      'visitor_name': visitorName,
      'visitor_email': visitorEmail,
      'visit_date': visitDate,
    };
  }
}
