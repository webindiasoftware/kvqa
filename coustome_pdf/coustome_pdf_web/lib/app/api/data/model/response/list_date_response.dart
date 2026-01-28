import 'package:flutter/material.dart';

/// date_filter : {"start_date":null,"end_date":null}
/// data : [{"id":"17","date":"2026-01-08 00:00:00","createdBy":"6","project_id":"2","is_approve_mic":"pending","is_approve_sic":"pending","is_approve_pm":"pending","reject_reason":null,"createdAt":"2026-01-08 11:13:51","connect_with_diesel":true,"is_status":"pending","is_status_message":"Pending for MIC approval","edit_per":true,"delete_per":true},{"id":"16","date":"2026-01-08 00:00:00","createdBy":"12","project_id":"2","is_approve_mic":"pending","is_approve_sic":"pending","is_approve_pm":"pending","reject_reason":null,"createdAt":"2026-01-08 11:07:01","connect_with_diesel":true,"is_status":"pending","is_status_message":"Pending for MIC approval","edit_per":false,"delete_per":false},{"id":"15","date":"2026-01-08 00:00:00","createdBy":"12","project_id":"2","is_approve_mic":"pending","is_approve_sic":"pending","is_approve_pm":"pending","reject_reason":null,"createdAt":"2026-01-08 11:06:35","connect_with_diesel":true,"is_status":"pending","is_status_message":"Pending for MIC approval","edit_per":false,"delete_per":false},{"id":"14","date":"2026-01-08 00:00:00","createdBy":"6","project_id":"2","is_approve_mic":"pending","is_approve_sic":"pending","is_approve_pm":"pending","reject_reason":null,"createdAt":"2026-01-08 10:15:04","connect_with_diesel":true,"is_status":"pending","is_status_message":"Pending for MIC approval","edit_per":true,"delete_per":true},{"id":"13","date":"2026-01-08 00:00:00","createdBy":"6","project_id":"2","is_approve_mic":"pending","is_approve_sic":"pending","is_approve_pm":"pending","reject_reason":null,"createdAt":"2026-01-08 10:10:28","connect_with_diesel":true,"is_status":"pending","is_status_message":"Pending for MIC approval","edit_per":true,"delete_per":true}]
/// pagination : {"page":1,"limit":14,"total":5}

class ListDateResponse {
  ListDateResponse({
    DateFilter? dateFilter,
    List<ListDateResponseValue>? data,
    Pagination? pagination,
  }) {
    _dateFilter = dateFilter;
    _data = data;
    _pagination = pagination;
  }

  ListDateResponse.fromJson(dynamic json) {
    _dateFilter = json['date_filter'] != null
        ? DateFilter.fromJson(json['date_filter'])
        : json['filters'] != null
        ? DateFilter.fromJson(json['filters'])
        : null;
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(ListDateResponseValue.fromJson(v));
      });
    }

    if (json['list'] != null) {
      _data = [];
      json['list'].forEach((v) {
        _data?.add(ListDateResponseValue.fromJson(v));
      });
    }

    _pagination = json['pagination'] != null
        ? Pagination.fromJson(json['pagination'])
        : null;
  }

  DateFilter? _dateFilter;
  List<ListDateResponseValue>? _data;
  Pagination? _pagination;

  DateFilter? get dateFilter => _dateFilter;

  List<ListDateResponseValue>? get data => _data;

  Pagination? get pagination => _pagination;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_dateFilter != null) {
      map['date_filter'] = _dateFilter?.toJson();
    }
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    if (_pagination != null) {
      map['pagination'] = _pagination?.toJson();
    }
    return map;
  }
}

/// page : 1
/// limit : 14
/// total : 5

class Pagination {
  Pagination({int? page, int? limit, int? total}) {
    _page = page;
    _limit = limit;
    _total = total;
  }

  Pagination.fromJson(dynamic json) {
    _page = json['page'];
    _limit = json['limit'];
    _total = json['total'];
  }

  int? _page;
  int? _limit;
  int? _total;

  int? get page => _page;

  int? get limit => _limit;

  int? get total => _total;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = _page;
    map['limit'] = _limit;
    map['total'] = _total;
    return map;
  }
}

/// id : "17"
/// date : "2026-01-08 00:00:00"
/// createdBy : "6"
/// project_id : "2"
/// is_approve_mic : "pending"
/// is_approve_sic : "pending"
/// is_approve_pm : "pending"
/// reject_reason : null
/// createdAt : "2026-01-08 11:13:51"
/// connect_with_diesel : true
/// is_status : "pending"
/// is_status_message : "Pending for MIC approval"
/// edit_per : true
/// delete_per : true


class ListDateResponseValue {
  ListDateResponseValue({
    String? id,
    String? date,
    String? createdBy,
    String? projectId,
    String? isApproveMic,
    String? isApproveSic,
    String? isApprovePm,
    String? rejectReason,
    String? createdAt,
    bool? connectWithDiesel,
    bool? editPer,
    bool? deletePer,
    String? isStatus,
    String? isStatusMessage,
    int? itemCount,
    String? nextDate,
    String? actionPlanned,
    String? maintenanceLogNo, // Added
    String? equipmentName,    // Added
  }) {
    _id = id;
    _date = date;
    _createdBy = createdBy;
    _projectId = projectId;
    _isApproveMic = isApproveMic;
    _isApproveSic = isApproveSic;
    _isApprovePm = isApprovePm;
    _rejectReason = rejectReason;
    _createdAt = createdAt;
    _connectWithDiesel = connectWithDiesel;
    _editPer = editPer;
    _deletePer = deletePer;
    _isStatus = isStatus;
    _isStatusMessage = isStatusMessage;
    _itemCount = itemCount;
    _nextDate = nextDate;
    _actionPlanned = actionPlanned;
    _maintenanceLogNo = maintenanceLogNo; // Added
    _equipmentName = equipmentName;       // Added
  }

  ListDateResponseValue.fromJson(dynamic json) {
    _id = json['id'];
    _date = json['date'];
    _createdBy = json['createdBy'];
    _projectId = json['project_id'];
    _isApproveMic = json['is_approve_mic'];
    _isApproveSic = json['is_approve_sic'];
    _isApprovePm = json['is_approve_pm'];
    _rejectReason = json['reject_reason'];
    _createdAt = json['createdAt'];
    _connectWithDiesel = json['connect_with_diesel'];

    _editPer = json['edit_per'] is bool ? json['edit_per'] : false;
    _deletePer = json['delete_per'] is bool ? json['delete_per'] : false;

    _isStatus = json['is_status'];
    _isStatusMessage = json['is_status_message'];

    if (json['item_count'] != null) {
      _itemCount = int.tryParse(json['item_count'].toString());
    }

    _nextDate = json['next_date'];
    _actionPlanned = json['action_planned'];
    _maintenanceLogNo = json['maintenance_log_no']?.toString(); // Added
    _equipmentName = json['equipment_name']?.toString();       // Added
  }

  String? _id;
  String? _date;
  String? _createdBy;
  String? _projectId;
  String? _isApproveMic;
  String? _isApproveSic;
  String? _isApprovePm;
  String? _rejectReason;
  String? _createdAt;
  bool? _connectWithDiesel;
  bool? _editPer;
  bool? _deletePer;
  String? _isStatus;
  String? _isStatusMessage;
  int? _itemCount;
  String? _nextDate;
  String? _actionPlanned;
  String? _maintenanceLogNo; // Added
  String? _equipmentName;    // Added
  String? _filter;    // Added

  // Getters
  String? get id => _id;
  String? get date => _date;
  String? get createdBy => _createdBy;
  String? get projectId => _projectId;
  String? get isApproveMic => _isApproveMic;
  String? get isApproveSic => _isApproveSic;
  String? get isApprovePm => _isApprovePm;
  String? get rejectReason => _rejectReason;
  String? get createdAt => _createdAt;
  bool? get connectWithDiesel => _connectWithDiesel;
  bool? get editPer => _editPer ?? false;
  bool? get deletePer => _deletePer ?? false;
  String? get isStatus => _isStatus;
  String? get isStatusMessage => _isStatusMessage;
  int? get itemCount => _itemCount;
  String? get nextDate => _nextDate;
  String? get actionPlanned => _actionPlanned;
  String? get maintenanceLogNo => _maintenanceLogNo; // Added
  String? get equipmentName => _equipmentName;       // Added
  String? get filter => _filter;

  void setFilter(String sFilter){
    _filter = sFilter;
  }// Added

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['date'] = _date;
    map['createdBy'] = _createdBy;
    map['project_id'] = _projectId;
    map['is_approve_mic'] = _isApproveMic;
    map['is_approve_sic'] = _isApproveSic;
    map['is_approve_pm'] = _isApprovePm;
    map['reject_reason'] = _rejectReason;
    map['createdAt'] = _createdAt;
    map['connect_with_diesel'] = _connectWithDiesel;
    map['edit_per'] = _editPer;
    map['delete_per'] = _deletePer;
    map['is_status'] = _isStatus;
    map['is_status_message'] = _isStatusMessage;
    map['item_count'] = _itemCount;
    map['next_date'] = _nextDate;
    map['action_planned'] = _actionPlanned;
    map['maintenance_log_no'] = _maintenanceLogNo; // Added
    map['equipment_name'] = _equipmentName;       // Added
    return map;
  }

  Color get statusColor {
    switch (_isStatus?.toLowerCase()) {
      case 'pending':
        return Colors.amber.shade700;
      case 'approved':
        return Colors.green;
      case 'rejected':
        return Colors.red;
      case 'issue':
        return Colors.purple;
      default:
        return Colors.blue;
    }
  }
}

/// start_date : null
/// end_date : null

class DateFilter {
  DateFilter({
    bool? isDiesel,
    String? isReceipt,
    String? startDate,
    String? status,
    String? endDate,
  }) {
    _isReceipt = isReceipt;
    _isDiesel = isDiesel;
    _status = status;
    _startDate = startDate;
    _endDate = endDate;
  }

  DateFilter.fromJson(dynamic json) {
    _isDiesel = json['isDiesel'] ?? false;
    _isReceipt = json['isReceipt'].toString();
    _status = json['status'];
    _startDate = json['start_date'];
    _endDate = json['end_date'];
  }

  bool? _isDiesel;
  String? _status;
  String? _isReceipt;
  String? _startDate;
  String? _endDate;

  String? get isReceipt => _isReceipt;

  bool? get isDiesel => _isDiesel;

  String? get status => _status;

  String? get startDate => _startDate;

  String? get endDate => _endDate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['isReceipt'] = _isReceipt;
    map['isDiesel'] = _isDiesel;
    map['status'] = _status;
    map['start_date'] = _startDate;
    map['end_date'] = _endDate;
    return map;
  }
}
