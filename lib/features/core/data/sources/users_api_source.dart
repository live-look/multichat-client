import 'package:grpc/grpc.dart';
import 'base_source.dart';
import '../../data/interceptors/auth_interceptor.dart';
import '../../../../src/generated/users.pbgrpc.dart' as grpc;

class UsersApiSource extends BaseSource {
  UsersApiSource() : super();

  grpc.UsersClient get client => grpc.UsersClient(
        channel,
        options: CallOptions(timeout: Duration(seconds: 5)),
        interceptors: [AuthInterceptor()],
      );
}
