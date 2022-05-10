// class MonasUser {
//   final String uid;
//   final String userName;
//   final String email;
//   String? avatarUrl;
//
//   MonasUser({
//     required this.uid,
//     required this.userName,
//     required this.email,
//     this.avatarUrl,
//   });
//
//   // get user name
//   String get name => userName;
//
//   // Extract JSON file to user object
//   factory MonasUser.fromJSON(map) {
//     return MonasUser(
//       uid: map['uid'],
//       userName: map['userName'],
//       email: map['email'],
//       avatarUrl: map['avatarUrl'],
//     );
//   }
//
//   // Package user object to the JSON file
//   Map<String, dynamic> toJSON() {
//     return {
//       'uid': uid,
//       'userName': userName,
//       'email': email,
//       'avatarUrl': avatarUrl,
//     };
//   }
// }
