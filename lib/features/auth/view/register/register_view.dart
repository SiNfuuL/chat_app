import 'package:chat_app/features/auth/view/widgets/custom_auth_button.dart';
import 'package:chat_app/features/auth/view/widgets/custom_text_field.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterView extends StatefulWidget {
  static String routeName = "register-view";
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _formKey = GlobalKey<FormState>();
  bool isValidFirstName = false;
  bool isValidLastName = false;
  bool isValidUserName = false;
  bool isEmailAddressValid = false;
  bool isPasswordValid = false;
  bool isConfirmPasswordValid = false;
  bool isRegistering = false;

  var firstName = "";
  var lastName = "";
  var userName = "";
  var email = "";
  var password = "";
  var confirmPassword = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          // fit: StackFit.passthrough,
          alignment: Alignment.center,
          children: [
            Image.asset(
              "assets/images/background@3x.png",
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 1.25,
              fit: BoxFit.fill,
            ),
            Positioned(
              right: MediaQuery.of(context).size.width * 0.05,
              left: MediaQuery.of(context).size.width * 0.05,
              top: MediaQuery.of(context).size.width * 0.15,
              child: Padding(
                padding: EdgeInsets.only(top: 10.h),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        size: 32.sp,
                        color: Colors.white,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      "Create account",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Align(
                alignment: Alignment.center,
                child: Form(
                  autovalidateMode: AutovalidateMode.always,
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 250.h,
                      ),
                      CustomTextField(
                        onChangedFunction: (value) {
                          firstName = value;
                          if (value.length < 6) {
                            isValidFirstName = false;
                          } else {
                            isValidFirstName = true;
                          }
                          setState(() {});
                        },
                        isValid: isValidFirstName,
                        labelText: "First name",
                        validatorFunction: (value) {
                          if (value == null && value!.isEmpty) {
                            return "Name should not be empty";
                          }
                          if (value.length < 6) {
                            return "Name should be at least 6 characters";
                          }
                          return null;
                        },
                        textInputType: TextInputType.name,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      CustomTextField(
                        onChangedFunction: (value) {
                          lastName = value;
                          if (value.length < 6) {
                            isValidLastName = false;
                          } else {
                            isValidLastName = true;
                          }
                          setState(() {});
                        },
                        isValid: isValidLastName,
                        labelText: "Last name",
                        validatorFunction: (value) {
                          if (value == null && value!.isEmpty) {
                            return "Name should not be empty";
                          }
                          if (value.length < 6) {
                            return "Name should be at least 6 characters";
                          }
                          return null;
                        },
                        textInputType: TextInputType.name,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      CustomTextField(
                        onChangedFunction: (value) {
                          userName = value;
                          if (value.length < 6) {
                            isValidUserName = false;
                          } else {
                            isValidUserName = true;
                          }
                          setState(() {});
                        },
                        isValid: isValidUserName,
                        labelText: "Username",
                        validatorFunction: (value) {
                          if (value == null && value!.isEmpty) {
                            return "Name should not be empty";
                          }
                          if (value.length < 6) {
                            return "Name should be at least 6 characters";
                          }
                          return null;
                        },
                        textInputType: TextInputType.name,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      CustomTextField(
                        onChangedFunction: (value) {
                          email = value;
                          if (!EmailValidator.validate(value)) {
                            isEmailAddressValid = false;
                          } else {
                            isEmailAddressValid = true;
                          }
                          setState(() {});
                        },
                        isValid: isEmailAddressValid,
                        labelText: "Email",
                        validatorFunction: (value) {
                          if (value == null && value!.isEmpty) {
                            return "Email should not be empty";
                          }
                          if (!EmailValidator.validate(value)) {
                            return "Please enter a valid email";
                          }
                          return null;
                        },
                        textInputType: TextInputType.emailAddress,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      CustomTextField(
                        obscureText: true,
                        onChangedFunction: (value) {
                          password = value;
                          if (value.length < 6) {
                            isPasswordValid = false;
                          } else {
                            isPasswordValid = true;
                          }
                          if (confirmPassword == password &&
                              (confirmPassword.isNotEmpty ||
                                  password.isNotEmpty)) {
                            isConfirmPasswordValid = true;
                          }
                          setState(() {});
                        },
                        isValid: isPasswordValid,
                        labelText: "Password",
                        validatorFunction: (value) {
                          if (value == null && value!.isEmpty) {
                            return "Password should not be empty";
                          }
                          if (value.length < 6) {
                            return "Password should be at least 6 characters";
                          }
                          return null;
                        },
                        textInputType: TextInputType.visiblePassword,
                      ),
                      CustomTextField(
                        obscureText: true,
                        onChangedFunction: (value) {
                          confirmPassword = value;
                        },
                        isValid: isConfirmPasswordValid,
                        labelText: "Confirm password",
                        validatorFunction: (value) {
                          if (confirmPassword != password) {
                            return "Passwords don't match";
                          }
                          return null;
                        },
                        textInputType: TextInputType.visiblePassword,
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      CustomAuthButton(
                        buttonText: "Register",
                        onTapFunction: () {},
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Text(
                              "Already have an account? Login",
                              style: TextStyle(
                                  color: Color(0xff3598DB),
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                    ],
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
