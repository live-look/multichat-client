import 'package:grpc/grpc.dart';
import '../../data/interceptors/auth_interceptor.dart';
import '../../../../src/generated/users.pbgrpc.dart' as grpc;

class UsersRemoteSource {
  final ClientChannel channel;

  UsersRemoteSource()
      : channel = ClientChannel(
          '192.168.1.37', // TODO: replace
          port: 50053,
          options: const ChannelOptions(
            credentials: ChannelCredentials.insecure(),
            connectionTimeout: const Duration(seconds: 10),
          ),
        );

  grpc.UsersClient get client => grpc.UsersClient(
        channel,
        options: CallOptions(timeout: const Duration(seconds: 10)),
        interceptors: [AuthInterceptor()],
      );
}
