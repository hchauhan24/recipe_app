import 'package:flutter/material.dart';

class FormButon extends StatelessWidget {
  final Function onPressed;
  final String text;

  const FormButon({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return SizedBox(
      width: w,
      child: ElevatedButton(
        onPressed: () => onPressed(),
        style: ElevatedButton.styleFrom(
            shadowColor: Colors.grey.shade100,
            backgroundColor: Theme.of(context).colorScheme.primary,
            elevation: 0,
            shape:
                RoundedRectangleBorder(
                  side:BorderSide(color: Theme.of(context).colorScheme.inversePrimary),
                  borderRadius: BorderRadius.circular(5))),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Text(
            text,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
      ),
    );
  }
}
