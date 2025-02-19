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
}