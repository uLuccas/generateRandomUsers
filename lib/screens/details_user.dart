import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:generate_users/utils/styles_text.dart';

import '../models/randon_user_models.dart';

class DetailsUser extends StatelessWidget {
  final RandomUser? data;
  const DetailsUser({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${data?.results[0].name.first}'),
      ),
      body: Container(
          padding: EdgeInsets.only(top: 40, left: 15, right: 15),
          // decoration:
          // BoxDecoration(borderRadius: BorderRadius.only(bottomRight: )),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  // color: Colors.red,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50.0),
                  child: Image.network(
                    fit: BoxFit.fill,
                    height: 100.0,
                    width: 100.0,
                    data!.results[0].picture.thumbnail,
                  ),
                ),
              ),
              const Gap(10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data!.results[0].name.title,
                    style: Styles.title,
                  ),
                  Text(
                    data!.results[0].name.first,
                    style: Styles.subtitle,
                  ),
                ],
              )
            ],
          )),
    );
  }
}
