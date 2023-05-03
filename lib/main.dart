import 'package:flutter/material.dart';
import 'package:ishigami/pages/add_event_page.dart';
import 'package:ishigami/pages/event_page.dart';
import 'package:ishigami/pages/home_page.dart';

main() async {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  int _currentIndex = 0;
  
  setCurrentIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: [
              const Text("Accueil"),
              const Text("Liste des Kanji"),
              const Text("Formulaire"),
          ][_currentIndex],
          ),
          body: [
            const HomePage(),
            const EventPage(),
            const AddEventPage()
          ][_currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) => setCurrentIndex(index),
            currentIndex: _currentIndex,
            unselectedItemColor: Colors.blueGrey,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Accueil'
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.calendar_month),
                  label: 'List'
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.add),
                  label: 'Ajout'
              ),
            ],
          ),
        )
    );
  }
}
