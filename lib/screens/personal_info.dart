import 'package:flutter/material.dart';
import 'package:resu_maker/screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:resu_maker/provider/textfield_provider.dart';

class PersonalInfo extends StatelessWidget {
  final type;
  final id;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  TextEditingController nationalityController = TextEditingController();

  const PersonalInfo({super.key, this.type, this.id});

  @override
  Widget build(BuildContext context) {

    if(type == 'edit'){
      String initName = context.read<TextFieldProvider>().name;
      String initEmail = context.read<TextFieldProvider>().email;
      int initMobile = context.read<TextFieldProvider>().mobile;
      String initDob = context.read<TextFieldProvider>().dob;
      String initAddress = context.read<TextFieldProvider>().address;
      String initCity = context.read<TextFieldProvider>().city;
      String initState = context.read<TextFieldProvider>().state;
      String initPincode = context.read<TextFieldProvider>().pincode;
      String initNationality = context.read<TextFieldProvider>().nationality;
    } else {
      String initName = context.read<TextFieldProvider>().name;
      String initEmail = context.read<TextFieldProvider>().email;
      int initMobile = context.read<TextFieldProvider>().mobile;
      String initDob = context.read<TextFieldProvider>().dob;
      String initAddress = context.read<TextFieldProvider>().address;
      String initCity = context.read<TextFieldProvider>().city;
      String initState = context.read<TextFieldProvider>().state;
      String initPincode = context.read<TextFieldProvider>().pincode;
      String initNationality = context.read<TextFieldProvider>().nationality;
    }

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
