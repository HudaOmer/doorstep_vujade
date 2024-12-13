import 'package:flutter/material.dart';
import '../utils/colors.dart';
import 'widgets/apartment_request_widget.dart';
import '../services/visit_request.dart';
import '../models/visit_request.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApartmentRequestsScreen extends StatefulWidget {
  const ApartmentRequestsScreen({super.key});

  @override
  State<ApartmentRequestsScreen> createState() =>
      _ApartmentRequestsScreenState();
}

class _ApartmentRequestsScreenState extends State<ApartmentRequestsScreen> {
  final VisitRequestService _visitRequestService = VisitRequestService();
  late Future<List<VisitRequest>> _visitRequestsFuture;
  late String _token;

  @override
  void initState() {
    super.initState();
    _loadToken();
  }

  Future<void> _loadToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _token = prefs.getString('token') ?? '';
    // print(_token);

    if (_token.isNotEmpty) {
      _visitRequestsFuture = _visitRequestService.getVisitRequests(_token);
      setState(() {});
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('User is not authenticated.')),
      );
    }
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
            child: Text('Requests    ', style: TextStyle(fontSize: 20))),
        leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back_ios)),
      ),
      body: _token.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : FutureBuilder<List<VisitRequest>>(
              future: _visitRequestsFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(
                      child: Text(
                          'Error: ${snapshot.error?.toString() ?? 'Unknown error'}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No requests found.'));
                }

                final visitRequests = snapshot.data!;
                return SingleChildScrollView(
                  child: Column(
                    children: visitRequests.map((request) {
                      return ReqApatrmentItem(visitRequest: request);
                    }).toList(),
                  ),
                );
              },
            ),
    );
  }
}
