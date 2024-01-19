class TokenStatusModel {
  final String name;

  const TokenStatusModel._(this.name);

  static const TokenStatusModel exist = TokenStatusModel._(
    'EXIST',
  );

  static const TokenStatusModel empty = TokenStatusModel._(
    'EMPTY',
  );

  bool get isOther {
    return when(
      exist: () => false,
      empty: () => false,
      other: () => true,
    );
  }

  bool get isExist {
    return when(
      exist: () => true,
      other: () => false,
    );
  }

  bool get isEmpty {
    return when(
      empty: () => true,
      other: () => false,
    );
  }

  W when<W>({
    W Function()? exist,
    W Function()? empty,
    required W Function() other,
  }) {
    if (exist != null && this == TokenStatusModel.exist) {
      return exist();
    }

    if (empty != null && this == TokenStatusModel.empty) {
      return empty();
    }

    return other();
  }
}
