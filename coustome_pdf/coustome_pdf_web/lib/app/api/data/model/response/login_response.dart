import 'package:coustome_pdf_web/app/api/data/model/response/project_data.dart';

/// id : 5
/// emp_id : "MCI0550"
/// emp_name : "Jayanta Baruah"
/// role_id : 9
/// role_name : "STORES"
/// org_id : 1
/// org_name : "Maco Corporation (India) Pvt Ltd"
/// token : "60f18db0ff0ea06cc84d1fd873946b1bd0ad8b573aec62c6d0b3a53c22617b6e"
/// project : {"project_id":2,"project_no":"MC-0008","order_no":"9010039798","contract_start_date":"0000-00-00 00:00:00","contract_end_date":"2032-12-21 18:30:00","duration_days":null}

class LoginResponse {
  LoginResponse({
    int? id,
    String? empId,
    String? empName,
    int? roleId,
    String? roleName,
    int? orgId,
    String? orgName,
    String? token,
    ProjectData? project,}){
    _id = id;
    _empId = empId;
    _empName = empName;
    _roleId = roleId;
    _roleName = roleName;
    _orgId = orgId;
    _orgName = orgName;
    _token = token;
    _project = project;
  }

  LoginResponse.fromJson(dynamic json) {
    _id = json['id'];
    _empId = json['emp_id'];
    _empName = json['emp_name'];
    _roleId = json['role_id'];
    _roleName = json['role_name'];
    _orgId = json['org_id'];
    _orgName = json['org_name'];
    _token = json['token'];
    _project = json['project'] != null ? ProjectData.fromJson(json['project']) : null;
  }
  int? _id;
  String? _empId;
  String? _empName;
  int? _roleId;
  String? _roleName;
  int? _orgId;
  String? _orgName;
  String? _token;
  ProjectData? _project;

  int? get id => _id;
  String? get empId => _empId;
  String? get empName => _empName;
  int? get roleId => _roleId;
  String? get roleName => _roleName;
  int? get orgId => _orgId;
  String? get orgName => _orgName;
  String? get token => _token;
  ProjectData? get project => _project;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['emp_id'] = _empId;
    map['emp_name'] = _empName;
    map['role_id'] = _roleId;
    map['role_name'] = _roleName;
    map['org_id'] = _orgId;
    map['org_name'] = _orgName;
    map['token'] = _token;
    if (_project != null) {
      map['project'] = _project?.toJson();
    }
    return map;
  }

}

