import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:recipe/src/widgets/button/form_button.dart';
import 'package:recipe/src/widgets/textfield/text_field.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    // var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 27.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: SvgPicture.asset(
                'assets/svg/taco.svg',
                height: h * .2,
                width: w * .2,
              ),
            ),
            Text(
              textAlign: TextAlign.center,
              'Sign up',
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: 'Existing user ?',
                  style: Theme.of(context).textTheme.labelSmall,
                  children: [
                    TextSpan(
                        text: ' Login',
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            color: Theme.of(context).colorScheme.tertiary))
                  ]),
            ),
            SizedBox(
              height: h * .04,
            ),
            MyTextField(
                hintText: 'Name',
                obscureText: false,
                controller: nameController),
            SizedBox(
              height: h * .025,
            ),
            MyTextField(
                hintText: 'Email',
                obscureText: false,
                controller: emailController),
            SizedBox(
              height: h * .025,
            ),
            MyTextField(
                hintText: 'Password',
                obscureText: true,
                controller: passwordController),
            SizedBox(
              height: h * .05,
            ),
            FormButon(onPressed: () {}, text: "Sign Up"),
            Align(
              alignment: Alignment.bottomLeft,
              child: SvgPicture.asset(
                'assets/svg/Burger.svg',
                height: h * .2,
                width: w * .2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
