import 'package:erobot_mobile/constants/api_constant.dart';

class Environment {
  final String env;
  final String url;

  Environment({
    required this.env,
    required this.url,
  });

  static const String PRODUCTION = 'prod';
  static const String QAS = 'QAS';
  static const String DEV = 'dev';
  static const String LOCAL = 'local';
}

class ConfigEnvironments {
  static final String _currentEnvironments = ApiConstant.env;
  static final List<Environment> _availableEnvironments = [
    Environment(
      env: Environment.LOCAL,
      url: 'http://localhost:8080/api/',
    ),
    Environment(
      env: Environment.DEV,
      url: ApiConstant.baseUrl,
    ),
    Environment(
      env: Environment.QAS,
      url: ApiConstant.baseUrl,
    ),
    Environment(
      env: Environment.PRODUCTION,
      url: ApiConstant.baseUrl,
    )
  ];

  static Environment getEnvironments() {
    return _availableEnvironments.firstWhere(
      (d) => d.env == _currentEnvironments,
    );
  }
}
