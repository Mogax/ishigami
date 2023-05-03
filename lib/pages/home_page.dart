import 'package:flutter/material.dart';

import 'event_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/Ninja_Kitsune.png'),
            const Text(
              "Bienvenue sur Ishigami",
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 42
              ),
              textAlign: TextAlign.center,
            ),
            const Text("Apprend le japonais sur cette super app",
              style: TextStyle(
                  fontSize: 24
              ),
              textAlign: TextAlign.center,
            ),
            const Padding(padding: EdgeInsets.only(top:20)),
          ],
        )
    );
  }
}
