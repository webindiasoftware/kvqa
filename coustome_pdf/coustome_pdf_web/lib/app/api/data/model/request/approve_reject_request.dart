/// requisition_id : 21
/// emp_id : 5
/// role : "mic"
/// action : "reject"//approve
/// reject_reason : "Quantity mismatch"
///receipt_id:21


class ApproveRejectRequest {
  ApproveRejectRequest({
    String? referenceId,
    String? referenceType, // requisition | receipt | consumption | maintenance
    String? empId,
    String? role,
    String? action,
    String? rejectReason,
  }) {
    _referenceId = referenceId;
    _referenceType = referenceType;
    _empId = empId;
    _role = role;
    _action = action;
    _rejectReason = rejectReason;
  }

  String? _referenceId;
  String? _referenceType;
  String? _empId;
  String? _role;
  String? _action;
  String? _rejectReason;

  String? get referenceId => _referenceId;
  String? get referenceType => _referenceType;
  String? get empId => _empId;
  String? get role => _role;
  String? get action => _action;
  String? get rejectReason => _rejectReason;

  ApproveRejectRequest.fromJson(Map<String, dynamic> json) {
    _referenceId = json['reference_id'];
    _referenceType = json['reference_type'];
    _empId = json['emp_id'];
    _role = json['role'];
    _action = json['action'];
    _rejectReason = json['reject_reason'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};

    // 🔑 send correct id key based on type
    switch (_referenceType) {
      case 'requisition':
        map['requisition_id'] = _referenceId;
        break;
      case 'receipt':
        map['receipt_id'] = _referenceId;
        break;
      case 'consumption':
        map['consumption_sheet_id'] = _referenceId;
        break;
      case 'maintenance':
        map['maintenance_sheet_id'] = _referenceId;
        break;
    }

    map['emp_id'] = _empId;
    map['role'] = _role;
    map['action'] = _action;

    if (_rejectReason != null && _rejectReason!.isNotEmpty) {
      map['reject_reason'] = _rejectReason;
    }

    return map;
  }
}
