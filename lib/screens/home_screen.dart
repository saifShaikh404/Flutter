import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:resu_maker/provider/resume_provider.dart';
import 'package:resu_maker/screens/personal_info.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FocusNode _focusNode = FocusNode();

  Future<void> goToFormPage(BuildContext context) {
    List myDB = Provider.of<ResumeProvider>(context, listen: false).resumes;

    // Controller
    TextEditingController profileController = TextEditingController();

    // Screen Sizes
    Size screenSize = MediaQuery.of(context).size;
    double maxHeight = screenSize.height;
    double maxWidth = screenSize.width;

    // Conditional Stuff
    bool emptyErrMsg = false;
    bool dupErrorMessage = false;

    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(2),
            ),
            side: BorderSide.none,
          ),
          title: Text(
            'Create New Profile',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          titlePadding: EdgeInsets.symmetric(
              vertical: maxHeight * 0.0175, horizontal: maxWidth * 0.04),
          content: TextField(
            focusNode: _focusNode,
            controller: profileController,
            style: Theme.of(context).textTheme.bodySmall,
            decoration: InputDecoration(
              labelText: 'Profile Name',
              labelStyle: Theme.of(context).textTheme.bodySmall,
              errorText: emptyErrMsg
                  ? 'Please enter something'
                  : (dupErrorMessage ? 'Profile Name Already Exist' : null),
            ),
          ),
          contentPadding:
              EdgeInsets.symmetric(vertical: 0, horizontal: maxWidth * 0.04),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (profileController.text == "" && !_focusNode.hasFocus) {
                  _handleFocus();
                  setState(() {
                    emptyErrMsg = true;
                  });
                } else if (profileController.text == "") {
                  setState(() {
                    emptyErrMsg = true;
                    SystemChannels.textInput.invokeMethod('TextInput.hide');
                  });
                } else {
                  if (myDB.isNotEmpty) {
                    bool checkDups = myDB.any(
                        (element) => element['name'] == profileController.text);

                    if (checkDups) {
                      SystemChannels.textInput.invokeMethod('TextInput.hide');
                      setState(() {
                        emptyErrMsg = false;
                        dupErrorMessage = true;
                      });
                    } else {

                      int id = myDB.last['id'] + 1;
                      Map<String, dynamic> newData = {
                        'id': id,
                        'name': profileController.text.toString(),
                      };

                      Provider.of<ResumeProvider>(context, listen: false)
                          .addResume(newData);
                      profileController.clear();
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return PersonalInfo(type: 'add', id: id);
                          },
                        ),
                      );
                    }
                  } else {
                    Map<String, dynamic> firstData = {
                      'id': 1,
                      'name': profileController.text.toString(),
                    };

                    Provider.of<ResumeProvider>(context, listen: false)
                        .addResume(firstData);
                    profileController.clear();
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const PersonalInfo(type: 'add', id: 1);
                        },
                      ),
                    );
                  }
                }
              },
              child: const Text('OK'),
            ),
          ],
          actionsPadding: EdgeInsets.symmetric(
              vertical: maxHeight * 0.01, horizontal: maxWidth * 0.04),
        );
      },
    );
  }

  @override
  void dispose() {
    _focusNode.dispose(); // Don't forget to dispose the FocusNode!
    super.dispose();
  }

  void _handleFocus() {
    if (!_focusNode.hasFocus) {
      _focusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ResuMaker',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        elevation: 1,
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      // body: const NoDataWidget(),
      body: Text(jsonEncode(Provider.of<ResumeProvider>(context).resumes)),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.primary,
        onPressed: () => goToFormPage(context),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
