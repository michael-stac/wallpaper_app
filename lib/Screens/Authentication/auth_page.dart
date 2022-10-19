import 'package:flutter/material.dart';
import 'package:flutter_text_form_field/flutter_text_form_field.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Provider/auth_provider.dart';
import '../../Styles/appcolors.dart';
import '../../Utilis/routers.dart';
import '../../Widgets/custom_button.dart';
import '../BottomNavPages/WallpaperPage/add_wallpaper_page.dart';
import '../BottomNavPages/WallpaperPage/all_wallpaper_page.dart';
import '../main_activity.dart';
import 'login.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final TextEditingController name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool isLoading = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xff016CBA),
      ),
      backgroundColor: const Color(0xff016CBA),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              color: const Color(0xff016CBA),
              height: 130,
              width: MediaQuery.of(context).size.width,
              child: Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {},
                              child: const Padding(
                                padding: EdgeInsets.only(left: 30),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 0),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text("Create Account",
                                  style: GoogleFonts.nunito(
                                    textStyle: const TextStyle(
                                        fontSize: 30,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700),
                                  )),
                            ),
                          ),
                          Expanded(child: Container())
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
                child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(
                              20.0) //                 <--- border radius here
                          ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 32),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.only(bottom: 10),
                              child: const Text(
                                "Sign Up",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 26),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            margin: const EdgeInsets.only(bottom: 10),
                            child: const Text(
                              "Full Name",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ),
                          CustomTextField(
                            name,
                            hint: "Your fullname",
                            password: false,
                            backgroundColor: Colors.transparent,
                            border: Border.all(color: AppColor.gray),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            margin: const EdgeInsets.only(bottom: 10),
                            child: const Text(
                              " Email Address",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ),
                          CustomTextField(
                            _email,
                            hint: "Your email address",
                            password: false,
                            backgroundColor: Colors.transparent,
                            border: Border.all(color: AppColor.gray),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            margin: const EdgeInsets.only(bottom: 10),
                            child: const Text(
                              " Password ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ),
                          CustomTextField(
                            _password,
                            hint: "**********",
                            password: true,
                            backgroundColor: Colors.transparent,
                            border: Border.all(color: AppColor.gray),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: const [
                              Text("Dont have an account?"),
                              Text("Sign In")
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          customButton(
                            textStyle: const TextStyle(fontSize: 18),
                            onTap: () {
                              nextPage(context: context, page: const  MainActivityPage());

                              // setState(() {
                              //   isLoading = true;
                              // });
                              // AuthClass()
                              //     .signIN(
                              //     email: _email.text.trim(),
                              //     password: _password.text.trim())
                              //     .then((value) {
                              //   if (value == "welcome") {
                              //     setState(() {
                              //       isLoading = false;
                              //     });
                              //     nextPage(
                              //         context: context,
                              //         page: const WallPaperHomePage());
                              //   } else {
                              //     setState(() {
                              //       isLoading = false;
                              //     });
                              //
                              //   }
                              // });
                            },
                            text: 'Proceed',
                            bgColor: AppColor.primaryColor,
                            textColor: AppColor.white,
                          ),

                        ],
                      ),
                    ),
                  ),
                )
              ],
            ))
          ],
        ),
      ),
    );
    ;
  }
}
