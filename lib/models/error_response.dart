class ErrorResponse {
  final bool Success;
  final String ErrorMsg;
  final String ErrorCode;

  ErrorResponse({
    required this.Success,
    required this.ErrorMsg,
    required this.ErrorCode,
  });
  factory ErrorResponse.fromJson(Map<String, dynamic> json) {
    return ErrorResponse(
      Success: json['success'],
      ErrorMsg: json['error_msg'],
      ErrorCode: json['error_code'],
    );
  }
}
