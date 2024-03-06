class User {
  final String first;
  final String last;
  final String email;

  User({
    required this.first,
    required this.last,
    required this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      first: json['first'],
      last: json['last'],
      email: json['email'],
    );
  }
}
