import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:money_management_app/model/HomeCard/Home_Card_model.dart';
import 'package:money_management_app/model/transaction/transaction_model.dart';
import 'package:money_management_app/screens/transactions/Screen_transactions.dart';
import 'Splash_Screen.dart';
import 'home/Screen_home.dart';
import 'model/budget/budget_model.dart';
import 'model/category/category_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();

  await Hive.initFlutter();
  await Hive.openBox('HomeCarddb');
  await Hive.openBox('transactionscounter');
  
  if (!Hive.isAdapterRegistered(CategoryModelAdapter().typeId)) {
    Hive.registerAdapter(
      CategoryModelAdapter(),
    );
  }

  if (!Hive.isAdapterRegistered(CategoryTypeAdapter().typeId)) {
    Hive.registerAdapter(
      CategoryTypeAdapter(),
    );
  }

  if (!Hive.isAdapterRegistered(TransactionModelAdapter().typeId)) {
    Hive.registerAdapter(
      TransactionModelAdapter(),
    );
  }

  if (!Hive.isAdapterRegistered(SpendModelAdapter().typeId)) {
    Hive.registerAdapter(
      SpendModelAdapter(),
    );
  }

  if (!Hive.isAdapterRegistered(LimitModelAdapter().typeId)) {
    Hive.registerAdapter(
      LimitModelAdapter(),
    );
  }

  if (!Hive.isAdapterRegistered(HomeCardModelAdapter().typeId)) {
    Hive.registerAdapter(
      HomeCardModelAdapter(),
    );
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'money manager',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: Screen_home(),
      debugShowCheckedModeBanner: false,
    );
  }
}
