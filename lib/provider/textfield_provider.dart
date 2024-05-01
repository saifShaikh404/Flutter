import 'package:flutter/material.dart';

class TextFieldProvider extends ChangeNotifier {

  // phase 1 - Personal info
  String name = '';
  String email = '';
  int? mobile;
  String dob = '';
  String address = '';
  String city = '';
  String state = '';
  String pincode = '';
  String nationality = '';

  // phase 2 - Summary
  String heading = '';
  String summary = '';

  // phase 3 - Career
  String? careerObjective = '';

  // phase 4 - Eductaion background
  List<Map<String, dynamic>> education = [];
  
  // phase 5 - Work Experience
  List<Map<String, dynamic>> workExperience = [];

  // phase 6 -Projects
  List<Map<String, dynamic>> projects = [];

  void clearFields() {
    name = '';
    email = '';
    mobile = null;
    dob = '';
    address = '';
    city = '';
    state = '';
    pincode = '';
    nationality = '';
    heading = '';
    summary = '';
    careerObjective = '';
    education = [];
    workExperience = [];
    projects = [];
  }

}
