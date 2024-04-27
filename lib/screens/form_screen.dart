import 'package:flutter/material.dart';
import 'package:resu_maker/screens/home_screen.dart';

class FormScreen extends StatelessWidget {
  final type;
  final id;

  const FormScreen({super.key, this.type, this.id});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double maxHeight = screenSize.height;
    double maxWidth = screenSize.width;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white, // Set your desired color here
        ),
        title: const Text(
          'Add Profile',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        elevation: 1,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: maxHeight * 0.03, horizontal: maxWidth * 0.05),
        child: ListView(
          children: [
            TextField(
              style: Theme.of(context).textTheme.bodySmall,
              decoration: InputDecoration(
                labelText: 'Profile Name',
                labelStyle: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
