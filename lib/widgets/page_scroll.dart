import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Step Form in Carousel',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StepFormPage(),
    );
  }
}

class StepFormPage extends StatefulWidget {
  @override
  _StepFormPageState createState() => _StepFormPageState();
}

class _StepFormPageState extends State<StepFormPage> {
  PageController _pageController = PageController();
  int _currentPage = 0;

  List<Widget> _pages = [
    StepPage(title: "Step 1: Enter Name"),
    StepPage(title: "Step 2: Enter Email"),
    StepPage(title: "Step 3: Confirm Details"),
  ];

  void _nextPage() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
      setState(() {
        _currentPage++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Step Form in Carousel'),
      ),
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(), // Disables swipe to navigate
        children: _pages,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _nextPage,
        tooltip: 'Next',
        child: Icon(Icons.arrow_forward),
      ),
    );
  }
}

class StepPage extends StatelessWidget {
  final String title;

  StepPage({required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(title, style: TextStyle(fontSize: 24)),
    );
  }
}
