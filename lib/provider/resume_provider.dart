import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ResumeProvider extends ChangeNotifier {
  var box = Hive.box('myBox');
  List resumes = [];

  ResumeProvider() {
    initValue();
  }
  // var resumes = (box.get('data') != null) ? box.get('data') != null : [];

  void initValue() {
    if(box.get('resume') != null){
      resumes = box.get('resume');
    } else {
      resumes = [];
      box.put('resume', resumes);
    }
  }

  void addResume(resume) {
    resumes.add(resume);
    box.put('resume', resumes);
    notifyListeners();
  }

}