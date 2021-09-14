import 'package:equatable/equatable.dart';

class UserPhoto extends Equatable {
  final String id;
  final String userId;
  final String photoUrl;
  final int position;

  const UserPhoto({
    required this.id,
    required this.userId,
    required this.photoUrl,
    required this.position,
  });

  factory UserPhoto.empty() {
    return const UserPhoto(id: '', userId: '', photoUrl: '', position: 0);
  }

  factory UserPhoto.fromMap(Map<String, dynamic> map) {
    return UserPhoto(
      id: map['id'] as String,
      userId: map['user_id'] as String,
      photoUrl: map['photo_url'] as String,
      position: map['position'] as int,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'id': this.id,
      'user_id': this.userId,
      'photo_url': this.photoUrl,
      'position': this.position,
    } as Map<String, dynamic>;
  }

  UserPhoto copyWith({
    String? id,
    String? userId,
    String? photoUrl,
    int? position,
  }) {
    if ((id == null || identical(id, this.id)) &&
        (userId == null || identical(userId, this.userId)) &&
        (photoUrl == null || identical(photoUrl, this.photoUrl)) &&
        (position == null || identical(position, this.position))) {
      return this;
    }

    return UserPhoto(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      photoUrl: photoUrl ?? this.photoUrl,
      position: position ?? this.position,
    );
  }

  @override
  List<Object> get props => [id, userId, photoUrl, position];
}
