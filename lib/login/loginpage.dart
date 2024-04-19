import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fuelfire/Authentication/auth_methods.dart';
import 'package:fuelfire/Homepage/homepage.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool _isloading = false;

  @override
  void dispose() {
    super.dispose();
    _email.dispose();
    _password.dispose();
  }

  void loginuser() async {
    setState(() {
      _isloading = true;
    });
    String res = await Authmethods()
        .loginUser(email: _email.text, password: _password.text);
    if (res == 'Success') {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const Homescreen()));
      print("Success");
    } else {
      print("Failed $res");
    }
    setState(() {
      _isloading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(children: [
          Center(
            child: Container(
              height: 350,
              width: 420,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 33, 32, 32),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                      left: 30,
                    ),
                    alignment: Alignment.bottomLeft,
                    child: const Text(
                      'Log In',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 40,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 50,
                    width: 400,
                    child: TextField(
                      controller: _email,
                      keyboardType: TextInputType.emailAddress,
                      autocorrect: false,
                      enableSuggestions: false,
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                      decoration: const InputDecoration(
                        hintText: "Enter the email address",
                        filled: true,
                        fillColor: Color.fromRGBO(18, 14, 14, 0.69),
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 50,
                    width: 400,
                    child: TextField(
                      controller: _password,
                      obscureText: true,
                      autocorrect: false,
                      enableSuggestions: false,
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                      decoration: const InputDecoration(
                        hintText: "Enter you Password",
                        filled: true,
                        fillColor: Color.fromRGBO(18, 14, 14, 0.69),
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 50,
                    width: 400,
                    child: TextButton(
                      onPressed: loginuser,
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 33, 40, 243)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                        ),
                      ),
                      child: _isloading
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: Color.fromRGBO(255, 255, 255, 1),
                              ),
                            )
                          : const Text('Log In'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
