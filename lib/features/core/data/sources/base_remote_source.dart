import 'package:grpc/grpc.dart';

abstract class BaseSource {
  final ClientChannel channel;

  BaseSource()
      : channel = ClientChannel(
          '192.168.1.43', // TODO: replace
          port: 50053,
          options: const ChannelOptions(
            credentials: ChannelCredentials.insecure(),
            connectionTimeout: Duration(seconds: 10),
          ),
        );
}
