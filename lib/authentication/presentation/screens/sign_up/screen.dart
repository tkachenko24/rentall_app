import 'package:flutter/material.dart';
import 'package:rental_app/authentication/export.dart';
import 'package:rental_app/common/export.dart';

class SignUpScreen extends StatelessWidget {
  final void Function() onSignIn;

  const SignUpScreen({
    super.key,
    required this.onSignIn,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(
                  flex: 6,
                ),
                Text('Sign Up', style: Fonts.displayMedium),
                const Spacer(
                  flex: 2,
                ),
                BlocBuilder<SignUpBloc, SignUpState>(
                  buildWhen: (previous, current) =>
                      previous.email != current.email,
                  builder: (context, state) {
                    SignUpBloc bloc = context.read<SignUpBloc>();
                    return TextFormField(
                      initialValue: state.email,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Email',
                      ),
                      onChanged: (String value) {
                        bloc.add(SignUpEmailChanged(value));
                      },
                    );
                  },
                ),
                const Spacer(
                  flex: 1,
                ),
                BlocBuilder<SignUpBloc, SignUpState>(
                  buildWhen: (previous, current) =>
                      previous.email != current.email,
                  builder: (context, state) {
                    SignUpBloc bloc = context.read<SignUpBloc>();
                    return TextFormField(
                      initialValue: state.password,
                      obscureText: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Password',
                      ),
                      onChanged: (String value) {
                        bloc.add(SignUpPasswordChanged(value));
                      },
                    );
                  },
                ),
                const Spacer(
                  flex: 1,
                ),
                const Spacer(
                  flex: 1,
                ),
                BlocBuilder<SignUpBloc, SignUpState>(
                  buildWhen: (previous, current) =>
                      previous.status != current.status,
                  builder: (context, state) {
                    return state.status.when(
                      other: () => const SizedBox(),
                      loading: () => const CircularProgressIndicator(),
                      failed: (ClientFailure failed) =>
                          Text(failed.description),
                    );
                  },
                ),
                BlocBuilder<SignUpBloc, SignUpState>(
                  buildWhen: (previous, current) =>
                      previous.status != current.status,
                  builder: (context, state) {
                    SignUpBloc bloc = context.read<SignUpBloc>();
                    return ElevatedButton(
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll<Color>(
                          Colors.green,
                        ),
                      ),
                      child: const Text('send'),
                      onPressed: () {
                        bloc.add(SignUpSubmitted());
                      },
                    );
                  },
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 14),
                  ),
                  child: const Text('Sign in'),
                  onPressed: onSignIn,
                ),
                const Spacer(
                  flex: 6,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
