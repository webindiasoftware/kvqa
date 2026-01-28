/*
 * Project      : gudbuks
 * File         : api_constants.dart
 * Description  : API constants and configuration
 * Author       : kannappan
 * Date         : 2025-12-05
 * Version      : 1.0
 * Ticket       : 
 */

import '../config/environment_manager.dart';

/// API constants
class ApiConstant {
  ApiConstant._();

  /// Base URL from environment configuration
  static String get baseUrl => EnvironmentManager.apiBaseUrl;

  /// API endpoints
  static const String loginWithOtp = '/login_with_project';
  static const String projectList = '/employee_project';

  static const String itemList = '/item_list_with_stock';
  static const String equipmentList = '/get_project_equipment';

  static const String createRequisition = '/create_requisition';
  static const String createReceipt = '/create_receipt';
  static const String createConsumption = '/create_consumption';
  static const String createMaintenance = '/create_maintenance_log';

  static const String updateRequisition = '/update_requisition';
  static const String updateReceipt = '/update_receipt';
  static const String updateConsumption = '/update_consumption';
  static const String updateMaintenance = '/update_maintenance_log';
  static const String materialOutConsumptionUpdate =
      '/create_diesel_receipt_by_requisition';
  static const String updateMaterialOutConsumptionUpdate = '/update_receipt';

  static const String requisitionList = '/req_list_by_diesellink';
  static const String dieselReceiptList = '/view-receipt';

  // static const String dieselReceiptList = '/view-receipt';
  static const String consumptionList = '/view_consumption';
  static const String maintenanceList = '/view_maintenance_log';
  static const String materialOutConsumption = '/material_out_store';
  static const String materialOutConsumptionList =
      '/view-material-out-consumption';
  static const String materialInOutList = '/material_in_list';

  // AppTextConstants.receipt
  static const String receiptList = '/receipt_list';
  static const String newReceiptList = '/view_receipt_list';

  static const String viewRequisition = '/view_requisition_with_ctrl';
  static const String viewReceipt = '/view-receipt-details';
  static const String viewConsumption = '/view_consumption_details';
  static const String viewMaintenance = '/maintenance_log_details';
  static const String viewMaintenanceOutConsumption =
      '/view_requisition_with_ctrl';
  static const String viewMaintenanceOutReceiptConsumption =
      '/view_material_out_details';

  static const String deleteRequisition = '/delete_requisition';
  static const String deleteReceipt = '/delete_receipt';
  static const String deleteConsumption = '/delete_consumption';
  static const String deleteMaintenance = '/delete_maintenance';

  static const String approveRejectDieselRequisition =
      '/approve_reject_diesel_requisition';
  static const String approveRejectDieselReceipt = '/approve_reject_receipt';
  static const String approveRejectDieselConsumption =
      '/approve_reject_consumption';
  static const String approveRejectMaintenance =
      '/approve_reject_maintenance_log';

  static const String approveRejectReceipt = '/accept_recieipt_item';
}
