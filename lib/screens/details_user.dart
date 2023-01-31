import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:generate_users/utils/styles_text.dart';

import '../models/randon_user_models.dart';
import '../utils/app_layout.dart';

class DetailsUser extends StatefulWidget {
  final RandomUser? data;
  const DetailsUser({super.key, required this.data});

  @override
  State<DetailsUser> createState() => _DetailsUserState();
}

class _DetailsUserState extends State<DetailsUser> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.data?.results[0].name.first}'),
      ),
      body: ListView(children: [
        Container(
          padding: const EdgeInsets.only(top: 40, left: 15, right: 15),
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
                    widget.data!.results[0].picture.thumbnail,
                  ),
                ),
              ),
              const Gap(15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(25),
                  Text(
                    widget.data!.results[0].name.title,
                    style: Styles.title.copyWith(fontSize: 20),
                  ),
                  Text(
                    '${widget.data!.results[0].name.first} ${widget.data!.results[0].name.last}',
                    style: Styles.subtitle.copyWith(fontSize: 20),
                  ),
                ],
              )
            ],
          ),
        ),
        const Gap(20),
        Container(
          width: size.width * 0.44,
          height: 150,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: const BoxDecoration(
            color: Colors.amber,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'INFORMAÇÕES DE LOGIN',
                    style: Styles.title,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Gap(15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Username',
                            style: Styles.title,
                          ),
                          const Gap(5),
                          Text(
                            widget.data!.results[0].login.username,
                            style: Styles.subtitle,
                          ),
                        ],
                      )
                    ],
                  ),
                  Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Gap(15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Password',
                            style: Styles.title,
                          ),
                          const Gap(5),
                          Row(
                            children: [
                              SizedBox(
                                width: size.width * .15,
                                child: Text(
                                  textWidthBasis: TextWidthBasis.longestLine,
                                  isVisible
                                      ? widget.data!.results[0].login.password
                                      : '********',
                                  style: Styles.subtitle,
                                ),
                              ),
                              const Gap(20),
                              InkWell(
                                  onTap: () {
                                    setState(() {
                                      isVisible = !isVisible;
                                    });
                                  },
                                  child: isVisible
                                      ? const Icon(
                                          Icons.disabled_visible_outlined)
                                      : const Icon(
                                          Icons.remove_red_eye_outlined))
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ]),
    );
  }
}
