/// item_date : [{"id":1,"item_code":"I-00001","item_name":"Diesel ","item_description":"Diesel ","item_group_name":"Diesel","item_make_name":"IOL","unit_of_measurement_name":"LTR","item_qty_in_hand":0,"connect_with_diesel":1}]

class ItemListResponse {
  ItemListResponse({List<ItemDate>? itemDate}) {
    _itemDate = itemDate;
  }

  ItemListResponse.fromJson(dynamic json) {
    if (json['value'] != null) {
      _itemDate = [];
      json['value'].forEach((v) {
        _itemDate?.add(ItemDate.fromJson(v));
      });
    }
  }

  List<ItemDate>? _itemDate;

  List<ItemDate>? get itemDate => _itemDate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_itemDate != null) {
      map['value'] = _itemDate?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : 1
/// item_code : "I-00001"
/// item_name : "Diesel "
/// item_description : "Diesel "
/// item_group_name : "Diesel"
/// item_make_name : "IOL"
/// unit_of_measurement_name : "LTR"
/// item_qty_in_hand : 0
/// connect_with_diesel : 1
/// uom_id : 1

class ItemDate {
  ItemDate({
    String? id,
    String? itemCode,
    String? itemName,
    String? itemDescription,
    String? itemGroupName,
    String? itemMakeName,
    String? unitOfMeasurementName,
    String? uomId,
    String? itemQtyInHand, // Changed from int? to String?
    int? connectWithDiesel,
  }) {
    _id = id;
    _itemCode = itemCode;
    _itemName = itemName;
    _itemDescription = itemDescription;
    _itemGroupName = itemGroupName;
    _itemMakeName = itemMakeName;
    _unitOfMeasurementName = unitOfMeasurementName;
    _uomId = uomId;
    _itemQtyInHand = itemQtyInHand;
    _connectWithDiesel = connectWithDiesel;
  }

  ItemDate.fromJson(dynamic json) {
    _id = json['id'].toString();
    _itemCode = json['item_code'];
    _itemName = json['item_name'];
    _itemDescription = json['item_description'];
    _itemGroupName = json['item_group_name'];
    _itemMakeName = json['item_make_name'];
    _unitOfMeasurementName = json['unit_of_measurement_name'];
    _uomId = json['uom_id']?.toString();
    // 🔑 Safely convert to string, defaulting to empty string if null
    _itemQtyInHand = json['stock_in_hand']?.toString() ?? "";
    _connectWithDiesel = json['connect_with_diesel'];
  }

  String? _id;
  String? _itemCode;
  String? _itemName;
  String? _itemDescription;
  String? _itemGroupName;
  String? _itemMakeName;
  String? _unitOfMeasurementName;
  String? _uomId;
  String? _itemQtyInHand; // Changed type
  int? _connectWithDiesel;

  String? get id => _id;
  String? get itemCode => _itemCode;
  String? get itemName => _itemName;
  String? get itemDescription => _itemDescription;
  String? get itemGroupName => _itemGroupName;
  String? get itemMakeName => _itemMakeName;
  String? get unitOfMeasurementName => _unitOfMeasurementName;
  String? get uomId => _uomId;
  String? get itemQtyInHand => _itemQtyInHand; // Changed type
  int? get connectWithDiesel => _connectWithDiesel;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['item_code'] = _itemCode;
    map['item_name'] = _itemName;
    map['item_description'] = _itemDescription;
    map['item_group_name'] = _itemGroupName;
    map['item_make_name'] = _itemMakeName;
    map['unit_of_measurement_name'] = _unitOfMeasurementName;
    map['uom_id'] = _uomId;
    map['stock_in_hand'] = _itemQtyInHand;
    map['connect_with_diesel'] = _connectWithDiesel;
    return map;
  }
}
