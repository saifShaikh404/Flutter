import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resu_maker/provider/textfield_provider.dart';
import 'package:resu_maker/widgets/textfield_widget.dart';
import 'package:resu_maker/widgets/no_resume_widget.dart';

class Projects extends StatefulWidget {
  final String type;
  final int id;
  const Projects({super.key, required this.type, required this.id});

  @override
  State<Projects> createState() => _Projects();
}

class _Projects extends State<Projects> {

  late List projectsList;

  final FocusNode _focusNameNode = FocusNode();
  final FocusNode _focusDetailNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    projectsList = TextEditingController(
      text: Provider.of<TextFieldProvider>(context).projects);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> projectsDetail({required BuildContext context,required String type, int? id}) {
    // Sizes
    Size screenSize = MediaQuery.of(context).size;
    double maxHeight = screenSize.height;
    double maxWidth = screenSize.width;

    TextEditingController nameController = TextEditingController();
    TextEditingController detailController = TextEditingController();

    bool emptyNameErrMsg = false;
    bool emptyDetailErrMsg = false;

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
            '${(type == "add") ? "Add":"Edit"} Project',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          titlePadding: EdgeInsets.symmetric(
              vertical: maxHeight * 0.0175, horizontal: maxWidth * 0.04),
          // body
          content: Column(
            children: [
              TextField(
                focusNode: _focusNameNode,
                controller: nameController,
                style: Theme.of(context).textTheme.bodySmall,
                decoration: InputDecoration(
                  labelText: 'Project Name',
                  labelStyle: Theme.of(context).textTheme.bodySmall,
                  errorText: emptyNameErrMsg
                      ? 'Please enter something'
                      : null,
                ),
              ),
              TextField(
                focusNode: _focusDetailNode,
                controller: detailController,
                style: Theme.of(context).textTheme.bodySmall,
                decoration: InputDecoration(
                  labelText: 'Project Detail',
                  labelStyle: Theme.of(context).textTheme.bodySmall,
                  errorText: emptyDetailErrMsg
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
        child: (projectsList.isEmpty) ? 
        const NoResumeWidget(page: 'Projects'),
        :
        ListView.builder(
          itemCount: projectsList.length,
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
        onPressed: () => projectsDetail(context: context, type: 'add', id: null),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
