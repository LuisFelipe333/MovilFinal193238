import 'package:firebase_auth/firebase_auth.dart';

import '../auth_repository.dart';

class AuthRepository extends AuthRepositoryBase{
  final _firebaseAuth = FirebaseAuth.instance;

  AuthUser? _userFromFirebase(User? user)=>
      user == null ? null : AuthUser(user.uid, user.email);

  @override
  // TODO: implement onAuthStateChanged
  Stream<AuthUser?> get onAuthStateChanged =>
      _firebaseAuth.authStateChanges().asyncMap(_userFromFirebase);

  @override
  Future<AuthUser?> createUserWithEmailAndPassword(String email, String password) async {
    final authResult = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    return _userFromFirebase(authResult.user);
  }

  @override
  Future<AuthUser?> signInWithEmailAndPassword(String email, String password) async{
    // TODO: implement signInWithEmailAndPassword
    final authResult = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    return _userFromFirebase(authResult.user);
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }
  
}