import 'package:book_store_ui/common/color_extention.dart';
import 'package:book_store_ui/common_widgets/round_button.dart';
import 'package:book_store_ui/common_widgets/round_textfield.dart';
import 'package:book_store_ui/view/login/forgot_password_view.dart';
import 'package:flutter/material.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  TextEditingController txtCode = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  bool isStay = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: TColor.primary,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Text(
                "Sign In",
                style: TextStyle(
                  color: TColor.text,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 15),
              RoundTextField(
                controller: txtEmail,
                hintText: "Email",
              ),
              const SizedBox(height: 15),
              RoundTextField(
                controller: txtPassword,
                hintText: "Pasword",
                obscureText: true,
              ),
              const SizedBox(height: 15),
              RoundTextField(
                controller: txtCode,
                hintText: "Coupon Code (Optional)",
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isStay = !isStay;
                      });
                    },
                    icon: Icon(
                      isStay ? Icons.check_box : Icons.check_box_outline_blank,
                      color: isStay
                          ? TColor.primary
                          : TColor.subTitle.withOpacity(0.3),
                    ),
                  ),
                  Text(
                    "Stay Logged In",
                    style: TextStyle(
                      color: TColor.subTitle.withOpacity(0.3),
                      fontSize: 15,
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ForgotPasswordView(),
                        ),
                      );
                    },
                    child: Text(
                      "Forgot Password !",
                      style: TextStyle(
                        color: TColor.subTitle.withOpacity(0.3),
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              RoundLineButton(
                title: "Sign In",
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
