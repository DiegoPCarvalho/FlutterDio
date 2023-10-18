import 'package:flutter/material.dart';
import 'package:trilhapp/pages/main_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var emailController = TextEditingController(text: "");
  var senhaController = TextEditingController(text: "");

  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 27, 27, 27),
          body: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      Expanded(child: Container()),
                      Expanded(
                        flex: 8,
                        child: Image.asset(
                          "imagens/logo.jpg",
                        ),
                      ),
                      Expanded(child: Container())
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Ja tem Cadastro?",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text("Faça seu Login e make the change_",
                      style: TextStyle(color: Colors.white, fontSize: 12)),
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 30),
                      height: 50,
                      alignment: Alignment.center,
                      child: TextField(
                        controller: emailController,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(250, 135, 102, 187))),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(250, 135, 102, 187))),
                            hintText: "Email",
                            hintStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            prefixIcon: Icon(Icons.person,
                                color: Color.fromARGB(250, 135, 102, 187))),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 30),
                      height: 50,
                      alignment: Alignment.center,
                      child: TextField(
                        obscureText: isObscureText,
                        controller: senhaController,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(250, 135, 102, 187))),
                            focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(250, 135, 102, 187))),
                            hintText: "Senha",
                            hintStyle: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            prefixIcon: const Icon(Icons.lock,
                                color: Color.fromARGB(250, 135, 102, 187)),
                            suffixIcon: InkWell(
                              onTap: () {
                                setState(() {
                                  isObscureText = !isObscureText;
                                });
                              },
                              child: Icon(
                                  isObscureText
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color:
                                      const Color.fromARGB(250, 135, 102, 187)),
                            )),
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: double.infinity,
                      child: TextButton(
                          onPressed: () {
                            if (emailController.text.trim() ==
                                    "email@email.com" &&
                                senhaController.text.trim() == "123") {
                              // debugPrint(emailController.text);
                              // debugPrint(senhaController.text);
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const MainPage()));
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                          Text("Login ou senha Invalida")));
                            }
                          },
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              backgroundColor: MaterialStateProperty.all(
                                  const Color.fromARGB(250, 135, 102, 187))),
                          child: const Text("Entrar",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16))),
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  Container(
                      margin: const EdgeInsets.symmetric(horizontal: 30),
                      height: 50,
                      alignment: Alignment.center,
                      child: const Text("Esqueci minha Senha",
                          style: TextStyle(
                              color: Color.fromARGB(255, 230, 209, 24),
                              fontWeight: FontWeight.w500))),
                  Container(
                      margin: const EdgeInsets.symmetric(horizontal: 30),
                      height: 50,
                      alignment: Alignment.center,
                      child: const Text("Cadastro",
                          style: TextStyle(
                              color: Color.fromARGB(255, 19, 187, 47),
                              fontWeight: FontWeight.w500))),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
