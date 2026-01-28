/// permissions : {"isEdit":true,"isApprove":false}
/// requisition : {"id":13,"date":"2026-01-08 00:00:00","createdBy":6,"project_id":2,"mic_id":0,"mic_name":"Debojit Bhuyan","dic_id":0,"dic_name":"Debojit Bhuyan","pm_id":0,"pm_name":"Debojit Bhuyan","is_approve_mic":"pending","is_approve_sic":"pending","is_approve_pm":"pending","reject_reason":null,"createdAt":"2026-01-08 10:10:28","updatedAt":"0000-00-00 00:00:00"}
/// items : [{"id":24,"item_id":1,"quantity":"2","uom_id":4,"notes":"pp"}]

class ItemDetailsResponse {
  ItemDetailsResponse({
    Permissions? permissions,
    Requisition? requisition,
    List<ItemsData>? items,
  }) {
    _permissions = permissions;
    _requisition = requisition;
    _items = items;
  }

  ItemDetailsResponse.fromJson(dynamic json) {
    _permissions = json['permissions'] != null
        ? Permissions.fromJson(json['permissions'])
        : null;
    _requisition = json['requisition'] != null
        ? Requisition.fromJson(json['requisition'])
        : json['receipt'] != null
        ? Requisition.fromJson(json['receipt'])
        : json['consumption'] != null
        ? Requisition.fromJson(json['consumption'])
        : json['maintenance'] != null
        ? Requisition.fromJson(json['maintenance'])
        : null;
    if (json['items'] != null) {
      _items = [];
      json['items'].forEach((v) {
        _items?.add(ItemsData.fromJson(v));
      });
    }
  }

  Permissions? _permissions;
  Requisition? _requisition;
  List<ItemsData>? _items;

  Permissions? get permissions => _permissions;

  Requisition? get requisition => _requisition;

  List<ItemsData>? get items => _items;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_permissions != null) {
      map['permissions'] = _permissions?.toJson();
    }
    if (_requisition != null) {
      map['requisition'] = _requisition?.toJson();
    }
    if (_items != null) {
      map['items'] = _items?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : 24
/// item_id : 1
/// item_name: 1
/// equipment_id : 1
/// equipment_name: 1
/// quantity : "2"
/// uom_id : 4
/// notes : "pp"

class ItemsData {
  ItemsData({
    int? id,
    int? itemId,
    String? itemName,
    String? quantity,
    String? requestQty, // Added
    int? uomId,
    String? uomName,
    String? notes,
    int? equipmentId,
    String? equipmentName,
  }) {
    _id = id;
    _itemId = itemId;
    _itemName = itemName;
    _quantity = quantity;
    _requestQty = requestQty; // Added
    _uomId = uomId;
    _uomName = uomName;
    _notes = notes;
    _equipmentId = equipmentId;
    _equipmentName = equipmentName;
  }

  ItemsData.fromJson(dynamic json) {
    _id = json['id'];
    _itemId = json['item_id'];
    _itemName = json['item_name'];
    _quantity = json['quantity'].toString();
    _requestQty = json['request_qty']?.toString() ?? ""; // Added with empty string fallback
    _uomId = json['uom_id'];
    _uomName = json['uom_name'] ?? '__';
    _notes = json['notes'];
    _equipmentId = json['equipment_id'];
    _equipmentName = json['equipment_name'];
  }

  int? _id;
  int? _itemId;
  String? _itemName;
  String? _quantity;
  String? _requestQty; // Added
  int? _uomId;
  String? _uomName;
  String? _notes;
  int? _equipmentId;
  String? _equipmentName;

  int? get id => _id;
  int? get itemId => _itemId;
  String? get itemName => _itemName;
  String? get quantity => _quantity;
  String? get requestQty => _requestQty; // Added
  int? get uomId => _uomId;
  String? get uomName => _uomName;
  String? get notes => _notes;
  int? get equipmentId => _equipmentId;
  String? get equipmentName => _equipmentName;

  void setQua(String value) {
    _quantity = value;
  }

  void setRequestQty(String value) { // Added setter for request_qty
    _requestQty = value;
  }

  void setNotes(String value) {
    _notes = value;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['item_id'] = _itemId;
    map['item_name'] = _itemName;
    map['quantity'] = _quantity;
    map['request_qty'] = _requestQty; // Added
    map['uom_id'] = _uomId;
    map['uom_name'] = _uomName;
    map['notes'] = _notes;
    map['equipment_id'] = _equipmentId;
    map['equipment_name'] = _equipmentName;
    return map;
  }
}

/// id : 13
/// date : "2026-01-08 00:00:00"
/// createdBy : 6
/// project_id : 2
/// mic_id : 0
/// mic_name : "Debojit Bhuyan"
/// dic_id : 0
/// dic_name : "Debojit Bhuyan"
/// pm_id : 0
/// pm_name : "Debojit Bhuyan"
/// is_approve_mic : "pending"
/// is_approve_sic : "pending"
/// is_approve_pm : "pending"
/// reject_reason : null
/// createdAt : "2026-01-08 10:10:28"
/// updatedAt : "0000-00-00 00:00:00"
class Requisition {
  Requisition({
    String? id,
    String? date,
    String? createdBy,
    String? projectId,
    String? micId,
    String? micName,
    String? dicId,
    String? dicName,
    String? pmId,
    String? pmName,
    String? isApproveMic,
    String? isApproveSic,
    String? isApprovePm,
    String? rejectReason,
    String? createdAt,
    String? updatedAt,
    String? nextDate,
    String? equipment,
    String? equipmentName,
    String? actionPlanned,
    String? notes,
    String? maintenanceLogNo,
    String? maintenanceType,
    String? downtimeHrs,
    String? requisitionId,   // Added
    String? requisitionDate, // Added
  }) {
    _id = id;
    _date = date;
    _createdBy = createdBy;
    _projectId = projectId;
    _micId = micId;
    _micName = micName;
    _dicId = dicId;
    _dicName = dicName;
    _pmId = pmId;
    _pmName = pmName;
    _isApproveMic = isApproveMic;
    _isApproveSic = isApproveSic;
    _isApprovePm = isApprovePm;
    _rejectReason = rejectReason;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _nextDate = nextDate;
    _equipment = equipment;
    _equipmentName = equipmentName;
    _actionPlanned = actionPlanned;
    _notes = notes;
    _maintenanceLogNo = maintenanceLogNo;
    _maintenanceType = maintenanceType;
    _downtimeHrs = downtimeHrs;
    _requisitionId = requisitionId;     // Added
    _requisitionDate = requisitionDate; // Added
  }

  Requisition.fromJson(dynamic json) {
    _id = json['id'].toString();
    _date = json['date'].toString();
    _createdBy = json['createdBy'].toString();
    _projectId = json['project_id'].toString();
    _micId = json['mic_id'].toString();
    _micName = json['mic_name'].toString();
    _dicId = json['dic_id'].toString();
    _dicName = json['dic_name'].toString();
    _pmId = json['pm_id'].toString();
    _pmName = json['pm_name'].toString();
    _isApproveMic = (json['is_approve_mic'] ?? json['is_approved_mic']).toString();
    _isApproveSic = (json['is_approve_sic'] ?? json['is_approved_sic']).toString();
    _isApprovePm = (json['is_approve_pm'] ?? json['is_approved_pm']).toString();
    _rejectReason = json['reject_reason'].toString();
    _createdAt = json['createdAt'].toString();
    _updatedAt = json['updatedAt'].toString();
    _nextDate = json['next_date']?.toString();
    _equipment = json['equipment'] == null
        ? json['equipment_id'].toString()
        : json['equipment'].toString();
    _equipmentName = json['equipment_name']?.toString();
    _actionPlanned = json['action_planned']?.toString();
    _notes = json['notes']?.toString();
    _maintenanceLogNo = json['maintenance_log_no']?.toString();
    _maintenanceType = json['maintenance_type']?.toString();
    _downtimeHrs = json['downtime_hrs']?.toString();
    _requisitionId = json['requisition_id']?.toString() ?? "";     // Added
    _requisitionDate = json['requisition_date']?.toString() ?? ""; // Added
  }

  String? _id;
  String? _date;
  String? _createdBy;
  String? _projectId;
  String? _micId;
  String? _micName;
  String? _dicId;
  String? _dicName;
  String? _pmId;
  String? _pmName;
  String? _isApproveMic;
  String? _isApproveSic;
  String? _isApprovePm;
  String? _rejectReason;
  String? _createdAt;
  String? _updatedAt;
  String? _nextDate;
  String? _equipment;
  String? _equipmentName;
  String? _actionPlanned;
  String? _notes;
  String? _maintenanceLogNo;
  String? _maintenanceType;
  String? _downtimeHrs;
  String? _requisitionId;   // Added
  String? _requisitionDate; // Added

  // Getters
  String? get id => _id;
  String? get date => _date;
  String? get createdBy => _createdBy;
  String? get projectId => _projectId;
  String? get micId => _micId;
  String? get micName => _micName;
  String? get dicId => _dicId;
  String? get dicName => _dicName;
  String? get pmId => _pmId;
  String? get pmName => _pmName;
  String? get isApproveMic => _isApproveMic;
  String? get isApproveSic => _isApproveSic;
  String? get isApprovePm => _isApprovePm;
  String? get rejectReason => _rejectReason;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get nextDate => _nextDate;
  String? get equipment => _equipment;
  String? get equipmentName => _equipmentName;
  String? get actionPlanned => _actionPlanned;
  String? get notes => _notes;
  String? get maintenanceLogNo => _maintenanceLogNo;
  String? get maintenanceType => _maintenanceType;
  String? get downtimeHrs => _downtimeHrs;
  String? get requisitionId => _requisitionId;     // Added
  String? get requisitionDate => _requisitionDate; // Added

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['date'] = _date;
    map['createdBy'] = _createdBy;
    map['project_id'] = _projectId;
    map['mic_id'] = _micId;
    map['mic_name'] = _micName;
    map['dic_id'] = _dicId;
    map['dic_name'] = _dicName;
    map['pm_id'] = _pmId;
    map['pm_name'] = _pmName;
    map['is_approve_mic'] = _isApproveMic;
    map['is_approve_sic'] = _isApproveSic;
    map['is_approve_pm'] = _isApprovePm;
    map['reject_reason'] = _rejectReason;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['next_date'] = _nextDate;
    map['equipment'] = _equipment;
    map['equipment_name'] = _equipmentName;
    map['action_planned'] = _actionPlanned;
    map['notes'] = _notes;
    map['maintenance_log_no'] = _maintenanceLogNo;
    map['maintenance_type'] = _maintenanceType;
    map['downtime_hrs'] = _downtimeHrs;
    map['requisition_id'] = _requisitionId;     // Added
    map['requisition_date'] = _requisitionDate; // Added
    return map;
  }
}

/// isEdit : true
/// isApprove : false

class Permissions {
  Permissions({bool? isEdit, bool? isApprove, bool? isMechanicNode}) {
    _isMechanicNode = isMechanicNode;
    _isEdit = isEdit;
    _isApprove = isApprove;
  }

  Permissions.fromJson(dynamic json) {
    _isMechanicNode = json['isMechanicNode'];
    _isEdit = json['isEdit'];
    _isApprove = json['isApprove'];
  }

  bool? _isMechanicNode;
  bool? _isEdit;
  bool? _isApprove;

  bool? get isMechanicNode => _isMechanicNode;

  bool? get isEdit => _isEdit;

  bool? get isApprove => _isApprove;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['isMechanicNode'] = _isMechanicNode;
    map['isEdit'] = _isEdit;
    map['isApprove'] = _isApprove;
    return map;
  }
}
