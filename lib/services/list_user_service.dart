import 'package:generate_users/models/randon_user_models.dart';

class ListUsers {
  var arrUser = [];

  ListUsers({required this.arrUser});

  addUser(RandomUser data) {
    if (data.results.isNotEmpty) {
      print(data.results[0].email);
      print(arrUser);
      var slice = arrUser.add(data);
      return slice;
    }
  }

// tenho que fazer ainda o metodo de pegar os dados da variavel arrUser.
  getUsers() {
    return arrUser;
  }
}
