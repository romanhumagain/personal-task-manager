import 'package:flutter/material.dart';
import 'package:quick_task/pages/Home.dart';
import 'package:quick_task/pages/Profile.dart';
import 'package:quick_task/pages/dashboard.dart';
import 'package:quick_task/pages/login.dart';
import 'package:quick_task/services/auth_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final AuthServices authServices = AuthServices();
  bool isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    checkUserLoginStatus();
  }

  // Function to check the login status and refresh the token if necessary
  void checkUserLoginStatus() async {
    bool loggedIn = await authServices.isLoggedIn();

    // If user is logged in, skip refreshing the token
    if (loggedIn) {
      setState(() {
        isLoggedIn = true;
      });
      return;
    }

    // If not logged in, try refreshing the access token
    try {
      await authServices.refreshAccessToken();
      loggedIn = await authServices.isLoggedIn(); // Check again after refresh
      setState(() {
        isLoggedIn = loggedIn;
      });
    } catch (e) {
      // Handle any errors during refresh (e.g., token expiration)
      print("Error refreshing token: $e");
      setState(() {
        isLoggedIn = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.blue.shade100],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Container(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 150.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                            child: Image.asset('assets/images/todo_splash.png',
                                height: 130, width: 140)),
                        SizedBox(
                          height: 50,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text(
                            "Focus on what matters.",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 28,
                                shadows: [
                                  Shadow(
                                      offset: Offset(1.0, 2.0),
                                      blurRadius: 3.0,
                                      color: Colors.grey.withOpacity(0.5))
                                ]),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 36.5),
                          child: Text(
                            "Effortlessly manage your tasks, prioritize what will matter most, and stay productive throughout the day.",
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.black45),
                          ),
                        ),
                        SizedBox(
                          height: 90,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 100.0),
              child: GestureDetector(
                onTap: () {
                  isLoggedIn
                      ? Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => Home()))
                      : Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                },
                child: Material(
                  elevation: 8,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    width: size.width / 1.5,
                    padding: EdgeInsets.symmetric(vertical: 14, horizontal: 20),
                    decoration: BoxDecoration(
                        gradient:
                            LinearGradient(colors: [Colors.blue, Colors.pink]),
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Get Started ",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 17),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
