import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../global_widgets/apartment_item.dart';
import '../../global_widgets/custom_icon.dart';
import '../../utils/colors.dart';
import '../../models/visit_request.dart';
import '../../services/visit_request.dart';
import '../apartment_requests_screen.dart';

class ReqApatrmentItem extends StatelessWidget {
  final VisitRequest visitRequest;

  const ReqApatrmentItem({super.key, required this.visitRequest});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: 130,
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 4,
                offset: const Offset(0, -2)),
          ],
        ),
        child: Row(
          children: [
            const CustomIcon(
                height: 80, iconName: 'assets/images/buildings.jpeg'),
            const SizedBox(width: 15),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(visitRequest.property.title,
                        style: const TextStyle(fontSize: 12)),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () async {
                        await _deleteRequest(visitRequest.id, context);
                      },
                      child: const Icon(Icons.close, color: Colors.grey),
                    ),
                  ],
                ),
                Text(formatVisitTime(visitRequest.requestedAt),
                    style: const TextStyle(fontSize: 12)),
                const SizedBox(height: 5),
                Row(
                  children: [
                    LocationItem(location: visitRequest.property.location),
                    const SizedBox(width: 5),
                    Icon(Icons.edit, color: mainColor),
                    const SizedBox(width: 5),
                    SizedBox(
                      height: 30,
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          backgroundColor: contrastColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: const Text('Pending',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.w700)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _deleteRequest(int? visitRequestId, BuildContext context) async {
    try {
      final VisitRequestService visitRequestService = VisitRequestService();
      final String token = await _getToken();
      await visitRequestService.deleteVisitRequest(token, visitRequestId!);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Visit request deleted successfully')),
      );

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => const ApartmentRequestsScreen()));
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to delete visit request: $error')),
      );
    }
  }

  Future<String> _getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token') ?? '';
  }

  String formatVisitTime(String visitDate) {
    try {
      final DateTime dateTime = DateTime.parse(visitDate);
      final String formattedOriginalTime =
          DateFormat('hh:mm a').format(dateTime);
      final DateTime oneHourLater = dateTime.add(const Duration(hours: 1));
      final String formattedLaterTime =
          DateFormat('hh:mm a').format(oneHourLater);
      return '$formattedOriginalTime - $formattedLaterTime';
    } catch (e) {
      return 'Invalid time';
    }
  }
}
