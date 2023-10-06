import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/settings_widget_builder.dart';
import '../screens/exports/screens.dart';
import 'package:flutter_settings_screen_ex/flutter_settings_screen_ex.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);
  static const routeName = '/SettingScreen';

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings',
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          },
        ),
      ),
      body: SafeArea(
          child: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          accountSettingsGroup(),
          feedBackGroupMethod(),
        ],
      )),
    );
  }

  SettingsGroup accountSettingsGroup() {
    return SettingsGroup(title: 'Account Settings', children: <Widget>[
      BuilderWidgets(
        title: 'Account',
        icons: Icons.person,
        subtitle: 'Account Security',
        reRoute: '/',
        iconscolor: Colors.green,
        containerNeeded: Container(
            child: SettingsScreen(
          title: 'Account Settings',
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: BuilderWidgets(
                  title: 'Security',
                  icons: Icons.security_outlined,
                  subtitle: '',
                  reRoute: '/',
                  iconscolor: Colors.blue,
                  containerNeeded: Container(
                    child: const PasswordTextFiled(),
                  )),
            ),
          ],
        )),
      )
    ]);
  }

  SettingsGroup feedBackGroupMethod() {
    return SettingsGroup(
      title: 'Feedback',
      children: <Widget>[
        BuilderWidgets(
          title: 'Policy',
          icons: Icons.bug_report,
          iconscolor: Colors.teal,
          subtitle: '',
          reRoute: '/',
          containerNeeded: Container(
            child: const TermsAndPolicy(),
          ),
        ),
        BuilderWidgets(
          title: 'Send Feedback',
          icons: Icons.thumb_up,
          iconscolor: Colors.purple,
          subtitle: '',
          reRoute: '/2',
          containerNeeded: Container(
            child: const SendFeedBackTextFiled(),
          ),
        ),
        const SizedBox(
          height: 23,
        ),
      ],
    );
  }
}

class PasswordTextFiled extends StatefulWidget {
  const PasswordTextFiled({
    Key? key,
  }) : super(key: key);

  @override
  State<PasswordTextFiled> createState() => _PasswordTextFiledState();
}

class _PasswordTextFiledState extends State<PasswordTextFiled> {
  TextEditingController changePasswordController = TextEditingController();
  @override
  @override
  void dispose() {
    changePasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Change Password'),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              child: const Padding(
                padding: EdgeInsets.only(top: 8.0, right: 8.0, left: 8.0),
                child: Text(
                  " it is recommended to use a combination of upper and lower case letters, numbers, and special characters. Avoid using easily guessable information such as your name, birthdate, or common words.\nIt's also recommended to make your password as long as possible, ideally at least 12 characters. Avoid using the same password for multiple accounts.",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            Divider(
              thickness: 1,
              color: Colors.black.withOpacity(0.5),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    controller: changePasswordController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.password_outlined),
                      constraints:
                          const BoxConstraints.tightForFinite(width: 375),
                      border: const UnderlineInputBorder(),
                      labelText: 'Confirm Old Password',
                      hintText: 'Confirm Password',
                      suffixIcon: IconButton(
                        onPressed: () async {
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          prefs.setString(
                              'Old Password', changePasswordController.text);
                          print(changePasswordController.text);
                        },
                        icon: const Icon(Icons.save),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    controller: changePasswordController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.password_outlined),
                      constraints:
                          const BoxConstraints.tightForFinite(width: 375),
                      border: const UnderlineInputBorder(),
                      labelText: 'Change Password',
                      hintText: 'New Password',
                      suffixIcon: IconButton(
                        onPressed: () async {
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          prefs.setString(
                              'New Password', changePasswordController.text);
                          print(changePasswordController.text);
                        },
                        icon: const Icon(Icons.save),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SendFeedBackTextFiled extends StatefulWidget {
  const SendFeedBackTextFiled({
    Key? key,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SendFeedBackTextFiledState createState() => _SendFeedBackTextFiledState();
}

class _SendFeedBackTextFiledState extends State<SendFeedBackTextFiled> {
  TextEditingController sendFeedBackController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    sendFeedBackController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("FeedBack"),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              child: const Padding(
                padding: EdgeInsets.only(
                  top: 8.0,
                  left: 8.0,
                  right: 8.0,
                ),
                child: Text(
                  "Welcome to our feedback section! We value the input of our users and strive to improve our application to better meet your needs. \nPlease share any suggestions or issues you may have encountered while using our app. Your feedback is important to us and will be used to make updates and improvements in future versions. Thank you for taking the time to share your thoughts with us!",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            Divider(
              thickness: 1,
              color: Colors.black.withOpacity(0.5),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                keyboardType: TextInputType.multiline,
                controller: sendFeedBackController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.feedback_outlined),
                  constraints: const BoxConstraints.tightForFinite(width: 375),
                  border: const UnderlineInputBorder(),
                  labelText: "Send us you're thoughts",
                  hintText: 'Say something!',
                  suffixIcon: IconButton(
                    onPressed: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.setString(
                          'Send Feedback', sendFeedBackController.text);
                      print(sendFeedBackController.text);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(sendFeedBackController.text)),
                      );
                    },
                    icon: const Icon(Icons.send),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TermsAndPolicy extends StatelessWidget {
  const TermsAndPolicy({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Terms and ploicy',
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: 400,
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          child: const Text(
            '''Truck Village is licensed to You (End-User) by BTD, located and registered at Amman, Irbid/Amman, Jordan ("Licensor"), for use only under the terms of this License Agreement.\n\n By downloading the Licensed Application from Apples software distribution platform ("App Store") and Googles software distribution platform ("Play Store"), and any update thereto (as permitted by this License Agreement), You indicate that You agree to be bound by all of the terms and conditions of this License Agreement, and that You accept this License Agreement.\n\n App Store and Play Store are referred to in this License Agreement as "Services." The parties of this License Agreement acknowledge that the Services are not a Party to this License Agreement and are not bound by any provisions or obligations with regard to the Licensed Application, such as warranty, liability, maintenance and support thereof.\n\n BTD, not the Services, is solely responsible for the Licensed Application and the content thereof. This License Agreement may not provide for usage rules for the Licensed Application that are in conflict with the latest Apple Media Services Terms and Conditions and Google Play Terms of Service ("Usage Rules"). BTD acknowledges that it had the opportunity to review the Usage Rules and this License Agreement is not conflicting with them. Jadara Academy when purchased or downloaded through the Services, is licensed to You for use only under the terms of this License Agreement. The Licensor reserves all rights not expressly granted to You. Jadara Academy is to be used on devices that operate with Apples operating systems ("iOS" and "Mac OS") or Googles operating system ("Android").''',
            style: TextStyle(color: Colors.grey, fontSize: 15),
          ),
        ),
      ),
    );
  }
}
