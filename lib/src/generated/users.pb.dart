///
//  Generated code. Do not modify.
//  source: users.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class User extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'User', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'service'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id', $pb.PbFieldType.O3)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'uid')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'gender')
    ..a<$core.int>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'age', $pb.PbFieldType.O3)
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'bio')
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ip')
    ..hasRequiredFields = false
  ;

  User._() : super();
  factory User({
    $core.int? id,
    $core.String? uid,
    $core.String? name,
    $core.String? gender,
    $core.int? age,
    $core.String? bio,
    $core.String? ip,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    if (name != null) {
      _result.name = name;
    }
    if (gender != null) {
      _result.gender = gender;
    }
    if (age != null) {
      _result.age = age;
    }
    if (bio != null) {
      _result.bio = bio;
    }
    if (ip != null) {
      _result.ip = ip;
    }
    return _result;
  }
  factory User.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory User.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  User clone() => User()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  User copyWith(void Function(User) updates) => super.copyWith((message) => updates(message as User)) as User; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static User create() => User._();
  User createEmptyInstance() => create();
  static $pb.PbList<User> createRepeated() => $pb.PbList<User>();
  @$core.pragma('dart2js:noInline')
  static User getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<User>(create);
  static User? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get uid => $_getSZ(1);
  @$pb.TagNumber(2)
  set uid($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUid() => $_has(1);
  @$pb.TagNumber(2)
  void clearUid() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get gender => $_getSZ(3);
  @$pb.TagNumber(4)
  set gender($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasGender() => $_has(3);
  @$pb.TagNumber(4)
  void clearGender() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get age => $_getIZ(4);
  @$pb.TagNumber(5)
  set age($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasAge() => $_has(4);
  @$pb.TagNumber(5)
  void clearAge() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get bio => $_getSZ(5);
  @$pb.TagNumber(6)
  set bio($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasBio() => $_has(5);
  @$pb.TagNumber(6)
  void clearBio() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get ip => $_getSZ(6);
  @$pb.TagNumber(7)
  set ip($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasIp() => $_has(6);
  @$pb.TagNumber(7)
  void clearIp() => clearField(7);
}

