class ServerException implements Exception {
  final String message;
  final int? statusCode;
  final dynamic error;

  ServerException({
    this.message = 'Server error occurred',
    this.statusCode,
    this.error,
  });

  @override
  String toString() {
    return 'ServerException: $message${statusCode != null ? ' (Status: $statusCode)' : ''}';
  }
}

class NetworkException implements Exception {
  final String message;
  final dynamic error;

  NetworkException({
    this.message = 'Network error occurred',
    this.error,
  });

  @override
  String toString() {
    return 'NetworkException: $message';
  }
}

class CacheException implements Exception {
  final String message;
  final dynamic error;

  CacheException({
    this.message = 'Cache error occurred',
    this.error,
  });

  @override
  String toString() {
    return 'CacheException: $message';
  }
}

class AuthException implements Exception {
  final String message;
  final dynamic error;

  AuthException({
    this.message = 'Authentication error occurred',
    this.error,
  });

  @override
  String toString() {
    return 'AuthException: $message';
  }
}

class ValidationException implements Exception {
  final String message;
  final Map<String, List<String>>? errors;

  ValidationException({
    this.message = 'Validation error occurred',
    this.errors,
  });

  @override
  String toString() {
    return 'ValidationException: $message${errors != null ? '\nErrors: $errors' : ''}';
  }
}

class NotFoundException implements Exception {
  final String message;
  final String? resource;

  NotFoundException({
    this.message = 'Resource not found',
    this.resource,
  });

  @override
  String toString() {
    return 'NotFoundException: $message${resource != null ? ' ($resource)' : ''}';
  }
}

class UnauthorizedException implements Exception {
  final String message;

  UnauthorizedException({
    this.message = 'Unauthorized access',
  });

  @override
  String toString() {
    return 'UnauthorizedException: $message';
  }
}

class ForbiddenException implements Exception {
  final String message;

  ForbiddenException({
    this.message = 'Access forbidden',
  });

  @override
  String toString() {
    return 'ForbiddenException: $message';
  }
}

class ConflictException implements Exception {
  final String message;
  final String? resource;

  ConflictException({
    this.message = 'Resource conflict',
    this.resource,
  });

  @override
  String toString() {
    return 'ConflictException: $message${resource != null ? ' ($resource)' : ''}';
  }
}

class BadRequestException implements Exception {
  final String message;
  final Map<String, dynamic>? errors;

  BadRequestException({
    this.message = 'Bad request',
    this.errors,
  });

  @override
  String toString() {
    return 'BadRequestException: $message${errors != null ? '\nErrors: $errors' : ''}';
  }
}