import 'package:grpc/grpc.dart';
import 'base_remote_source.dart';
import '../../data/interceptors/auth_interceptor.dart';
import '../../../../src/generated/users.pbgrpc.dart' as grpc;

class UsersRemoteSource extends BaseSource {
  UsersRemoteSource() : super();

  grpc.UsersClient get client => grpc.UsersClient(
        channel,
        options: CallOptions(timeout: Duration(seconds: 5)),
        interceptors: [AuthInterceptor()],
      );
}
