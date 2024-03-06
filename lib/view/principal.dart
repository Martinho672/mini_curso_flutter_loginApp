import 'package:flutter/material.dart';
import 'package:mini_curso_flutter_login_app/view/login_screen.dart';
import '../controller/user_controller.dart';
import '../model/user.dart';

class principal_screen extends StatefulWidget {
  const principal_screen({super.key});

  @override
  State<principal_screen> createState() => _principal_screenState();
}

class _principal_screenState extends State<principal_screen> {
  final UserController _userController = UserController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Principal"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () async {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()));
          },
        ),
        backgroundColor: Colors.blueGrey,
      ),
      body: FutureBuilder<List<User>>(
        future: _userController.fetchUserData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<User> usuario = snapshot.data!;
            return ListView.builder(
              itemCount: usuario.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(5.0),
                  child: Card(
                    elevation: 4,
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5.0),
                          alignment: Alignment.bottomLeft,
                          child: Text(usuario[index].first),
                        ),
                        Container(
                          padding: const EdgeInsets.all(5.0),
                          alignment: Alignment.bottomLeft,
                          child: Text(usuario[index].email),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }

          return CircularProgressIndicator();
        },
      ),
    );
  }
}
