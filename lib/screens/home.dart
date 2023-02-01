import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:generate_users/models/randon_user_models.dart';
import 'package:generate_users/screens/details_user.dart';
import 'package:generate_users/screens/history_users.dart';
import 'package:generate_users/services/list_user_service.dart';
import 'package:generate_users/services/random_user_service.dart';
import 'package:generate_users/utils/styles_text.dart';
// import 'package:generate_users/widgets/card_user.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  RandomUser? data;
  ListUsers? listUsers = ListUsers(arrUser: []);

  void handleGetRandomUser() async {
    final response = await getRandomUser();
    setState(() {
      data = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Random User"),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Card(
              shape: const RoundedRectangleBorder(
                side: BorderSide(
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: data != null
                        ? ListTile(
                            onTap: () {
                              if (data != null) {
                                listUsers?.addUser(data!);

                                var teste =
                                    listUsers?.getUsers()[0].results[0].email;
                                print(teste);
                              }

                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) {
                                return DetailsUser(data: data);
                              }));
                            },
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                data!.results[0].picture.thumbnail,
                              ),
                            ),
                            title: Text(data!.results[0].name.first),
                            subtitle: Text(data!.results[0].email),
                          )
                        : ListTile(
                            leading: Image.network(
                                'https://cdn-icons-png.flaticon.com/512/3135/3135715.png'),
                            title: Text(
                              'Luccas o brabo',
                              style: Styles.title,
                            ),
                            subtitle: Text(
                              'luccas.brabo@email.com',
                              style: Styles.subtitle,
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ),
          const Gap(20),
          ElevatedButton(
            onPressed: () => {
              handleGetRandomUser(),
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                var teste = listUsers?.getUsers();
                return HistoryUsers(
                  listUsers: teste,
                );
                // return HistoryUsers(
                //   listUsers: teste,
                // );
              }))
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(16),
              shape: const StadiumBorder(),
            ),
            child: const Text(
              "Generate random user",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
