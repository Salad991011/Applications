import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app/screens/login/signup_screen.dart';
import '../../config/theme.dart';
import '../../widgets/auth_helper.dart';
import '../home/home_screen.dart';

class LogIn extends StatefulWidget {
  static const String routeName = '/logIn';

  const LogIn({super.key});
  static Route route() {
    return MaterialPageRoute(
        builder: (_) => const LogIn(),
        settings: const RouteSettings(name: routeName));
  }

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  late TextEditingController emailcontroller = TextEditingController();
  late TextEditingController passwordcontroller = TextEditingController();
  late TextEditingController phonenumcontroller = TextEditingController();
  @override
  void initState() {
    super.initState();
    emailcontroller = TextEditingController(text: "");
    passwordcontroller = TextEditingController(text: "");
  }

  bool emailMatch = false;
  bool passinMatch = false;
  Color? emailValidationColor;
  Color? passwordValidationColor;
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    return null;
  }

  Color? getValidationColor(String? errorText) {
    return errorText != null
        ? const Color.fromARGB(213, 253, 116, 85)
        : Colors.green;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  'assets/logos/akel.jpg',
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                padding: const EdgeInsets.all(5),
                margin: const EdgeInsets.symmetric(
                  vertical: 80,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    colors: [
                      Theme.of(context).primaryColorLight.withOpacity(0.9),
                      Colors.orangeAccent,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  border: Border.all(
                    width: 2,
                    style: BorderStyle.none,
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      alignment: Alignment.topCenter,
                      child: Text(
                        'Wlecome To',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .copyWith()
                            .displayLarge!
                            .apply(color: Colors.black),
                      ),
                    ),
                    const SizedBox(
                      height: 150,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                            right: 4,
                            top: 14,
                          ),
                          margin: const EdgeInsets.only(
                            bottom: 15,
                          ),
                          alignment: Alignment.bottomCenter,
                          child: const Text(
                            'Truck Village',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color.fromARGB(
                                213,
                                253,
                                116,
                                85,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                            bottom: 4,
                          ),
                          child: SvgPicture.asset(
                            'assets/logos/foodtruck.svg',
                            height: 50,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 300,
                      child: TextFormField(
                        controller: emailcontroller,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: 'Enter your Email',
                          labelText: 'Email',
                          border: const OutlineInputBorder(),
                          prefixIcon: const Icon(
                            Icons.email_outlined,
                            size: 30,
                          ),
                          prefixIconColor: getValidationColor(
                            validateEmail(
                              emailcontroller.text,
                            ),
                          ),
                          fillColor: emailValidationColor,
                        ),
                        validator: validateEmail,
                        onChanged: (value) {
                          setState(() {
                            emailValidationColor = value.isEmpty
                                ? const Color.fromARGB(213, 253, 116, 85)
                                : null;
                            emailMatch = emailcontroller.text != null;
                          });
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 300,
                      child: TextFormField(
                        controller: passwordcontroller,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'password',
                          labelText: 'Enter your password',
                          border: const OutlineInputBorder(),
                          prefixIcon: const Icon(
                            Icons.key_outlined,
                            size: 30,
                          ),
                          prefixIconColor: getValidationColor(
                            validatePassword(
                              passwordcontroller.text,
                            ),
                          ),
                          fillColor: passwordValidationColor,
                        ),
                        validator: validatePassword,
                        onChanged: (value) {
                          setState(() {
                            passwordValidationColor = value.isEmpty
                                ? const Color.fromARGB(213, 253, 116, 85)
                                : null;
                            passinMatch = passwordcontroller.text != null;
                          });
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: theme().primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () async {
                        if (emailcontroller.text.isEmpty ||
                            passwordcontroller.text.isEmpty) {
                          print("Email and password cannot be empty");
                          return;
                        }
                        try {
                          final user = await AuthHelper.signInWithEmail(
                              email: emailcontroller.text,
                              password: passwordcontroller.text);
                          if (user != null) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomeScreen()),
                            );
                          }
                        } catch (e) {
                          print(e);
                        }
                      },
                      child: Text(
                        'Login',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith()
                            .apply(
                              color: Theme.of(context).canvasColor,
                            ),
                      ),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't Have an account?",
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          TextButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: theme().primaryColor,
                              fixedSize: const Size(10, 10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const SignUp()),
                                );
                              });
                            },
                            child: Text(
                              "Signup",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith()
                                  .apply(
                                    color: Theme.of(context).canvasColor,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
