import 'package:flutter/material.dart';
import 'package:rental_app/authentication/export.dart';
import 'package:rental_app/common/export.dart';

class SignInScreen extends StatelessWidget {
  final void Function() onSignUp;
  const SignInScreen({
    super.key,
    required this.onSignUp,
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
                Text('Sign In', style: Fonts.displayMedium),
                const Spacer(
                  flex: 2,
                ),
                BlocBuilder<SignInBloc, SignInState>(
                  buildWhen: (previous, current) =>
                      previous.email != current.email,
                  builder: (context, state) {
                    SignInBloc bloc = context.read<SignInBloc>();
                    return TextFormField(
                      initialValue: state.email,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Email',
                      ),
                      onChanged: (String value) {
                        bloc.add(SignInEmailChanged(value));
                      },
                    );
                  },
                ),
                const Spacer(
                  flex: 1,
                ),
                BlocBuilder<SignInBloc, SignInState>(
                  buildWhen: (previous, current) =>
                      previous.email != current.email,
                  builder: (context, state) {
                    SignInBloc bloc = context.read<SignInBloc>();
                    return TextFormField(
                      initialValue: state.password,
                      obscureText: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Password',
                      ),
                      onChanged: (String value) {
                        bloc.add(SignInPasswordChanged(value));
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
                BlocBuilder<SignInBloc, SignInState>(
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
                BlocBuilder<SignInBloc, SignInState>(
                  buildWhen: (previous, current) =>
                      previous.status != current.status,
                  builder: (context, state) {
                    SignInBloc bloc = context.read<SignInBloc>();
                    return ElevatedButton(
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll<Color>(
                          Colors.green,
                        ),
                      ),
                      child: const Text('send'),
                      onPressed: () {
                        bloc.add(SignInSubmitted());
                      },
                    );
                  },
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 14),
                  ),
                  onPressed: onSignUp,
                  child: const Text('Sign Up'),
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
