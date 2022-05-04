import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:monas/constants/constants.dart';
import 'package:monas/constants/string_constants.dart';
import 'package:monas/constants/utils.dart';
import 'package:monas/main.dart';
import 'package:monas/models/monas_user.dart';
import 'package:monas/views/adding_tab/add_wallet_screen.dart';

class AuthenticViewModel extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // Initialize Monas user
  late MonasUser _monasUser;

  get monasUser => _monasUser;

  set monasUser(newVal) {
    _monasUser = newVal;
    notifyListeners();
  }

  // Initialize the monas User to avoid crash from being uninitialized
  AuthenticViewModel() {
    _monasUser = MonasUser(
      uid: 'emptyID',
      userName: 'Unknown user',
      email: 'unknown email',
    );
  }

  //* Used to create new account with email and password
  void createUserWithEmailAndPassword(BuildContext context, String email,
      String password, String username) async {
    // Show a dialog to show loading
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => Center(
        child: CircularProgressIndicator(
          color: S.colors.primaryColor,
        ),
      ),
    );
    try {
      await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        //! Use then instead of whenComplete because when complete
        // will fire the function no matter whether the future return error of not
        Utils.showToast('Đăng ký thành công');
        // push user data to firebase
        pushUserToFirestore(username);
        sendEmailVerification();
      });
    } on FirebaseAuthException catch (e) {
      Utils.showSnackBar(e.message);
      //Navigator.pop(context);
    } catch (e) {
      Utils.showErrorDialog(context);
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

  //* Sign up user and send data to fire store
  Future<void> pushUserToFirestore(String? username) async {
    User? user = FirebaseAuth.instance.currentUser;
    MonasUser monasUser = MonasUser(
        uid: user!.uid,
        userName: user.displayName ?? username ?? 'Unknown user',
        email: user.email!);
    monasUser.avatarUrl =
        'https://firebasestorage.googleapis.com/v0/b/wecare-da049.appspot.com/o/default_avatar.png?alt=media&token=2c3cb547-e2d2-4e14-a6da-ee15b04ccb6e';

    // Set user data to firestore
    await FirebaseFirestore.instance
        .collection(StringConstants.firebaseString.userPath)
        .doc(user.uid)
        .set(monasUser.toJSON());
  }

  // Email verification
  Future<void> sendEmailVerification() async {
    if (_firebaseAuth.currentUser != null &&
        !_firebaseAuth.currentUser!.emailVerified) {
      await _firebaseAuth.currentUser!.sendEmailVerification();
    }
  }

  // Get user data from firestore
  Future<void> getUserDataFromFirestore() async {
    await FirebaseFirestore.instance
        .collection(StringConstants.firebaseString.userPath)
        .doc(_firebaseAuth.currentUser!.uid)
        .get()
        .then((value) {
      _monasUser = MonasUser.fromJSON(value.data());
    });
  }

  // sign in with email and password
  Future<void> signInWithEmailAndPassword(
      BuildContext context, String email, String password) async {
    // Show a dialog to show loading
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => Center(
        child: CircularProgressIndicator(
          color: S.colors.secondaryColor,
        ),
      ),
    );
    try {
      await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        Utils.showToast('Đăng nhập thành công');
      });
    } on FirebaseAuthException catch (e) {
      Utils.showSnackBar(e.message);
    } catch (e) {
      Utils.showErrorDialog(context);
    }

    // Navigator.of(context) doesn't work so use a navigator key instead
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

  // Sign in with Google
  Future<void> signInWithGoogle(BuildContext context) async {
    // Show a dialog to show loading
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => Center(
        child: CircularProgressIndicator(
          color: S.colors.secondaryColor,
        ),
      ),
    );

    final GoogleSignInAccount? googleSignInAccount =
        await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleSignInAccount?.authentication;

    // Crate a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in return the user credential
    try {
      await FirebaseAuth.instance.signInWithCredential(credential);
      pushUserToFirestore(null);
    } on FirebaseException catch (e) {
      Utils.showSnackBar(e.message);
    } catch (e) {
      Utils.showErrorDialog(context);
    }

    // Navigator.of(context) doesn't work so use a navigator key instead
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

  //* Sign out current user
  Future<void> signOut(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      Utils.showToast('Bạn đã đăng xuất khỏi Monas!');
    } on FirebaseAuthException catch (e) {
      Utils.showSnackBar(e.message);
    } catch (e) {
      Utils.showErrorDialog(context);
    }
  }
}
