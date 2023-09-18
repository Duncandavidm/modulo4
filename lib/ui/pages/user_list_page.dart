import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import '../controllers/user_controller.dart';
import '../widgets/list_item.dart';

class UserListPage extends StatelessWidget {
  const UserListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //HomeController controller = Get.find();
    UserController userController = Get.find();
    return Scaffold(
      appBar: AppBar(title: Text("User list"), actions: <Widget>[
        IconButton(
            key: Key('deleteAllButton'),
            onPressed: () {
              userController.deleteAll();
            },
            icon: Icon(Icons.delete))
      ]),
      floatingActionButton: GetX<HomeController>(
        builder: (controller) {
          return FloatingActionButton(
            key: Key('addUserButton'),
            child: Icon(controller.connection
                ? Icons.add
                : Icons.portable_wifi_off_rounded),
            onPressed: () async {
              if (controller.connection) {
                await userController.addUser();
              } else {
                Get.snackbar('Refresh failed!', "Can't get users",
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.red);
              }
            },
          );
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: _getXlistView(),
      ),
    );
  }

  Widget _getXlistView() {
    UserController userController = Get.find();
    return Obx(
      () => ListView.builder(
        itemCount: userController.users.length,
        itemBuilder: (context, index) {
          final user = userController.users[index];
          return ListItem(user);
        },
        import 'package:flutter/material.dart';
import 'package:mi_proyecto/data/models/random_user.dart'; 
import 'package:mi_proyecto/presentation/pages/user_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<RandomUser> userList = [
      RandomUser(id: '1', name: 'Usuario 1', email: 'usuario1@example.com'),
      RandomUser(id: '2', name: 'Usuario 2', email: 'usuario2@example.com'),
      // Agrega más usuarios a la lista según tus necesidades.
    ];

    return MaterialApp(
      title: 'Mi Proyecto',
      home: UserListScreen(userList: userList),
    );
  }
}

      ),
    );
  }
}
