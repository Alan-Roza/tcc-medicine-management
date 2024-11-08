import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';

String? getUserIdDecodingJWT(String token) {
  try {
    final jwt = JWT.decode(token);
    return jwt.payload['id'];
  } catch (e) {
    print('Error decoding token: $e');
  }
  return null;
}