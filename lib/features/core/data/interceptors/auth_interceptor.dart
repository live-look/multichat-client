import 'package:get_it/get_it.dart';
import 'package:grpc/grpc.dart';
import '../providers/jwt_provider.dart';

class AuthInterceptor extends ClientInterceptor {
  JwtProvider _jwtProvider;

  AuthInterceptor({JwtProvider? jwtProvider})
      : _jwtProvider = jwtProvider ?? GetIt.I<JwtProvider>(),
        super();

  @override
  ResponseFuture<R> interceptUnary<Q, R>(
    ClientMethod<Q, R> method,
    Q request,
    CallOptions options,
    ClientUnaryInvoker<Q, R> invoker,
  ) {
    return super.interceptUnary(
      method,
      request,
      options.mergedWith(CallOptions(providers: [_authTokenProvider])),
      invoker,
    );
  }

  _authTokenProvider(Map<String, String> metadata, String uri) async {
    final token = await _jwtProvider.provide();
    metadata["authorization"] = token;
  }
}
