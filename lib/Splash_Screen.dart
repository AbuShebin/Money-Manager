// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:money_management_app/screens/transactions/Screen_transactions.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({Key? key}) : super(key: key);

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     gotologin();
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
          
//         ],
//       ),
//     );
//   }
//   Future gotologin()async{
//     await Future.delayed(Duration(seconds: 3));
//     Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>const Screen_transactions(title: '',)));
//   }
// }