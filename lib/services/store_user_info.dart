import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:projects_app/MainScreens/homepage.dart';
import 'package:projects_app/constants.dart';
import 'package:projects_app/services/authentication_helper.dart';
import 'package:projects_app/services/get_user_data.dart';

class StoreUserdata extends StatefulWidget {
  const StoreUserdata(
      {Key? key,
      this.name = "Buddy",
      this.username = "",
      required this.password})
      : super(key: key);

  final String name, username, password;

  @override
  State<StoreUserdata> createState() => _StoreUserdataState();
}

class _StoreUserdataState extends State<StoreUserdata> {
  bool showSpinner = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: blackbg,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Container(
          height: size.height,
          width: size.width,
          child: Center(
            child: Stack(
              children: [
                Positioned(
                  bottom: 30,
                  right: 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () async {
                          setState(() {
                            showSpinner = true;
                          });
                          await AuthenticationHelper().storeUserDetails(
                              widget.password, widget.name, widget.username);
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => GetUserData(),
                            ),
                          );
                          setState(() {
                            showSpinner = false;
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 16),
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.green),
                          child: Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: size.height * .1),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Hi, ',
                            style: TextStyle(fontSize: 55, color: Colors.green),
                          ),
                          Text(
                            widget.name,
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          ),
                        ],
                      ),
                      SizedBox(height: size.height * .15),
                      Center(
                        child: Text(
                          'Welcome to Movies Lot',
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        ),
                      ),
                      Lottie.asset('assets/lottie/l3.json'),
                      SizedBox(height: 15),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
