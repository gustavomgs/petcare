import 'package:firebase_auth/firebase_auth.dart';

class GetUID {
  String uid;

  Future<String> userId() async {
    final FirebaseAuth auth = FirebaseAuth.instance;

    final FirebaseUser user = await auth.currentUser();
    uid = user.uid;
    return uid;
  }
}
