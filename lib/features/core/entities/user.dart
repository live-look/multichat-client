import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'user_photo.dart';

part 'user.g.dart';

@HiveType(typeId: 1)
class User extends Equatable {
  static const String maleGender = 'Male';
  static const String femaleGender = 'Female';
  static const String othersGender = 'Others';
  static final Duration maxOnlineDiff = Duration(minutes: 15);

  @HiveField(0)
  final int id;
  @HiveField(1)
  final String uid;
  @HiveField(2)
  final String name;
  @HiveField(3)
  final String gender;
  @HiveField(4)
  final String photoURL;
  @HiveField(5)
  final int age;
  @HiveField(6)
  final DateTime? lastSeen;
  @HiveField(7)
  final List<UserPhoto> photos;

  const User({
    required this.id,
    required this.uid,
    required this.name,
    required this.gender,
    required this.photoURL,
    required this.age,
    required this.lastSeen,
    required this.photos,
  });

  factory User.empty() => User(
        id: 0,
        uid: '',
        name: '',
        gender: maleGender,
        photoURL: '',
        age: 19,
        lastSeen: null,
        photos: <UserPhoto>[],
      );

  User copyWith({
    int? id,
    String? uid,
    String? name,
    String? gender,
    String? photoURL,
    int? age,
    DateTime? lastSeen,
    List<UserPhoto>? photos,
  }) {
    return User(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      name: name ?? this.name,
      gender: gender ?? this.gender,
      photoURL: photoURL ?? this.photoURL,
      age: age ?? this.age,
      lastSeen: lastSeen ?? this.lastSeen,
      photos: photos ?? this.photos,
    );
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as int,
      uid: map['uid'],
      name: map['name'],
      gender: map['gender'],
      photoURL: map['photo_url'],
      age: map['age'],
      lastSeen: map['last_seen']?.toDate(),
      photos: <UserPhoto>[],
    );
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'uid': uid,
        'name': name,
        'gender': gender,
        'photo_url': photoURL,
        'age': age,
        'last_seen': lastSeen,
      };

  @override
  List<Object?> get props =>
      [id, uid, name, gender, photoURL, age, lastSeen, photos];
}
