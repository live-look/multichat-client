import 'package:equatable/equatable.dart';
import 'user_photo.dart';

class CurrentUser extends Equatable {
  static const String maleGender = 'Male';
  static const String femaleGender = 'Female';
  static const String othersGender = 'Others';
  static final DateTime offlineDateTime = DateTime(1970);
  static final DateTime defaultDateTime = DateTime(1970);
  static final Duration maxOnlineDiff = Duration(minutes: 15);

  final String id;
  final String name;
  final String email;
  final String phone;
  final String gender;
  final String photoURL;
  final DateTime birthday;
  final DateTime lastSeen;

  final List<UserPhoto> photos;

  const CurrentUser({
    required this.id,
    required this.email,
    required this.name,
    required this.phone,
    required this.gender,
    required this.photoURL,
    required this.birthday,
    required this.lastSeen,
    required this.photos,
  });

  static final empty = CurrentUser(
    id: '',
    email: '',
    name: '',
    phone: '',
    gender: '',
    photoURL: '',
    birthday: defaultDateTime,
    lastSeen: offlineDateTime,
    photos: <UserPhoto>[],
  );

  CurrentUser copyWith({
    String? id,
    String? name,
    String? email,
    String? phone,
    String? gender,
    String? photoURL,
    DateTime? birthday,
    DateTime? lastSeen,
    List<UserPhoto>? photos,
  }) {
    return CurrentUser(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      gender: gender ?? this.gender,
      photoURL: photoURL ?? this.photoURL,
      birthday: birthday ?? this.birthday,
      lastSeen: lastSeen ?? this.lastSeen,
      photos: photos ?? this.photos,
    );
  }

  factory CurrentUser.fromMap(Map<String, dynamic> map) {
    return CurrentUser(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      phone: map['phone'],
      gender: map['gender'],
      photoURL: map['photo_url'],
      birthday: map['birthday']?.toDate(),
      lastSeen: map['last_seen']?.toDate() ?? offlineDateTime,
      photos: <UserPhoto>[],
    );
  }

  bool acceptsCalls() {
    return lastSeen.isAfter(CurrentUser.offlineDateTime);
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'phone': phone,
        'gender': gender,
        'photo_url': photoURL,
        'birthday': birthday,
        'last_seen': lastSeen,
      };

  @override
  List<Object> get props =>
      [id, name, email, phone, gender, photoURL, birthday, lastSeen, photos];
}
