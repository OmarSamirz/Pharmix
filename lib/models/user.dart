class User {
  const User({
    required this.userID,
    required this.fname,
    required this.lname,
    required this.email,
    required this.password,
  });

  final int userID;
  final String fname;
  final String lname;
  final String email;
  final String password;
}
