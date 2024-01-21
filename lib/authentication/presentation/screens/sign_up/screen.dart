import 'package:flutter/material.dart';
import 'package:rental_app/authentication/export.dart';
import 'package:rental_app/common/export.dart';

class SignUpScreen extends StatelessWidget {
  final void Function() onSignIn;
  final void Function() onSubmitted;
  const SignUpScreen({
    super.key,
    required this.onSignIn,
    required this.onSubmitted,
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
                Text('Sign Up', style: Fonts.displayMedium),
                const Spacer(
                  flex: 2,
                ),
                BlocBuilder<SignUpBloc, SignUpState>(
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

                    SignUpBloc bloc = context.read<SignUpBloc>();
                    return CustomField(
                        error: emailError,
                        textInputType: TextInputType.emailAddress,
                        onChanged: (value) =>
                            bloc.add(SignUpEmailChanged(value)),
                        errorHint: 'E-mail must be in the correct format',
                        label: 'Email');
                  },
                ),
                const Spacer(
                  flex: 1,
                ),
                BlocBuilder<SignUpBloc, SignUpState>(
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

                    SignUpBloc bloc = context.read<SignUpBloc>();
                    return CustomField(
                        error: passwordError,
                        obscureText: true,
                        textInputType: TextInputType.text,
                        onChanged: (value) =>
                            bloc.add(SignUpPasswordChanged(value)),
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
                BlocConsumer<SignUpBloc, SignUpState>(
                  buildWhen: (previous, current) =>
                      previous.status != current.status,
                  builder: (context, state) {
                    SignUpBloc bloc = context.read<SignUpBloc>();
                    return ElevatedButton(
                      child: const Text('Send'),
                      onPressed: () async {
                        bloc.add(SignUpSubmitted());
                      },
                    );
                  },
                  listener: (context, state) {
                    if (state.status.isSuccess()) {
                      onSubmitted.call();
                    }
                  },
                ),
                TextButton(
                  onPressed: onSignIn,
                  child: const Text('Sign in'),
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
