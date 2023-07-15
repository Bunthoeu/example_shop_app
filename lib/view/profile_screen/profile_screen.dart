import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:product_shop_api/controller/controller_email_password.dart';
import 'package:product_shop_api/sign_in_screen/sign_in_screen.dart';
import 'package:product_shop_api/theme/color.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../auth/bloc/auth_bloc.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final user = FirebaseAuth.instance.currentUser;
  final picker = ImagePicker();
  late SharedPreferences _preferences;
  Uint8List? _imageBytes;

  Future<void> _initPreferences() async {
    _preferences = await SharedPreferences.getInstance();
    setState(() {
      _imageBytes = _preferences.containsKey('image')
          ? base64Decode(_preferences.getString('image').toString())
          : null;
    });
  }

  Future<void> _getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();
      setState(() {
        _imageBytes = bytes;
      });
      await _preferences.setString('image', base64Encode(bytes));
    }
  }

  @override
  void initState() {
    _initPreferences();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            'Profile',
            style: TextStyle(
              color: AppColors.blueColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(right: 16, left: 16),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    _imageBytes == null
                        ? Container(
                            margin: EdgeInsets.only(bottom: 16),
                            height: 120,
                            width: 120,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.grey,
                              ),
                            ),
                            child: _imageBytes == null
                                ? Icon(
                                    Icons.person,
                                    size: 50,
                                  )
                                : Image.memory(_imageBytes!),
                          )
                        : Container(
                            margin: EdgeInsets.only(bottom: 16),
                            height: 120,
                            width: 120,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                                image: DecorationImage(
                                    image: MemoryImage(_imageBytes!))),
                          ),
                    Positioned(
                      bottom: 10,
                      right: 0,
                      child: GestureDetector(
                        onTap: _getImageFromGallery,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.grey[300]),
                          child: Icon(
                            Icons.camera_alt_outlined,
                            color: AppColors.blueColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    if (state is AuthLogedInState) {
                      return Text(
                        user!.email.toString(),
                        style: TextStyle(fontSize: 25),
                      );
                    }
                    return Text('No user');
                  },
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 16, top: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Color.fromARGB(255, 224, 235, 245),
                  ),
                  child: ListTile(
                    leading: Icon(
                      Icons.person_outline_outlined,
                      color: AppColors.blueColor,
                    ),
                    title: Text(
                      'My Account',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.blueColor,
                      ),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 20,
                      color: AppColors.blueColor,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Color.fromARGB(255, 224, 235, 245),
                  ),
                  child: ListTile(
                    leading: Icon(
                      Icons.notifications_none_rounded,
                      color: AppColors.blueColor,
                    ),
                    title: Text(
                      'Notifications',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.blueColor,
                      ),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 20,
                      color: AppColors.blueColor,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Color.fromARGB(255, 224, 235, 245),
                  ),
                  child: ListTile(
                    leading: Icon(
                      Icons.settings,
                      color: AppColors.blueColor,
                    ),
                    title: Text(
                      'Settings',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.blueColor,
                      ),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 20,
                      color: AppColors.blueColor,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Color.fromARGB(255, 224, 235, 245),
                  ),
                  child: ListTile(
                    leading: Icon(
                      Icons.help,
                      color: AppColors.blueColor,
                    ),
                    title: Text(
                      'Help Center',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.blueColor,
                      ),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 20,
                      color: AppColors.blueColor,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    context.read<AuthBloc>().add(AuthLogOutEvent());
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignInScreen()));
                    eamilController.clear();
                    PasswordController.clear();
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Color.fromARGB(255, 224, 235, 245),
                    ),
                    child: ListTile(
                      leading: Icon(
                        Icons.logout,
                        color: Colors.red,
                      ),
                      title: Text(
                        'Log Out',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 20,
                        color: AppColors.blueColor,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
