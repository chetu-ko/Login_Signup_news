class Validators {
  String emailvalidate(String email) {
    if (email.isEmpty) {
      return "Enter Email";
    } else {
      bool emailValid = RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(email);
      return emailValid == true ? "True" : "Email Badly formatted";
    }
  }

  String validatePass(String pass) {
    if (pass.isEmpty && pass.length < 3) {
      return "Enter pass";
    } else {
      return "True";
    }
  }

  String validateConfirmPadd(String confPass, String pass) {
    if (confPass.isEmpty) {
      return "password required";
    } else if (confPass != pass) {
      return "invalid pass";
    } else {
      return "True";
    }
  }
}
