import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

abstract class JwtProvider {
  const JwtProvider();

  Future<String> provide();
}

class FirebaseAuthTokenProvider extends JwtProvider {
  final FirebaseAuth _firebaseAuthInstance;

  FirebaseAuthTokenProvider({FirebaseAuth? firebaseAuthInstance})
      : _firebaseAuthInstance = firebaseAuthInstance ?? GetIt.I<FirebaseAuth>(),
        super();

  @override
  Future<String> provide() async {
    final user = _firebaseAuthInstance.currentUser;
    if (user == null) {
      return "";
    }

    final token = await user.getIdToken();

    return token;
  }
}
