import 'property.dart';

class VisitRequest {
  final int? id;
  final String visitorName;
  final String visitorEmail;
  final String visitDate;
  final String requestedAt;
  final Property property;

  VisitRequest({
    this.id,
    required this.visitorName,
    required this.visitorEmail,
    required this.visitDate,
    required this.requestedAt,
    required this.property,
  });

  factory VisitRequest.fromJson(Map<String, dynamic> json) {
    return VisitRequest(
      id: json['id'],
      visitorName: json['visitor_name'],
      visitorEmail: json['visitor_email'],
      visitDate: json['visit_date'],
      requestedAt: json['requested_at'],
      property: Property.fromJson(json['property']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'visitor_name': visitorName,
      'visitor_email': visitorEmail,
      'visit_date': visitDate,
      'property_id': property.id,
    };
  }
}
