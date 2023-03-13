import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class IncomeCard extends StatelessWidget {
  const IncomeCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(children: [
      Text("income"),
      Text("\$500")
    ],);
  }
}