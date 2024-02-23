class ServiceError {
  final RequestError error;
  final String message;

  ServiceError(this.error, this.message);

  factory ServiceError.fromDecodedBody(
      int defaultStatusCode, Map<String, dynamic> decodedResponse) {
    final statusCode =
    getStatusCodeFromResponse(defaultStatusCode, decodedResponse);
    final statusError = StatusErrorMatcher.get(statusCode);
    final errorMessage = getMessageFromDecodedResponse(decodedResponse);
    return ServiceError(statusError, errorMessage);
  }
}

enum RequestError {
  unAuthorized,
  internalServerError,
  unknown,
  failureMessage,
  noInternet
}

extension StatusErrorMatcher on RequestError {
  static RequestError get(int statusCode) {
    switch (statusCode) {
      case (400):
        return RequestError.failureMessage;
      case (404):
        return RequestError.failureMessage;
      case (500):
        return RequestError.internalServerError;
      case (503):
        return RequestError.internalServerError;
      case (401):
        return RequestError.unAuthorized;
      case (403):
        return RequestError.unAuthorized;
      default:
        return RequestError.unknown;
    }
  }
}
int getStatusCodeFromResponse(
    int defaultStatusCode, Map<String, dynamic> decodedResponse) {
  if (decodedResponse['statusCode'] != null) {
    return decodedResponse['statusCode'];
  } else {
    return defaultStatusCode;
  }
}

getAuthenticationStatusOnFailure(Map<String, dynamic> decodedResponse) {
  if (decodedResponse['result'] != null &&
      decodedResponse['result'] is Map &&
      decodedResponse['result']['isAuthenticated'] != null) {
    return decodedResponse;
  }
}

String getMessageFromDecodedResponse(Map<String, dynamic> decodedResponse) {
  if (decodedResponse['result'] != null &&
      decodedResponse['result'] is Map &&
      decodedResponse['result']['message'] != null) {
    return decodedResponse['result']['message'];
  } else if (decodedResponse['message'] != null) {
    return decodedResponse['message'];
  }
  return '';
}
