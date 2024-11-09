abstract class IForgotPasswordRepository {
  Future<void> exec(String email);
}