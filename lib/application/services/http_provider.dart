import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/application/services/http_service.dart';

final httpProvider = Provider<HttpService>((ref) => DioHttpService());
