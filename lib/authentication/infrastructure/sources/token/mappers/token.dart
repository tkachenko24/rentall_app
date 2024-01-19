import 'package:foundation/export.dart';
import 'package:rental_app/authentication/infrastructure/sources/token/export.dart';

class TokenMapToTokenEntityMapper
    extends Mapper<Map<String, dynamic>, TokenModel> {
  @override
  TokenModel map(Map<String, dynamic> input) {
    return TokenModel(
      token: input['access'],
    );
  }

  @override
  Map<String, dynamic> restore(TokenModel output) {
    return {
      'token': output.token,
    };
  }
}
