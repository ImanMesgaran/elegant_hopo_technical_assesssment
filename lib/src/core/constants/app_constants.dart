/// {@template app_constants}
/// Constants used throughout the application.
/// {@endtemplate}
class AppConstants {
  /// {@macro app_constants}
  const AppConstants._();

  /// The application name.
  static const String appName = 'Technical Challenge';

  /// The application description.
  static const String appDescription = 'Elegant Hopo Challenge';

  /// The application version.
  static const String appVersion = '1.0.0';

  /// The application build number.
  static const int appBuildNumber = 1;

  /// The organization identifier.
  static const String organizationId = 'com.eleganthopo.app';

  /// The default animation duration in milliseconds.
  static const int defaultAnimationDuration = 300;

  /// The default debounce duration in milliseconds.
  static const int defaultDebounceDuration = 500;

  /// The default timeout duration in seconds.
  static const int defaultTimeoutDuration = 30;

  /// The maximum number of retry attempts.
  static const int maxRetryAttempts = 3;

  /// The default page size for pagination.
  static const int defaultPageSize = 20;

  /// The maximum page size for pagination.
  static const int maxPageSize = 100;
}
