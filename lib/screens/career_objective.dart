import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resu_maker/provider/textfield_provider.dart';
import 'package:resu_maker/widgets/textfield_widget.dart';

class CareerObjective extends StatefulWidget {
  final String type;
  final int id;
  const CareerObjective({super.key, required this.type, required this.id});

  @override
  State<CareerObjective> createState() => _CareerObjective();
}

class _CareerObjective extends State<CareerObjective> {
  late TextEditingController summaryController;
  late TextEditingController careerObjectiveController;


  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    summaryController = TextEditingController(
        text: Provider.of<TextFieldProvider>(context).summary);
    careerObjectiveController = TextEditingController(
        text: Provider.of<TextFieldProvider>(context).heading);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
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
        padding: EdgeInsets.symmetric(
            vertical: maxHeight * 0.03, horizontal: maxWidth * 0.05),
        child: Column(
          children: [
            TextFieldWidget(label: 'Name', controller: summaryController),
            TextFieldWidget(label: 'Email', controller: careerObjectiveController),
          ],
        ),
      ),
    );
  }
}
