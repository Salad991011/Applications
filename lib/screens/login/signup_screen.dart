// ignore_for_file: use_build_context_synchronously

import 'package:food_app/screens/exports/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../widgets/auth_helper.dart';
import '../../config/theme.dart';

class SignUp extends StatefulWidget {
  static const String routeName = '/signUp';

  const SignUp({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const SignUp(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  // ignore: library_private_types_in_public_api
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool nameMatch = false;
  bool phoneMatch = false;
  bool emailMatch = false;
  bool passinMatch = false;
  bool passMatch = false;

  late TextEditingController emailController = TextEditingController();
  late TextEditingController fullNameController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();
  late TextEditingController authPasswordController = TextEditingController();
  late TextEditingController phoneNumController = TextEditingController();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController(text: "");
    passwordController = TextEditingController(text: "");
    authPasswordController = TextEditingController(text: "");
    phoneNumController = TextEditingController(text: "");
    fullNameController = TextEditingController(text: "");
  }

  Color? fullNameValidationColor;
  Color? phoneNumValidationColor;
  Color? emailValidationColor;
  Color? passwordValidationColor;
  Color? authPasswordValidationColor;
  String? validateFullName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Full Name is required';
    }
    return null;
  }

  String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone Number is required';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if ((value == null || value.isEmpty)) {
      return 'Password is required';
    }
    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Confirm Password is required';
    }
    if (value != passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  Color? getValidationColor(String? errorText) {
    return errorText != null
        ? const Color.fromARGB(213, 253, 116, 85)
        : Colors.green;
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    authPasswordController.dispose();
    phoneNumController.dispose();
    fullNameController.dispose();
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
                margin: const EdgeInsets.only(
                  top: 125,
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
                      height: 10,
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
                        controller: fullNameController,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          hintText: 'Enter Full Name',
                          labelText: 'Full Name',
                          border: const OutlineInputBorder(),
                          prefixIcon: const Icon(
                            Icons.person_outlined,
                            size: 30,
                          ),
                          prefixIconColor: getValidationColor(
                            validateFullName(
                              fullNameController.text,
                            ),
                          ),
                          fillColor: fullNameValidationColor,
                        ),
                        validator: validateFullName,
                        onChanged: (value) {
                          setState(() {
                            fullNameValidationColor = value.isEmpty
                                ? const Color.fromARGB(213, 253, 116, 85)
                                : null;
                            nameMatch = fullNameController.text != null;
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
                        controller: phoneNumController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          hintText: 'Phone Number',
                          labelText: 'Enter your Phone Number',
                          border: const OutlineInputBorder(),
                          prefixIcon: const Icon(
                            Icons.phone_outlined,
                            size: 30,
                          ),
                          prefixIconColor: getValidationColor(
                            validatePhoneNumber(
                              phoneNumController.text,
                            ),
                          ),
                          fillColor: phoneNumValidationColor,
                        ),
                        validator: validatePhoneNumber,
                        onChanged: (value) {
                          setState(() {
                            phoneNumValidationColor = value.isEmpty
                                ? const Color.fromARGB(213, 253, 116, 85)
                                : null;
                            phoneMatch = phoneNumController.text != null;
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
                        controller: emailController,
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
                              emailController.text,
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
                            emailMatch = emailController.text != null;
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
                        controller: passwordController,
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
                              passwordController.text,
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
                            passinMatch = passwordController.text != null;
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
                        controller: authPasswordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Confirm password',
                          labelText: 'Enter your password again',
                          border: const OutlineInputBorder(),
                          prefixIcon: const Icon(
                            Icons.done_all_outlined,
                            size: 30,
                          ),
                          prefixIconColor: getValidationColor(
                            validateConfirmPassword(
                              authPasswordController.text,
                            ),
                          ),
                          fillColor: authPasswordValidationColor,
                        ),
                        validator: validateConfirmPassword,
                        onChanged: (value) {
                          setState(() {
                            authPasswordValidationColor = value.isEmpty
                                ? const Color.fromARGB(213, 253, 116, 85)
                                : null;
                            passMatch = passwordController.text ==
                                authPasswordController.text;
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
                        // Perform signup logic only if all fields are valid
                        if (validateFullName(fullNameController.text) == null &&
                            validatePhoneNumber(phoneNumController.text) ==
                                null &&
                            validateEmail(emailController.text) == null &&
                            validatePassword(passwordController.text) == null &&
                            validateConfirmPassword(
                                  authPasswordController.text,
                                ) ==
                                null) {
                          final user = await AuthHelper.signupWithEmail(
                              email: emailController.text,
                              password: passwordController.text);
                          await UserHelper.saveUser(user);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeScreen()),
                          );

                          // Perform signup logic here
                          print('Perform signup');
                        } else {
                          print('Please fill in all required fields');
                        }

                        // SignUp;
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => HomeScreen()),
                        // );
                      },
                      child: Text(
                        'Sign Up',
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
                      height: 30,
                    ),
                    SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "Already Have an account?",
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
                                Navigator.pushReplacementNamed(
                                  context,
                                  '/logIn',
                                );
                              });
                            },
                            child: Text(
                              "Login",
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
