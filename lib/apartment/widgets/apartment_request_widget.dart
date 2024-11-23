import 'package:flutter/material.dart';
import 'package:doorstep_vujade/global_widgets/custom_icon.dart';
import '../../utils/colors.dart';
import '../../models/visit_request.dart';

class ReqApartmentItem extends StatelessWidget {
  final VisitRequest visitRequest;
  final bool isFav;

  const ReqApartmentItem(
      {super.key, required this.visitRequest, required this.isFav});

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
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          children: [
            const CustomIcon(
                height: 80, iconName: 'assets/images/buildings.jpeg'),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        visitRequest.visitorName, // Visitor's name
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Icon(isFav ? Icons.favorite : Icons.favorite_border,
                          color: mainColor),
                    ],
                  ),
                  Text(
                    visitRequest.visitDate, // Visit date
                    style: const TextStyle(fontSize: 12),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Text('approved', style: TextStyle(color: contrastColor)),
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
                          child: const Text(
                            'Pending',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
