import 'package:flutter/material.dart';
// import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

class CircleButton extends StatelessWidget {
  final IconData icon;

  final Function onPress;
  const CircleButton(
      {super.key, required this.icon,  required this.onPress});

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              onPress();
            },
            child: CircleAvatar(
              radius: w * .06,
              backgroundColor: Theme.of(context).colorScheme.primary,
              child: Center(
                  child: Icon(
                icon,
                color: Theme.of(context).colorScheme.inversePrimary,
              )),
            ),
          ),
           
        ],
      ),
    );
  }
}
