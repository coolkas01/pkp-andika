typedef Loggers = List<Logger>;

class Logger {
  Logger({
    required this.method,
    required this.url,
    required this.code,
    this.body = '',
    required this.createdAt,
  });

  final String method;
  final String url;
  final int code;
  final String body;
  final String createdAt;
}