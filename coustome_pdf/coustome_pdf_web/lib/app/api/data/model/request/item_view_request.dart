/// emp_id : 6
/// requisition_id : 13

class ItemViewRequest {
  ItemViewRequest({
    String? empId,
    String? referenceId,
    String? filter,
    String? referenceType, // requisition | receipt | consumption | maintenance
  }) {
    _empId = empId;
    _referenceId = referenceId;
    _referenceType = referenceType;
    _filter = filter;
  }

  String? _empId;
  String? _referenceId;
  String? _referenceType;
  String? _filter;

  String? get empId => _empId;
  String? get referenceId => _referenceId;
  String? get referenceType => _referenceType;
  String? get filter => _filter;

  void setFilter(String sFilter){
    _filter = sFilter;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['emp_id'] = _empId;

    switch (_referenceType) {
      case 'requisition':
        map['requisition_id'] = _referenceId;
        break;
      case 'receipt':
        map['receipt_id'] = _referenceId;
        break;
      case 'consumption':
        map['consumption_id'] = _referenceId;
        break;
      case 'maintenance':
        map['maintenance_id'] = _referenceId;
        break;
    }

    return map;
  }
}

