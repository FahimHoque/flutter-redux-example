import 'dart:developer';

enum RequestType { requested, succeeded, failed }

class ActionUtility {
  static String getKey(String type) {
    for (var i = 0; i < RequestType.values.length; i++) {
      if (RequestType.values[i].toString() == type) {
        return RequestType.values[i].toString();
      }
    }
    return type;
  }

  static RequestType getRequestType(String type) {
    log('getRequestType: $type');
    if (type.contains('Requested')) {
      return RequestType.requested;
    } else if (type.contains('Succeeded')) {
      return RequestType.succeeded;
    } else if (type.contains('Failed')) {
      return RequestType.failed;
    }
    return RequestType.requested;
  }

  static bool getDone(String type) {
    return getRequestType(type) == RequestType.succeeded ||
        getRequestType(type) == RequestType.failed;
  }

  static bool getNonSucessful(String type) {
    return getRequestType(type) == RequestType.failed ||
        getRequestType(type) == RequestType.requested;
  }

  static bool getLoading(String type) {
    return getRequestType(type) == RequestType.requested;
  }

  static bool getSuccessful(String type) {
    return getRequestType(type) == RequestType.succeeded;
  }

  static bool getFailed(String type) {
    return getRequestType(type) == RequestType.failed;
  }

  static String getBuildType(String type) {
    if (getRequestType(type) == RequestType.requested) {
      return 'REQUESTED';
    } else if (getRequestType(type) == RequestType.succeeded) {
      return 'SUCCEEDED';
    } else if (getRequestType(type) == RequestType.failed) {
      return 'FAILED';
    }
    return 'UNKNOWN';
  }
}
