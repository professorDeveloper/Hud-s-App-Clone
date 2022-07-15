
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:watsapp_clone/common/widgets/error.dart';
import 'package:watsapp_clone/features/auth/screen/login_screen.dart';
import 'package:watsapp_clone/features/auth/screen/otp_screen.dart';
import 'package:watsapp_clone/features/auth/screen/user_information_screen.dart';
import 'package:watsapp_clone/features/select_contact/screen/select_contact_screen.dart';
import 'package:watsapp_clone/features/chat/screens/mobile_chat_screen.dart';

Route<dynamic>generateRoute(RouteSettings routeSettings){
  switch(routeSettings.name){
    case LoginScreen.routeName :
      return MaterialPageRoute(builder: (context) => const LoginScreen(),);
    case OTPScreen.routeName :
      final vertificationId =routeSettings.arguments as String;
      return MaterialPageRoute(builder: (context) =>  OTPScreen(verificationId: vertificationId),);
    case UserInformationScreen.routeName :
      return MaterialPageRoute(builder: (context) => const UserInformationScreen(),);
    case SelectContactsScreen.routeName :
      return MaterialPageRoute(builder: (context) => const SelectContactsScreen(),);
    case MobileChatScreen.routeName :
      final arguments = routeSettings.arguments as Map<String, dynamic>;
      final name = arguments['name'];
      final uid = arguments['uid'];
      final isGroupChat = arguments['isGroupChat'];
      final profilePic = arguments['profilePic'];
      return MaterialPageRoute(
        builder: (context) => MobileChatScreen(
          name: name,
          uid: uid,
        ),
      );
    default :
      return MaterialPageRoute(builder: (context) =>const Scaffold(
        body: ErrorScreen(error: "Bunday Paket Topilmadi"),

      ));
  }
}