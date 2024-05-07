import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resu_maker/provider/textfield_provider.dart';
import 'package:resu_maker/widgets/textfield_widget.dart';
import 'package:resu_maker/widgets/no_resume_widget.dart';

class WorkExperience extends StatefulWidget {
  final String type;
  final int id;
  const WorkExperience({super.key, required this.type, required this.id});

  @override
  State<WorkExperience> createState() => _WorkExperience();
}

class _WorkExperience extends State<WorkExperience> {

  late List experienceList;

  final FocusNode _focusOrganizationNode = FocusNode();
  final FocusNode _focusDesignationNode = FocusNode();
  final FocusNode _focusResponsibilyNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    experienceList = TextEditingController(
      text: Provider.of<TextFieldProvider>(context).workExperience);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> experienceDetail({required BuildContext context,required String type, int? id}) {
    // Sizes
    Size screenSize = MediaQuery.of(context).size;
    double maxHeight = screenSize.height;
    double maxWidth = screenSize.width;

    TextEditingController organizationController = TextEditingController();
    TextEditingController designationController = TextEditingController();
    TextEditingController responsibilityController = TextEditingController();

    bool emptyOrganizationErrMsg = false;
    bool emptyDesignationErrMsg = false;
    bool emptyResponsibilityErrMsg = false;

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
            '${(type == "add") ? "Add":"Edit"} Work Experience',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          titlePadding: EdgeInsets.symmetric(
              vertical: maxHeight * 0.0175, horizontal: maxWidth * 0.04),
          // body
          content: Column(
            children: [
              TextField(
                focusNode: _focusOrganizationNode,
                controller: organizationController,
                style: Theme.of(context).textTheme.bodySmall,
                decoration: InputDecoration(
                  labelText: 'Organization',
                  labelStyle: Theme.of(context).textTheme.bodySmall,
                  errorText: emptyOrganizationErrMsg
                      ? 'Please enter something'
                      : null,
                ),
              ),
              TextField(
                focusNode: _focusDesignationNode,
                controller: designationController,
                style: Theme.of(context).textTheme.bodySmall,
                decoration: InputDecoration(
                  labelText: 'Designation',
                  labelStyle: Theme.of(context).textTheme.bodySmall,
                  errorText: emptyDesignationErrMsg
                      ? 'Please enter something'
                      : null,
                ),
              ),
              TextField(
                focusNode: _focusResponsibilyNode,
                controller: responsibilityController,
                style: Theme.of(context).textTheme.bodySmall,
                decoration: InputDecoration(
                  labelText: 'Responsibility',
                  labelStyle: Theme.of(context).textTheme.bodySmall,
                  errorText: emptyResponsibilityErrMsg
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
        child: (experienceList.isEmpty) ? 
        const NoResumeWidget(page: 'Work Experience'),
        :
        ListView.builder(
          itemCount: experienceList.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(experienceList[index]),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.primary,
        // onPressed: (){},
        onPressed: () => experienceDetail(context: context, type: 'add', id: null),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
