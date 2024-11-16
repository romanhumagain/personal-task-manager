import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:quick_task/main.dart';
import 'package:quick_task/provider/theme_provider.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 60),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Dark Mode",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 23),
                      ),
                      Text(
                        "Change theme mode here",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  CupertinoSwitch(
                      value: context.watch<ThemeProvider>().getMode,
                      onChanged: (value) {
                        context.read<ThemeProvider>().updateTheme(value: value);
                      }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
