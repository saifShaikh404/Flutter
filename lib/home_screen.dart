import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({ super.key });

  @override
  State<HomeScreen> createState () => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {

  double initVal = 0;

  @override
  Widget build(BuildContext context) {

    TextEditingController textController = TextEditingController();

    final textFieldBorder = OutlineInputBorder(
      borderSide: const BorderSide(
        width: 2.0,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.circular(15),
    );

    return Scaffold(
      backgroundColor: Colors.indigoAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              child: Text(
                'INR ${(initVal != 0) ? initVal.toStringAsFixed(2) : initVal.toStringAsFixed(0)}',
                style: const TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: textController,
                style: const TextStyle(
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.monetization_on),
                  prefixIconColor: Colors.black,
                  hintText: 'Please Enter a Value',
                  hintStyle: const TextStyle(
                    color: Colors.black,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: textFieldBorder,
                  enabledBorder: textFieldBorder,
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: () {
                    if (kDebugMode) {
                      // run when app is in debug mode
                      print('Button Clicked');
                      setState(() {
                        initVal = double.parse(textController.text) * 80;
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                  ),
                  child: const Text(
                    'Click',
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
