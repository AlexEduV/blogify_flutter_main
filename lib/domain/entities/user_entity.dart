class UserEntity {
  final int id;

  final String firstName;
  final String lastName;

  final String email;
  final String imageSrc;

  const UserEntity({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.imageSrc,
  });

  factory UserEntity.empty() {
    return const UserEntity(
        id: 0, firstName: 'Test', lastName: 'User', email: 'test@test.com', imageSrc: '');
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'imageSrc': imageSrc,
    };
  }

  static UserEntity fromMap(Map<String, dynamic> map) {
    return UserEntity(
      id: map['id'] as int,
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      email: map['email'] as String,
      imageSrc: map['imageSrc'] as String,
    );
  }

  UserEntity copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? email,
    String? imageSrc,
  }) {
    return UserEntity(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      imageSrc: imageSrc ?? this.imageSrc,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserEntity &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          firstName == other.firstName &&
          lastName == other.lastName &&
          email == other.email &&
          imageSrc == other.imageSrc;

  @override
  int get hashCode =>
      id.hashCode ^ firstName.hashCode ^ lastName.hashCode ^ email.hashCode ^ imageSrc.hashCode;
}
