import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:petcare/services/auth_service.dart';

class AuthBloc {
  final authService = AuthService();
  final fb = FacebookLogin();

  Stream<User> get currentUser => authService.currentUser;

  loginFacebook() async {
    print("Starting Faceboook Login");

    final res = await fb.logIn(permissions: [
      FacebookPermission.publicProfile,
      FacebookPermission.email
    ]);

    switch (res.status) {
      case FacebookLoginStatus.Success:
        print("Success");

        //get token
        final FacebookAccessToken fbToken = res.accessToken;

        //convert to auth credential
        final AuthCredential credential =
            FacebookAuthProvider.credential(fbToken.token);

        //user credential to sign in with firebase
        final result = await authService.signInWithCredential(credential);

        print("${result.user.displayName} is now logged in");

        break;
      case FacebookLoginStatus.Cancel:
        print("Cancelled");
        break;
      case FacebookLoginStatus.Error:
        print("Error");
        break;
    }
  }
}
