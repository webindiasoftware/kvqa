import 'package:coustome_pdf_web/app/api/data/model/response/project_data.dart';

/// online : true
/// emp_id : 5
/// emp_name : "Jayanta Baruah"
/// projects : [{"project_id":2,"project_no":"MC-0008","assigned_on":"2025-12-29 17:25:00"}]

class ProjectListResponse {
  ProjectListResponse({
    bool? online,
    int? empId,
    String? empName,
    List<ProjectData>? projects,}){
    _online = online;
    _empId = empId;
    _empName = empName;
    _projects = projects;
  }

  ProjectListResponse.fromJson(dynamic json) {
    _online = json['online'];
    _empId = json['emp_id'];
    _empName = json['emp_name'];
    if (json['projects'] != null) {
      _projects = [];
      json['projects'].forEach((v) {
        _projects?.add(ProjectData.fromJson(v));
      });
    }
  }
  bool? _online;
  int? _empId;
  String? _empName;
  List<ProjectData>? _projects;

  bool? get online => _online;
  int? get empId => _empId;
  String? get empName => _empName;
  List<ProjectData>? get projects => _projects;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['online'] = _online;
    map['emp_id'] = _empId;
    map['emp_name'] = _empName;
    if (_projects != null) {
      map['projects'] = _projects?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}
