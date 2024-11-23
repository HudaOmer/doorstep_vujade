import 'package:flutter/material.dart';
import '../utils/colors.dart';
import 'widgets/apartment_request_widget.dart';
import '../services/visit_request.dart';
import '../models/visit_request.dart';

class ApartmentRequestsScreen extends StatefulWidget {
  const ApartmentRequestsScreen({super.key});

  @override
  State<ApartmentRequestsScreen> createState() =>
      _ApartmentRequestsScreenState();
}

class _ApartmentRequestsScreenState extends State<ApartmentRequestsScreen> {
  final VisitRequestService _visitRequestService = VisitRequestService();
  late Future<List<VisitRequest>> _visitRequestsFuture;

  @override
  void initState() {
    super.initState();
    _visitRequestsFuture = _visitRequestService.fetchVisitRequests(1);
    print(_visitRequestsFuture);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: contrastColor),
        backgroundColor: Colors.white,
        title: const Center(
            child: Text('Requests', style: TextStyle(fontSize: 20))),
        leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back_ios)),
      ),
      body: FutureBuilder<List<VisitRequest>>(
        future: _visitRequestsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No requests found.'));
          }
          print(snapshot);

          final visitRequests = snapshot.data!;

          return SingleChildScrollView(
            child: Column(
              children: visitRequests.map((request) {
                return ReqApartmentItem(isFav: true, visitRequest: request);
              }).toList(),
            ),
          );
        },
      ),
    );
  }
}
