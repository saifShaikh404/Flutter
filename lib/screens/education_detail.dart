import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resu_maker/provider/textfield_provider.dart';
import 'package:resu_maker/widgets/textfield_widget.dart';
import 'package:resu_maker/widgets/no_resume_widget.dart';

class EducationDetail extends StatefulWidget {
  final String type;
  final int id;
  const EducationDetail({super.key, required this.type, required this.id});

  @override
  State<EducationDetail> createState() => _EducationDetail();
}

class _EducationDetail extends State<EducationDetail> {
  late List educationList;
  final FocusNode _focusCollegeNode = FocusNode();
  final FocusNode _focusBoardNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    educationList = TextEditingController(
      text: Provider.of<TextFieldProvider>(context).education);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> educationDetail({required BuildContext context,required String type, int? id}) {
    // Sizes
    Size screenSize = MediaQuery.of(context).size;
    double maxHeight = screenSize.height;
    double maxWidth = screenSize.width;

    TextEditingController collegeController = TextEditingController();
    TextEditingController boardController = TextEditingController();

    bool emptyCollegeErrMsg = false;
    bool emptyBoardErrMsg = false;

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
          // heading
          title: Text(
            '${(type == "add") ? "Add":"Edit"} Education Detail',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          titlePadding: EdgeInsets.symmetric(
              vertical: maxHeight * 0.0175, horizontal: maxWidth * 0.04),
          // body
          content: Column(
            children: [
              TextField(
                focusNode: _focusCollegeNode,
                controller: collegeController,
                style: Theme.of(context).textTheme.bodySmall,
                decoration: InputDecoration(
                  labelText: 'Institution/College',
                  labelStyle: Theme.of(context).textTheme.bodySmall,
                  errorText: emptyCollegeErrMsg
                      ? 'Please enter something'
                      : null,
                ),
              ),
              TextField(
                focusNode: _focusBoardNode,
                controller: boardController,
                style: Theme.of(context).textTheme.bodySmall,
                decoration: InputDecoration(
                  labelText: 'Degree/Board',
                  labelStyle: Theme.of(context).textTheme.bodySmall,
                  errorText: emptyBoardErrMsg
                      ? 'Please enter something'
                      : null,
                ),
              ),
            ],
          ),
          contentPadding:
              EdgeInsets.symmetric(vertical: 0, horizontal: maxWidth * 0.04),
          // action
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {},
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
  Widget build(BuildContext context) {
    
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
          'Career Objective',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        elevation: 1,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: maxHeight * 0.03, horizontal: maxWidth * 0.05),
        child: (educationList.isEmpty) ? 
        const NoResumeWidget(page: 'Education Details'),
        :
        ListView.builder(
          itemCount: educationList.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(educationList[index]),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.primary,
        // onPressed: (){},
        onPressed: () => educationDetail(context: context, type: 'add', id: null),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
