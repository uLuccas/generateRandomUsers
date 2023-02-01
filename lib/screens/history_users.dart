import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HistoryUsers extends StatelessWidget {
  List listUsers;
  HistoryUsers({super.key, required this.listUsers});

  @override
  Widget build(BuildContext context) {
    print("+================ LIST =================");
    print(listUsers);
    return Scaffold(
      appBar: AppBar(title: Text('Tela de historico')),
      body: ListView.builder(
        itemCount: listUsers.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: listUsers[index].name.first,
          );
        },
      ),
    );
  }
}
