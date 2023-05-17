import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';

 void showMessage(String message)
{

}
void ShowLoaderDialog(BuildContext context)
{
  AlertDialog alert=AlertDialog(
    content: Builder(
      builder: (context)
          {
            return SizedBox(
              width: 100,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CircularProgressIndicator(
                    color: Colors.red,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left:7),
                    child: Text("Loading"),
                  ),
                ],
              ),
            );
          }
    ),
  );
  showDialog(
    barrierDismissible: false,
      context: context,
      builder: (BuildContext context){
    return alert;
  });
}
String getMessageFromErrorCode(String errorCode) {
  switch (errorCode) {
    case "ERROR_EMAIL_ALREADY_IN_USE":
      return "Email already used. Go to login page.";
    case "account-exists-with-different-credential":
      return "Email already used. Go to login page.";
    case "email-already-in-use":
      return "Email already used. Go to login page.";
    case "ERROR_WRONG_PASSWORD":
    case "wrong-password":
      return "Wrong Password ";
    case "ERROR_USER_NOT_FOUND":
      return "No user found with this email.";
    case "user-not-found":
      return "No user found with this email.";
    case "ERROR_USER_DISABLED":
      return "User disabled.";
    case "user-disabled":
      return "User disabled.";
    case "ERROR_TOO_MANY_REQUESTS":
      return "Too many requests to log into this account.";
    case "operation-not-allowed":
      return "Too many requests to log into this account.";
    case "ERROR_OPERATION_NOT_ALLOWED":
      return "Too many requests to log into this account.";
    case "ERROR_INVALID_EMAIL":
      return "Email address is invalid.";
    case "invalid-email":
      return "Email address is invalid.";
    default:
      return "Login failed. Please try again.";
  }
}
bool loginValidation(String email,String password)
{
  if(email.isEmpty)
    {
      showMessage("Email is empty");
      return false;
    }
  else if(password.isEmpty)
  {
    showMessage("Password is empty");
    return false;
  }
  else if(email.isEmpty&&password.isEmpty)
    {
      showMessage("Both email and password are empty");
      return false;


    }
  else
    {
      return true;
    }


}
bool SignUpValidation(String email,String password)
{
  if(email.isEmpty)
  {
    showMessage("Email is empty");
    return false;
  }
  else if(password.isEmpty)
  {
    showMessage("Password is empty");
    return false;
  }
  else if(email.isEmpty&&password.isEmpty)
  {
    showMessage("Both email and password are empty");
    return false;


  }
  else
  {
    return true;
  }


}

