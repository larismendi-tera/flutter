import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:myapp/constants.dart';
import 'package:myapp/src/blocs/bloc_user.dart';
import 'widgets/button_purple.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);

    return StreamBuilder(
        stream: userBloc.authStatus,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData || snapshot.hasError) {
            return _loginScreen(context);
          } else {
            return Scaffold(
              body: Container(
                child: Center(
                  child: ButtonPurple(
                      title: "Logout",
                      onPress: () {
                        userBloc.signOut();
                      }),
                ),
              ),
            );
          }
        });
  }

  Widget _loginScreen(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: size.width,
            height: size.height,
            color: kPrimaryColor,
            padding: EdgeInsets.only(bottom: kDefaultPadding * 10),
            child: Center(
              child: Image.asset("assets/images/logoTeraton.png"),
            ),
          ),
          Container(
            width: size.width,
            height: size.height,
            color: kBackgroudColor,
            padding: EdgeInsets.only(bottom: kDefaultPadding * 10),
            child: Center(
              child: Image.asset("assets/images/logoTeraton.png"),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Center(
                child: ButtonPurple(
                    title: "Login",
                    onPress: () {
                      userBloc.signOut();
                      userBloc.signIn().then((FirebaseUser user) =>
                          {print(user), print("usuario: ${user.displayName}")});
                    }),
              )
            ],
          )
        ],
      ),
    );
  }
}
