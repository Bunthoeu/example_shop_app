import 'package:flutter/material.dart';

import '../theme/color.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _obscureText = true;

  OutlineInputBorder myinputborder() {
    //return type is OutlineInputBorder
    return OutlineInputBorder(

        //Outline border type for TextFeild
        borderRadius: BorderRadius.all(Radius.circular(30)),
        borderSide: BorderSide(
          color: AppColors.blueColor,
          width: 2,
        ));
  }

  OutlineInputBorder myfocusborder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        borderSide: BorderSide(
          color: AppColors.blueColor,
          width: 2,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
        centerTitle: true,
      ),
      body: Center(
          child: Container(
        margin: EdgeInsets.all(16),
        child: Column(
          children: [
            Text('Register Account'),
            Text(
              'Complete your details or continue with social media',
              textAlign: TextAlign.center,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 32),
              child: TextField(
                  decoration: InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(

                          //Outline border type for TextFeild
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          borderSide: BorderSide(
                            color: AppColors.blueColor,
                            width: 2,
                          )), //normal border
                      enabledBorder: OutlineInputBorder(

                          //Outline border type for TextFeild
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          borderSide: BorderSide(
                            color: AppColors.blueColor,
                            width: 2,
                          )), //enabled border
                      focusedBorder: OutlineInputBorder(

                          //Outline border type for TextFeild
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          borderSide: BorderSide(
                            color: AppColors.blueColor,
                            width: 2,
                          )),
                      suffixIcon: Icon(Icons.email_outlined),
                      hintText: 'Enter your Email'
                      // set more border style like disabledBorder
                      )),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 32),
              child: TextField(
                obscureText: _obscureText,
                decoration: InputDecoration(
                    labelText: "Password",
                    enabledBorder: OutlineInputBorder(

                        //Outline border type for TextFeild
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        borderSide: BorderSide(
                          color: AppColors.blueColor,
                          width: 2,
                        )),
                    focusedBorder: OutlineInputBorder(

                        //Outline border type for TextFeild
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        borderSide: BorderSide(
                          color: AppColors.blueColor,
                          width: 2,
                        )),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                        color: Theme.of(context).primaryColorDark,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    ),
                    hintText: 'Enter your password'),
              ),
            ),
            TextField(
                decoration: InputDecoration(
                    labelText: "Re-enter password",
                    enabledBorder: OutlineInputBorder(

                        //Outline border type for TextFeild
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        borderSide: BorderSide(
                          color: AppColors.blueColor,
                          width: 2,
                        )),
                    focusedBorder: OutlineInputBorder(

                        //Outline border type for TextFeild
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        borderSide: BorderSide(
                          color: AppColors.blueColor,
                          width: 2,
                        )),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                        color: Theme.of(context).primaryColorDark,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    ),
                    hintText: 'Re-enter your password')),
            Container(
              margin: EdgeInsets.only(top: 32),
              width: MediaQuery.of(context).size.width * 0.6,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.blueColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  elevation: 15.0,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    'Continute',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:product_shop_api/theme/color.dart';

// class RegisterScreen extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return _IntroScreen();
//   }
// }

// OutlineInputBorder myinputborder() {
//   //return type is OutlineInputBorder
//   return OutlineInputBorder(

//       //Outline border type for TextFeild
//       borderRadius: BorderRadius.all(Radius.circular(30)),
//       borderSide: BorderSide(
//         color: AppColors.blueColor,
//         width: 2,
//       ));
// }

// OutlineInputBorder myfocusborder() {
//   return OutlineInputBorder(
//       borderRadius: BorderRadius.all(Radius.circular(30)),
//       borderSide: BorderSide(
//         color: AppColors.blueColor,
//         width: 2,
//       ));
// }

// class _IntroScreen extends State<RegisterScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Sign Up'),
//         centerTitle: true,
//       ),
//       body: Center(
//           child: Container(
//         margin: EdgeInsets.all(16),
//         child: Column(
//           children: [
//             Text('Register Account'),
//             Text(
//               'Complete your details or continue with social media',
//               textAlign: TextAlign.center,
//             ),
//             Container(
//               margin: EdgeInsets.symmetric(vertical: 32),
//               child: TextField(
//                   decoration: InputDecoration(
//                        contentPadding: EdgeInsets.symmetric(horizontal: 20),
//                       labelText: "Email",
//                       border: myinputborder(), //normal border
//                       enabledBorder: myinputborder(), //enabled border
//                       focusedBorder: myfocusborder(),
//                       suffixIcon: Icon(Icons.email_outlined),
//                       hintText: 'Enter your Email'
//                       // set more border style like disabledBorder
//                       )),
//             ),
//             Container(
//               margin: EdgeInsets.only(bottom: 32),
//               child: TextField(
//                 decoration: InputDecoration(
//                     labelText: "Password",
//                     enabledBorder: myinputborder(),
//                     focusedBorder: myfocusborder(),
//                     suffixIcon: Icon(Icons.key),
//                     hintText: 'Enter your password'),
//               ),
//             ),
//             TextField(
//                 decoration: InputDecoration(
//                     labelText: "Password",
//                     enabledBorder: myinputborder(),
//                     focusedBorder: myfocusborder(),
//                     suffixIcon: Icon(Icons.key),
//                     hintText: 'Re-enter your password')),
//             Container(
//               margin: EdgeInsets.only(top: 32),
//               width: MediaQuery.of(context).size.width * 0.6,
//               child: ElevatedButton(
//                 onPressed: () {},
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: AppColors.blueColor,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(25),
//                   ),
//                   elevation: 15.0,
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(12.0),
//                   child: Text(
//                     'Continute',
//                     style: TextStyle(fontSize: 18),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       )),
//     );
//   }
// }
