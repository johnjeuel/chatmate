
import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String id;
  final String photoUrl;
  final String displayName;
  final String? firstname;
  final String? lastname;
  final String phoneNumber;
  final String aboutMe;

  const UserModel(
      {required this.id,
        required this.photoUrl,
        required this.displayName,
        required this.lastname,
        required this.firstname,
        required this.phoneNumber,
        required this.aboutMe});

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}