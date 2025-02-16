import 'package:blogify_flutter_main/domain/entities/user_entity.dart';
import 'package:flutter/cupertino.dart';

class GlobalMockUserProvider extends ChangeNotifier {

  final UserEntity _currentUser = const UserEntity(
      firstName: 'Jason',
      lastName: 'Todd',
      email: 'therealjason@gmail.com',
      imageSrc: 'assets/images/profile-image.jpg',
  );

  UserEntity get currentUser => _currentUser;

}
