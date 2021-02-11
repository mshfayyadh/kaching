class ProfileData {
  String first;
  String last;
  String id;
  String email;
  String phone;
  String pass;

  ProfileData(
      {this.id, this.first, this.last, this.email, this.phone, this.pass});

  ProfileData.fromJson(Map<String, dynamic> json)
      : this(
            id: json['id'].toString(),
            first: json['first'],
            last: json['last'],
            email: json['email'],
            phone: json['phone'],
            pass: json['pass']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'first': first,
        'last': last,
        'email': email,
        'phone': phone,
        'pass': pass
      };
}
