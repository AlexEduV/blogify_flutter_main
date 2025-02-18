import 'package:blogify_flutter_main/domain/entities/user_entity.dart';
import 'package:flutter/cupertino.dart';

class GlobalMockUserProvider extends ChangeNotifier {

  final UserEntity _currentUser = const UserEntity(
      id: 1,
      firstName: 'Jason',
      lastName: 'Todd',
      email: 'therealjason@gmail.com',
      imageSrc: 'assets/images/profile-image.jpg',
  );
  UserEntity get currentUser => _currentUser;


  final List<UserEntity> _userPool = [
    const UserEntity(id: 2, firstName: 'Alex', lastName: 'McKey', email: 'alexmckey@gmail.com', imageSrc: ''),
    const UserEntity(id: 3, firstName: 'Tom', lastName: 'Noble', email: 'tomnb23@gmail.com', imageSrc: ''),
    const UserEntity(id: 4, firstName: 'Marney', lastName: 'March', email: 'mmarch@gmail.com', imageSrc: ''),
  ];

  List<UserEntity> get userPool => _userPool;

  UserEntity getUserEntityById(int id) {
    return _userPool.firstWhere((user) => user.id == id, orElse: () => _currentUser);
  }

}
