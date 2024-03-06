import 'package:flutter/material.dart';
import 'package:mini_curso_flutter_login_app/view/principal.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  @override
  //constroe a tela do splash
  Widget build(BuildContext context) {
    MediaQueryData deviceInfo = MediaQuery.of(context);

    final _formKey = GlobalKey<FormState>();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();


    return Scaffold(
      backgroundColor: const Color.fromRGBO(241, 245, 249, 1),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                  top: deviceInfo.size.height / 11,
                  bottom: deviceInfo.size.height / 20),
              child: const Center(
                  child: Image(
                      height: 100,
                      width: 100,
                      image: NetworkImage(
                          'https://cdn-icons-png.flaticon.com/512/2417/2417592.png'))),
            ),
            Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: Colors.black12),
                borderRadius: BorderRadius.circular(3.0),
              ),
              child: Container(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                height: deviceInfo.size.height / 1.7,
                width: deviceInfo.size.width / 1.1,
                child: Column(children: [
                  const Padding(
                    padding: EdgeInsets.all(5),
                    child: Center(
                      child: Text(
                        "Faça Login em sua conta",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Form(
                      key: _formKey,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              child: Column(children: [
                                const Padding(
                                  padding: EdgeInsets.only(bottom: 20, top: 20),
                                  child: Align(
                                      alignment: AlignmentDirectional.topStart,
                                      child: Text(
                                        'Email',
                                        style: TextStyle(color: Colors.blueGrey),
                                      )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: Column(
                                    children: [
                                      TextFormField(
                                        controller: emailController,
                                        decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                          labelText: "seu@email.com",

                                        ),
                                        keyboardType: TextInputType.emailAddress,
                                        validator: (value){
                                          if(value == null || value.isEmpty){
                                            return 'Por favor, informe seu email';
                                          }
                                          else if (!value.contains('@')) {
                                            return 'Formato de e-mail inválido.';
                                          }
                                          return null;
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                const Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Align(
                                        alignment: AlignmentDirectional.bottomStart,
                                        child: Text(
                                          'Senha',
                                          style: TextStyle(color: Colors.blueGrey),
                                        )),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: "Sua senha",
                                    ),
                                    obscureText: true,
                                    keyboardType: TextInputType.visiblePassword,
                                    validator: (value){
                                      if(value == null || value.isEmpty){
                                        return 'Por favor, informe sua senha';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: FractionallySizedBox(
                                    widthFactor: 1,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15),
                                      height: 50,
                                      decoration: BoxDecoration(
                                          color: Color.fromARGB(255, 3, 92, 176),
                                          borderRadius: BorderRadius.circular(5)),
                                      child: TextButton(
                                        onPressed: () async {
                                          if (_formKey.currentState!.validate()) {
                                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => principal_screen()));
                                          }
                                        },
                                        child: const Text(
                                          'Login',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ]),
                            )
                          ],
                        )),
                  ),
                ]),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
