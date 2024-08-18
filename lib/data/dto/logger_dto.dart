import '/domain/entity/logger.dart';

class LoggerDTO extends Logger {
  LoggerDTO({
    required super.method,
    required super.url,
    required super.code,
    super.body,
    required super.createdAt,
  });

  factory LoggerDTO.fromRaw(Map<String, dynamic> raw) =>
      LoggerDTO(
        method: raw['method'],
        url: raw['url'],
        code: raw['code'],
        body: raw['body'],
        createdAt: raw['created_at'],
      );

  Map<String, dynamic> toMap() => {
    'method': method,
    'url': url,
    'code': code,
    'body': body,
    'created_at': createdAt,
  };
}