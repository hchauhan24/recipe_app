import 'package:flutter/material.dart';

class FetchRecipeToWidgets<T> extends StatelessWidget {
  final Future<T> future;
  final Widget Function(BuildContext, T) builder;

  const FetchRecipeToWidgets({super.key, required this.future, required this.builder});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else if (!snapshot.hasData) {
          return const Center(
            child: Text('N O  D A T A'),
          );
        } else {
          return builder(context, snapshot.data as T);
        }
      },
    );
  }
}
