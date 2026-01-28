/// emp_id : ""
/// project_id : ""
/// page : ""
/// limit : ""

class RequisitionRequest {
  RequisitionRequest({
    String? empId,
    String? projectId,
    String? page,
    String? limit,
    String? filter,
    bool? isDiesel, // Added
    String? startDate, // Added
    String? endDate, // Added
  }) {
    _empId = empId;
    _projectId = projectId;
    _page = page;
    _limit = limit;
    _filter = filter;
    _isDiesel = isDiesel;
    _startDate = startDate;
    _endDate = endDate;
  }

  RequisitionRequest.fromJson(dynamic json) {
    _empId = json['emp_id'];
    _projectId = json['project_id'];
    _page = json['page'];
    _limit = json['limit'];
    _filter = json['filter'];
    _isDiesel = json['isDiesel']; // Matches your provided JSON key
    _startDate = json['start_date']; // Matches your provided JSON key
    _endDate = json['end_date']; // Matches your provided JSON key
  }

  String? _empId;
  String? _projectId;
  String? _page;
  String? _limit;
  String? _filter;
  bool? _isDiesel;
  String? _startDate;
  String? _endDate;
  String? _dataType;

  String? get empId => _empId;

  String? get projectId => _projectId;

  String? get page => _page;

  String? get limit => _limit;

  String? get filter => _filter;

  bool? get isDiesel => _isDiesel;

  String? get startDate => _startDate;

  String? get endDate => _endDate;

  String? get dataType => _dataType;

  void setDataType(String sDataType) {
    _dataType = sDataType;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['emp_id'] = _empId;
    map['project_id'] = _projectId;
    map['page'] = _page;
    map['limit'] = _limit;
    map['filter'] = _filter;
    map['isDiesel'] = _isDiesel;
    map['start_date'] = _startDate;
    map['end_date'] = _endDate;
    if (_dataType != null) {
      map['data_type'] = _dataType;
    }
    return map;
  }
}
