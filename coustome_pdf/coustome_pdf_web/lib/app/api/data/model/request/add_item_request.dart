/// date : "2026-01-07"
/// emp_id : 5
/// org_id : 1
/// project_id : 3
/// items : [{"item_id":2,"quantity":50,"uom_id":1,"notes":"Generator usage"},{"item_id":3,"quantity":10,"uom_id":1,"notes":"Vehicle use"}]


class AddItemRequest {
  AddItemRequest({
    String? referenceId,
    String? referenceType,
    String? date,
    String? empId,
    String? orgId,
    String? projectId,
    List<Items>? items,
    String? equipment,
    String? equipmentName,
    String? notes,
    String? nextDate,
    String? actionPlanned,
    String? maintenanceLogNo, // Added
    String? maintenanceType,  // Added
    String? downtimeHrs,      // Added
  }) {
    _referenceId = referenceId;
    _referenceType = referenceType;
    _date = date;
    _empId = empId;
    _orgId = orgId;
    _projectId = projectId;
    _items = items;
    _equipment = equipment;
    _equipmentName = equipmentName;
    _notes = notes;
    _nextDate = nextDate;
    _actionPlanned = actionPlanned;
    _maintenanceLogNo = maintenanceLogNo; // Added
    _maintenanceType = maintenanceType;   // Added
    _downtimeHrs = downtimeHrs;           // Added
  }

  String? _referenceId;
  String? _referenceType;
  String? _date;
  String? _empId;
  String? _orgId;
  String? _projectId;
  List<Items>? _items;
  String? _equipment;
  String? _equipmentName;
  String? _notes;
  String? _nextDate;
  String? _actionPlanned;
  String? _maintenanceLogNo; // Added
  String? _maintenanceType;   // Added
  String? _downtimeHrs;       // Added

  // Getters
  String? get referenceId => _referenceId;
  String? get referenceType => _referenceType;
  String? get date => _date;
  String? get empId => _empId;
  String? get orgId => _orgId;
  String? get projectId => _projectId;
  List<Items>? get items => _items;
  String? get equipment => _equipment;
  String? get equipmentName => _equipmentName;
  String? get notes => _notes;
  String? get nextDate => _nextDate;
  String? get actionPlanned => _actionPlanned;
  String? get maintenanceLogNo => _maintenanceLogNo; // Added
  String? get maintenanceType => _maintenanceType;   // Added
  String? get downtimeHrs => _downtimeHrs;           // Added

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};

    // 🔑 send correct id key
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

    map['date'] = _date;
    map['emp_id'] = _empId;
    map['org_id'] = _orgId;
    map['project_id'] = _projectId;

    // Existing maintenance fields
    if (_equipment != null) map['equipment'] = _equipment;
    if (_equipmentName != null) map['equipment_name'] = _equipmentName;
    if (_notes != null) map['notes'] = _notes;
    if (_nextDate != null) map['next_date'] = _nextDate;
    if (_actionPlanned != null) map['action_planned'] = _actionPlanned;
    if (_maintenanceLogNo != null) map['maintenance_log_no'] = _maintenanceLogNo;
    if (_maintenanceType != null) map['maintenance_type'] = _maintenanceType;
    if (_downtimeHrs != null) map['downtime_hrs'] = _downtimeHrs;

    //item
    if (_items != null && _items!.isNotEmpty) {
      map['items'] = _items!.map((v) => v.toJson()).toList();
    }

    return map;
  }
}

/// equipment_id : 2
/// item_id : 2
/// quantity : 50
/// uom_id : 1
/// notes : "Generator usage"

class Items {
  Items({
    String? itemId,
    String? quantity,
    String? uomId,
    String? notes,
    String? equipmentId,
  }) {
    _itemId = itemId;
    _quantity = quantity;
    _uomId = uomId;
    _notes = notes;
    _equipmentId = equipmentId;
  }

  Items.fromJson(Map<String, dynamic> json) {
    _itemId = json['item_id'];
    _quantity = json['quantity'];
    _uomId = json['uom_id'];
    _notes = json['notes'];
    _equipmentId = json['equipment_id'];
  }

  String? _itemId;
  String? _quantity;
  String? _uomId;
  String? _notes;
  String? _equipmentId;

  String? get itemId => _itemId;
  String? get quantity => _quantity;
  String? get uomId => _uomId;
  String? get notes => _notes;
  String? get equipmentId => _equipmentId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};

    map['item_id'] = _itemId;
    map['quantity'] = _quantity;
    map['uom_id'] = _uomId;

    if (_notes != null && _notes!.isNotEmpty) {
      map['notes'] = _notes;
    }

    // 🔹 Send equipment_id only if available
    if (_equipmentId != null && _equipmentId!.isNotEmpty) {
      map['equipment_id'] = _equipmentId;
      map['equipment'] = _equipmentId;
    }

    return map;
  }
}

