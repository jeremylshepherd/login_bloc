import 'package:flutter/material.dart';
import '../blocs/bloc.dart';
import '../blocs/Provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    final bloc = Provider.of(context);
    return Container(
      margin: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          emailField(bloc),
          topSpacer(),
          passwordField(bloc),
          topSpacer(),
          submitButton(bloc),
        ],
      ),
    );
  }

  Widget emailField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.email,
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.changeEmail,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: 'you@example.com',
            labelText: 'Email Address',
            errorText: snapshot.error?.toString(),
          ),
        );
      },
    );
  }

  Widget passwordField(Bloc bloc) {
    return StreamBuilder(
        stream: bloc.password,
        builder: (context, snapshot) {
          return TextField(
            onChanged: bloc.changePassword,
            decoration: InputDecoration(
                hintText: 'Password',
                labelText: 'Password',
                errorText: snapshot.error?.toString()),
          );
        });
  }

  Widget submitButton(Bloc bloc) {
    return StreamBuilder(
      builder: (context, snapshot) {
        return ElevatedButton(
          child: const Text('Touch me 😉'),
          onPressed:
              snapshot.hasError || !snapshot.hasData ? null : bloc.submit,
        );
      },
      stream: bloc.submitValid,
    );
  }

  Widget topSpacer() => Container(margin: const EdgeInsets.only(top: 25.0));
}
