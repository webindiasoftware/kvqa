///partha paul
///project_data
///08/01/26

/// project_id : 2
/// project_no : "MC-0008"
/// order_no : "9010039798"
/// assigned_on : "9010039798"
/// contract_start_date : "0000-00-00 00:00:00"
/// contract_end_date : "2032-12-21 18:30:00"
/// duration_days : null

class ProjectData {
  ProjectData({
    int? projectId,
    String? projectNo,
    String? orderNo,
    String? contractStartDate,
    String? contractEndDate,
    String? durationDays,
    String? assignedOn,}){
    _projectId = projectId;
    _projectNo = projectNo;
    _orderNo = orderNo;
    _contractStartDate = contractStartDate;
    _contractEndDate = contractEndDate;
    _durationDays = durationDays;
    _assignedOn = assignedOn;
  }

  ProjectData.fromJson(dynamic json) {
    _projectId = json['project_id'];
    _projectNo = json['project_no'];
    _orderNo = json['order_no'];
    _contractStartDate = json['contract_start_date'];
    _contractEndDate = json['contract_end_date'];
    _durationDays = json['duration_days'].toString();
    _assignedOn = json['assigned_on'];
  }
  int? _projectId;
  String? _projectNo;
  String? _orderNo;
  String? _contractStartDate;
  String? _contractEndDate;
  String? _durationDays;
  String? _assignedOn;


  int? get projectId => _projectId;
  String? get projectNo => _projectNo;
  String? get orderNo => _orderNo;
  String? get contractStartDate => _contractStartDate;
  String? get contractEndDate => _contractEndDate;
  String? get durationDays => _durationDays;
  String? get assignedOn => _assignedOn;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['project_id'] = _projectId;
    map['project_no'] = _projectNo;
    map['order_no'] = _orderNo;
    map['contract_start_date'] = _contractStartDate;
    map['contract_end_date'] = _contractEndDate;
    map['duration_days'] = _durationDays;
    map['assigned_on'] = _assignedOn;
    return map;
  }

}