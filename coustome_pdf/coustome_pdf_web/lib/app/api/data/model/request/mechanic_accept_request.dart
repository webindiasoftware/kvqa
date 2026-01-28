///partha paul
///mechanic_accept_request
///16/01/26
class MechanicAcceptRequest {
  MechanicAcceptRequest({
    String? receiptId,
    String? empId,
    String? mchNote,
  }) {
    _receiptId = receiptId;
    _empId = empId;
    _mchNote = mchNote;
  }

  // Private variables
  String? _receiptId;
  String? _empId;
  String? _mchNote;

  // Getters
  String? get receiptId => _receiptId;
  String? get empId => _empId;
  String? get mchNote => _mchNote;

  // fromJson factory to handle API responses
  MechanicAcceptRequest.fromJson(dynamic json) {
    _receiptId = json['receipt_id']?.toString();
    _empId = json['emp_id']?.toString();
    _mchNote = json['mch_note']?.toString();
  }

  // toJson method for API requests
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['receipt_id'] = _receiptId;
    map['emp_id'] = _empId;
    map['mch_note'] = _mchNote;
    return map;
  }
}