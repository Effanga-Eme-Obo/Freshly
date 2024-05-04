import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freshly/features/authentication/screens/onboarding/onboarding.dart';
import 'package:freshly/navbar.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot){
            /// if the user is logged in
            if(snapshot.hasData){
              return NavBar();
            }

            else {
              return OnboardingScreen();
            }
          },
      ),
    );
  }
}