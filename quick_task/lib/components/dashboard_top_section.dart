import 'package:flutter/material.dart';

class DashboardTopSection extends StatefulWidget {
  final Size size;

  const DashboardTopSection({super.key, required this.size});

  @override
  State<DashboardTopSection> createState() => _DashboardTopSectionState();
}

class _DashboardTopSectionState extends State<DashboardTopSection> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
      child: Container(
        padding: EdgeInsets.all(10.5),
        width: widget.size.width,
        height: widget.size.height / 3.4,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xFF3B9DD8), Colors.blue.shade100]),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30))),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 20.5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Hello Roman !",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        "Toady you have 9 tasks remaining !",
                        style: TextStyle(
                            color: Colors.white70,
                            fontSize: 13,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      'assets/images/main_img.jpg',
                      fit: BoxFit.cover,
                      height: 55,
                      width: 55,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                width: widget.size.width / 1.1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white38,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Today Reminder !",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 22),
                        ),
                        Text(
                          "Competing Elevator GUI",
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w400,
                              fontSize: 15),
                        ),
                        Text(
                          "12:00 PM",
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w400,
                              fontSize: 15),
                        )
                      ],
                    ),
                    Image.asset(
                      'assets/images/bell1.png',
                      height: 45,
                      width: 45,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
