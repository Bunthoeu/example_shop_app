import 'package:flutter/material.dart';

import 'package:introduction_screen/introduction_screen.dart';

import 'package:product_shop_api/main_screen.dart';
import 'package:product_shop_api/sign_in_screen/sign_in_screen.dart';
import 'package:product_shop_api/theme/color.dart';

class IntroScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _IntroScreen();
  }
}

class _IntroScreen extends State<IntroScreen> {
  bool isDone = false;
  @override
  void initState() {
    //  isDone = !true;
    // TODO: implement initState
    super.initState();
  }
  // void initState() {
  //   super.initState();
  //   // InternetConnectionChecker().onStatusChange.listen((status) {
  //   //   final connected = status == InternetConnectionStatus.connected;
  //   //   showSimpleNotification(
  //   //       Text(connected ? "CONNECTED TO INTERNET" : "NO INTERNET"),
  //   //       background: connected ? Colors.green : Colors.red);
  //   // });
  // }

  @override
  Widget build(BuildContext context) {
    PageDecoration pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(
          fontSize: 28.0, fontWeight: FontWeight.w700, color: Colors.blue),
      bodyTextStyle: TextStyle(fontSize: 19.0, color: Colors.blue),
      imagePadding: EdgeInsets.all(20),
      boxDecoration: BoxDecoration(color: Colors.white),
    );

    return IntroductionScreen(
      globalBackgroundColor: Colors.white,
      pages: [
        PageViewModel(
          title: "Fractional shares",
          body:
              "Instead of having to buy an entire share, invest any amount you want.",
          image: introImage('assets/images/4.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Fractional shares",
          body:
              "Instead of having to buy an entire share, invest any amount you want.",
          image: introImage('assets/images/2.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Fractional shares",
          body:
              "Instead of having to buy an entire share, invest any amount you want.",
          image: introImage('assets/images/3.png'),
          decoration: pageDecoration,
        ),

        //add more screen here
      ],
      onDone: () => goIntropage(context),
      onSkip: () => goIntropage(context),
      showSkipButton: true,
      nextFlex: 0,
      hideBottomOnKeyboard: true,
      skip: Text(
        'Skip',
        style: TextStyle(color: AppColors.blueColor),
      ),
      next: Container(
        width: MediaQuery.of(context).size.width * 0.2,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppColors.blueColor,
        ),
        child: Icon(
          Icons.arrow_forward,
          color: Colors.white,
        ),
      ),
      done: Container(
        width: MediaQuery.of(context).size.width * 0.2,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppColors.blueColor,
        ),
        child: Text(
          '    Done',
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
        ),
      ),
      dotsDecorator: const DotsDecorator(
        size: Size(8.0, 8.0), //size of dots
        color: Color.fromARGB(255, 212, 207, 207), //color of dots
        activeSize: Size(22.0, 10.0),
        activeColor: Color.fromARGB(255, 4, 54, 95), //color of active dot
        activeShape: RoundedRectangleBorder(
          //shave of active dot
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }

  void goIntropage(context) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) {
      return SignInScreen();
    }), (Route<dynamic> route) => false);
  }

  Widget introImage(String assetName) {
    //widget to show intro image
    return Align(
      child: Image.asset(
        '$assetName',
        width: 350.0,
        fit: BoxFit.cover,
      ),
      alignment: Alignment.bottomCenter,
    );
  }
}
