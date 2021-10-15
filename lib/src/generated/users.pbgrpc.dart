///
//  Generated code. Do not modify.
//  source: users.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'users.pb.dart' as $0;
export 'users.pb.dart';

class UsersClient extends $grpc.Client {
  static final _$create = $grpc.ClientMethod<$0.User, $0.User>(
      '/service.Users/Create',
      ($0.User value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.User.fromBuffer(value));
  static final _$update = $grpc.ClientMethod<$0.User, $0.User>(
      '/service.Users/Update',
      ($0.User value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.User.fromBuffer(value));

  UsersClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.User> create($0.User request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$create, request, options: options);
  }

  $grpc.ResponseFuture<$0.User> update($0.User request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$update, request, options: options);
  }
}

abstract class UsersServiceBase extends $grpc.Service {
  $core.String get $name => 'service.Users';

  UsersServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.User, $0.User>(
        'Create',
        create_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.User.fromBuffer(value),
        ($0.User value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.User, $0.User>(
        'Update',
        update_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.User.fromBuffer(value),
        ($0.User value) => value.writeToBuffer()));
  }

  $async.Future<$0.User> create_Pre(
      $grpc.ServiceCall call, $async.Future<$0.User> request) async {
    return create(call, await request);
  }

  $async.Future<$0.User> update_Pre(
      $grpc.ServiceCall call, $async.Future<$0.User> request) async {
    return update(call, await request);
  }

  $async.Future<$0.User> create($grpc.ServiceCall call, $0.User request);
  $async.Future<$0.User> update($grpc.ServiceCall call, $0.User request);
}
