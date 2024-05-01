import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:resu_maker/provider/resume_provider.dart';
import 'package:resu_maker/provider/textfield_provider.dart';
import 'package:resu_maker/screens/home_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('myBox');
  Hive.box('myBox').clear();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    Size screenSize = MediaQuery.of(context).size;
    double maxHeight = screenSize.height;
    double maxWidth = screenSize.width;

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ResumeProvider()),
        ChangeNotifierProvider(create: (context) => TextFieldProvider())
      ],
      child: MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 66, 165, 245),
            primary: const Color.fromARGB(255, 66, 165, 245),
          ),
          inputDecorationTheme: InputDecorationTheme(
            floatingLabelStyle: TextStyle(
              color: const Color.fromARGB(255, 66, 165, 245),
              fontSize: maxHeight * 0.02,
              fontWeight: FontWeight.w500
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: maxWidth * 0.025,vertical: maxWidth * 0.015),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(
                color: Color.fromARGB(255, 66, 165, 245),
                width: 1,
              ),
            ),
            errorStyle: TextStyle(
              fontSize: maxHeight * 0.020,
              fontWeight: FontWeight.w400,
              color: Colors.red,
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(
                width: 1,
                color: Colors.red
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(
                width: 1,
                color: Color.fromARGB(255, 66, 165, 245),
              ),
            ),
          ),
          textTheme: TextTheme(
            titleLarge: TextStyle(
              fontSize: maxHeight * 0.03,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
            bodyLarge: TextStyle(
              fontSize: maxHeight * 0.028,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
            bodyMedium: TextStyle(
              fontSize: maxHeight * 0.025,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
            bodySmall: TextStyle(
              fontSize: maxHeight * 0.020,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: const HomeScreen(),
      ),
    );
  }
}
