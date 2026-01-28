/*
 * Project      : gudbuks
 * File         : login_request.dart
 * Description  : Request model for OTP request
 * Author       : kannappan
 * Date         : 2025-12-05
 * Version      : 1.0
 * Ticket       : 
 */

/// Request model for requesting OTP
class LoginRequest {
  final String empId;
  final String password;

  LoginRequest({required this.empId, required this.password});

  /// Convert to JSON
  Map<String, dynamic> toJson() {
    return {'emp_id': empId, 'password': password};
  }

  @override
  String toString() => 'RequestOtpRequest(emp_id: $empId,password: $password)';
}
