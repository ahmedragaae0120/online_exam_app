class User {
  String? username;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? role;
  bool? isVerified;
  String? id;
  DateTime? createdAt;

  User({
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.role,
    this.isVerified,
    this.id,
    this.createdAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        username: json['username'] as String?,
        firstName: json['firstName'] as String?,
        lastName: json['lastName'] as String?,
        email: json['email'] as String?,
        phone: json['phone'] as String?,
        role: json['role'] as String?,
        isVerified: json['isVerified'] as bool?,
        id: json['_id'] as String?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
      );

  Map<String, dynamic> toJson() => {
        'username': username,
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'phone': phone,
        'role': role,
        'isVerified': isVerified,
        '_id': id,
        'createdAt': createdAt?.toIso8601String(),
      };
}
