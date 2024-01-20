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
                    String? emailError = state.email.isEnabledValidator()
                        ? state.email.check(
                            Validate(
                              email: () => 'Wrong e-mail',
                              other: () => 'Unknown error',
                            ),
                          )
                        : null;

                    SignInBloc bloc = context.read<SignInBloc>();
                    return CustomField(
                        error: emailError,
                        textInputType: TextInputType.emailAddress,
                        onChanged: (value) =>
                            bloc.add(SignInEmailChanged(value)),
                        errorHint: 'E-mail must be in the correct format',
                        label: 'Email');
                  },
                ),
                const Spacer(
                  flex: 1,
                ),
                BlocBuilder<SignInBloc, SignInState>(
                  buildWhen: (previous, current) =>
                      previous.password != current.password,
                  builder: (context, state) {
                    String? passwordError = state.password.isEnabledValidator()
                        ? state.password.check(
                            Validate(
                              password: () => 'Wrong password',
                              other: () => 'Unknown error',
                            ),
                          )
                        : null;

                    SignInBloc bloc = context.read<SignInBloc>();
                    return CustomField(
                        error: passwordError,
                        textInputType: TextInputType.text,
                        onChanged: (value) =>
                            bloc.add(SignInPasswordChanged(value)),
                        errorHint:
                            'Password must be minimally 8 characters and include upper case letters, lowercase letters, 2 special characters and at least 3 numbers.',
                        label: 'Password');
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
                      child: const Text('Send'),
                      onPressed: () {
                        print(state.password.isValid());
                        bloc.add(SignInSubmitted());
                      },
                    );
                  },
                ),
                TextButton(
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
