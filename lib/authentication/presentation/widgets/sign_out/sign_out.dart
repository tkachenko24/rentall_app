import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rental_app/authentication/export.dart';

class SignOut extends StatelessWidget {
  const SignOut({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignOutBloc, SignOutState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        SignOutBloc bloc = context.read<SignOutBloc>();
        return TextButton(
          style: TextButton.styleFrom(
            textStyle: const TextStyle(fontSize: 14),
          ),
          child: Text(
            state.status.when<String>(
              loading: () => 'Sign Out...',
              other: () => 'Sign Out',
            ),
          ),
          onPressed: () {
            if (state.status.isLoading()) {
              return;
            }
            bloc.add(SignOutSubmitted());
          },
        );
      },
    );
  }
}
