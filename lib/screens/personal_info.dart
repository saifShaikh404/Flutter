import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resu_maker/provider/textfield_provider.dart';
import 'package:resu_maker/widgets/textfield_widget.dart';

class PersonalInfo extends StatefulWidget {
  final String type;
  final int id;
  const PersonalInfo({super.key, required this.type, required this.id});

  @override
  State<PersonalInfo> createState() => _PersonalInfo();
}

class _PersonalInfo extends State<PersonalInfo> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController mobileController;
  late TextEditingController dobController;
  late TextEditingController addressController;
  late TextEditingController cityController;
  late TextEditingController stateController;
  late TextEditingController pincodeController;
  late TextEditingController nationalityController;

  String? _selectedGender = 'Male';

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    nameController = TextEditingController(
        text: Provider.of<TextFieldProvider>(context).name);
    emailController = TextEditingController(
        text: Provider.of<TextFieldProvider>(context).email);
    mobileController = TextEditingController(
        text: Provider.of<TextFieldProvider>(context).mobile != null ? (Provider.of<TextFieldProvider>(context).mobile).toString() : "0");
    dobController = TextEditingController(
        text: Provider.of<TextFieldProvider>(context).dob);
    addressController = TextEditingController(
        text: Provider.of<TextFieldProvider>(context).address);
    cityController = TextEditingController(
        text: Provider.of<TextFieldProvider>(context).city);
    stateController = TextEditingController(
        text: Provider.of<TextFieldProvider>(context).state);
    pincodeController = TextEditingController(
        text: Provider.of<TextFieldProvider>(context).pincode);
    nationalityController = TextEditingController(
        text: Provider.of<TextFieldProvider>(context).nationality);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    mobileController.dispose();
    dobController.dispose();
    addressController.dispose();
    cityController.dispose();
    stateController.dispose();
    pincodeController.dispose();
    nationalityController.dispose();
    super.dispose();
  }

  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1900),
        lastDate: DateTime.now());

    if (picked != null && picked != selectedDate){
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    
    const List<String> gender = ['Male', 'Female', 'Other'];

    Size screenSize = MediaQuery.of(context).size;
    double maxHeight = screenSize.height;
    double maxWidth = screenSize.width;

    return Scaffold(
      // resizeToAvoidBottomInset: true,
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
          'Personal Info',
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
            TextFieldWidget(label: 'Name', controller: nameController),
            TextFieldWidget(label: 'Email', controller: emailController),
            TextFieldWidget(label: 'Mobile', controller: mobileController),
            TextFieldWidget(label: 'Address', controller: addressController),
            TextFieldWidget(label: 'City', controller: cityController),
            TextFieldWidget(label: 'State', controller: stateController),

            Container(
              decoration: const BoxDecoration(
                border: BorderDirectional(
                  bottom: BorderSide(width: 1),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${selectedDate.toLocal()}".split(' ')[0]),
                  IconButton(
                    onPressed: () {
                      _selectDate(context);
                    },
                    icon: const Icon(Icons.date_range),
                  )
                ],
              ),
            ),

            DropdownButton<String>(
              value: _selectedGender,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedGender = newValue;
                });
              },
              items: gender.map((String item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList(),
            ),
            
            TextFieldWidget(label: 'Pincode', controller: pincodeController),
            TextFieldWidget(label: 'Country', controller: nationalityController),
          ],
        ),
      ),
    );
  }
}
