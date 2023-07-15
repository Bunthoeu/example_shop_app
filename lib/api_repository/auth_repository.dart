import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
 Future<String> signInWithEmailPassword(String email, String password) async {
    try {
      final UserCredential result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final User user = result.user!;
      return user.uid;
    } catch (error) {
      throw error.toString();
    }
  }

  // User? get currentUser => _firebaseAuth.currentUser;
  Stream<User?> get authStateChange => _firebaseAuth.authStateChanges();
  // Future<void> signInWithEmailPassword(
  //     {required String email, required String password}) async {
  //   await _firebaseAuth.signInWithEmailAndPassword(
  //       email: email, password: password);
    
  // }

  Future<void> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> sendRequestPasswordEmail({required String email}) async {
    await _firebaseAuth.sendPasswordResetEmail(
      email: email,
    );
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
    Future<User> getCurrentUser() async {
    User? user = _firebaseAuth.currentUser;
    if (user == null) {
      throw Exception('User not found');
    }
    return user;
  }
}