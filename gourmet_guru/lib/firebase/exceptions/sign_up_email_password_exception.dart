class SignupWithEmailAndPasswordException {
  final String message;

  const SignupWithEmailAndPasswordException(
      [this.message = "An Unknown error occured"]);

  factory SignupWithEmailAndPasswordException.code(String code) {
    switch (code) {
      case '':
        return SignupWithEmailAndPasswordException('');
      default:
        return SignupWithEmailAndPasswordException();
    }
  }
}
