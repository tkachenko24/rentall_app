import 'package:foundation/export.dart';

class Authentication extends Entity {
  final String name;

  const Authentication._(this.name);

  static const Authentication other = Authentication._(
    'other',
  );

  static const Authentication authenticated = Authentication._(
    'authenticated',
  );

  static const Authentication unauthenticated = Authentication._(
    'unauthenticated',
  );

  bool get isOther {
    return when(
      authenticated: () => false,
      unauthenticated: () => false,
      other: () => true,
    );
  }

  bool get isAuthenticated {
    return when(
      unauthenticated: () => false,
      authenticated: () => true,
      other: () => false,
    );
  }

  bool get isUnauthenticated {
    return when(
      authenticated: () => false,
      unauthenticated: () => true,
      other: () => true,
    );
  }

  W when<W>({
    W Function()? authenticated,
    W Function()? unauthenticated,
    required W Function() other,
  }) {
    if (authenticated != null && this == Authentication.authenticated) {
      return authenticated();
    }

    if (unauthenticated != null && this == Authentication.unauthenticated) {
      return unauthenticated();
    }

    return other();
  }

  @override
  List<Object?> get props => [name];

  @override
  String toString() {
    return name;
  }
}
