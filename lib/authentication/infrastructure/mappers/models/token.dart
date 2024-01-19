import 'package:rental_app/authentication/export.dart';
import 'package:foundation/export.dart';

class TokenModelToTokenEntityMapper extends Mapper<TokenModel, Token> {
  @override
  Token map(TokenModel input) {
    return Token(
      token: input.token,
    );
  }

  @override
  TokenModel restore(Token output) {
    return TokenModel(
      token: output.token,
    );
  }
}
