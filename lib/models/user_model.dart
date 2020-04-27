class User {
  String id;
  String username;
  String password;
  String firstName;
  String lastName;
  String email;
  String authToken;
  String phoneNumber;

  User({
    this.id,
    this.username,
    this.password,
    this.firstName,
    this.lastName,
    this.email,
    this.authToken,
    this.phoneNumber,
  });
  factory User.getfromJson(Map<String, dynamic> json) {
    return new User(
      id: json['id'],
      username: json['usernamme'],
      password: json['password'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      authToken: json['auth_token'],
      phoneNumber: json['phonenumber'],
    );
  }
}
