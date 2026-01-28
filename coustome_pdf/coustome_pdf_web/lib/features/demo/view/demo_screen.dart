import 'package:coustome_pdf_web/app/constants/app_image_assets_constants.dart';
import 'package:coustome_pdf_web/app/constants/app_text_constants.dart';
import 'package:coustome_pdf_web/features/demo/controller/demo_controller.dart';
import 'package:coustome_pdf_web/features/demo/view/page/formInput_field.dart';
import 'package:coustome_pdf_web/features/demo/view/page/table_row_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:coustome_pdf_web/app/constants/app_color_constants.dart';
import 'package:focus_detector/focus_detector.dart';
import 'package:google_fonts/google_fonts.dart';

/// Splash page - initial screen
class DemoScreen extends GetView<DemoController> {
  const DemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        backgroundColor: AppColorConstants.appBackground,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(1.sp),
          child: AppBar(
            backgroundColor: AppColorConstants.appBackground,
            elevation: 0,
          ),
        ),
        body: FocusDetector(
          onVisibilityGained: () async {},
          onVisibilityLost: () {},
          child: fullWebView(),
        ),
      ),
    );
  }

  Widget fullWebView() {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 150.w, vertical: 50.h),
      child: Container(
        padding: EdgeInsets.all(45.sp),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 1.sp),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            Row(
              children: [
                Image.asset(AppImageAssetsConstants.demoLogo, width: 100.w),
                // Placeholder logo
                SizedBox(width: 20.w),
                Expanded(
                  child: Text(
                    AppTextConstants.questionnaireTitle,
                    style: GoogleFonts.poppins(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30.h),
            Text(
              AppTextConstants.instructionText,
              style: GoogleFonts.poppins(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              AppTextConstants.proposalNote,
              style: GoogleFonts.poppins(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30.h),

            // Form Table Implementation
            TableRowWidget(
              label: AppTextConstants.certStandardHeader,
              isHeader: true,
              inputWidget: Text(
                AppTextConstants.certStandardValue,
                style: GoogleFonts.poppins(fontSize: 13.sp),
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 8.h),
              color: Colors.grey.shade200,
              child: Center(
                child: Text(
                  AppTextConstants.facilityDetailHeader,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),

            // Dynamic Form Rows
            TableRowWidget(
              label: AppTextConstants.facilityName,
              inputWidget: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ),
            TableRowWidget(
              label: AppTextConstants.address,
              inputWidget: TextFormField(
                maxLines: 3,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ),
            TableRowWidget(
              label: AppTextConstants.mgmtRep,
              inputWidget: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ),
            TableRowWidget(
              label: AppTextConstants.phone,
              inputWidget: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ),
            TableRowWidget(
              label: AppTextConstants.fax,
              inputWidget: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ),

            TableRowWidget(
              label: AppTextConstants.email,
              inputWidget: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ),
            TableRowWidget(
              label: AppTextConstants.website,
              inputWidget: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ),

            // Dropdowns as per document
            TableRowWidget(
              label: AppTextConstants.ownershipType,
              inputWidget: CustomDropdown(
                items: ["Partnership", "Corporation", "Private Ownership"],
                value: controller.ownershipType,
              ),
            ),

            TableRowWidget(
              label: AppTextConstants.ownerContact,
              inputWidget: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ),

            TableRowWidget(
              label: AppTextConstants.buildingCount,
              inputWidget: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ),
            TableRowWidget(
              label: AppTextConstants.shiftWork,
              inputWidget: TextFormField(
                maxLines: 2,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ),
            TableRowWidget(
              label: AppTextConstants.headOffice,
              inputWidget: TextFormField(
                maxLines: 2,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ),
            TableRowWidget(
              label: AppTextConstants.statutoryCompliance,
              inputWidget: TextFormField(
                maxLines: 2,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ),

            TableRowWidget(
              label: AppTextConstants.healthSafety,
              inputWidget: CustomDropdown(
                items: ["Yes", "No"],
                value: controller.healthSafety,
              ),
            ),
            TableRowWidget(
              label: AppTextConstants.otherFacilities,
              inputWidget: CustomDropdown(
                items: ["Yes", "No"],
                value: controller.healthSafety,
              ),
            ),
            TableRowWidget(
              label: AppTextConstants.workerStrike,
              inputWidget: CustomDropdown(
                items: ["Yes", "No"],
                value: controller.healthSafety,
              ),
            ),

            TableRowWidget(
              label: AppTextConstants.labelFacilitySize,
              inputWidget: TextFormField(
                maxLines: 3,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ),

            TableRowWidget(
              label: AppTextConstants.labelTotalEmployees,
              inputWidget: TextFormField(
                maxLines: 1,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ),

            TableRowWidget(
              label: AppTextConstants.labelSalariedEmployees,
              inputWidget: TextFormField(
                maxLines: 1,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ),
            TableRowWidget(
              label: AppTextConstants.labelNonSalariedEmployees,
              inputWidget: TextFormField(
                maxLines: 1,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ),
            TableRowWidget(
              label: AppTextConstants.labelTempEmployees,
              inputWidget: TextFormField(
                maxLines: 1,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ),

            SizedBox(height: 20.sp),
            _buildDocumentInfoTable(),
            SizedBox(height: 20.sp),

            // Submit/Next Button
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {
                  controller.generateAndDownloadKAF01();
                },
                // style: ElevatedButton.styleFrom(
                //   backgroundColor: Colors.blue.shade900,
                //   padding: EdgeInsets.symmetric(
                //     horizontal: 50.w,
                //     vertical: 20.h,
                //   ),
                // ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[200],
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                child: Text(
                  AppTextConstants.btnNextPage,
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDocumentInfoTable() {
    return Table(
      border: TableBorder.all(color: Colors.grey),
      columnWidths: const {
        0: FlexColumnWidth(1),
        1: FlexColumnWidth(1),
        2: FlexColumnWidth(1),
        3: FlexColumnWidth(0.5),
        4: FlexColumnWidth(1),
        5: FlexColumnWidth(0.5),
      },
      children: [
        _buildInfoRow(["Document Name:", "Application Form", "Edition No.", "01", "Revision No.", "01"]),
        _buildInfoRow(["Document No.", "KAF-01", "Issue Date:", "1.09.2021", "Revision Date:", "07.06.2027"]),
      ],
    );
  }

  TableRow _buildInfoRow(List<String> cells) {
    return TableRow(
      children: cells.map((text) => Padding(
        padding: const EdgeInsets.all(6.0),
        child: Text(text, style:  TextStyle(fontSize: 12.sp)),
      )).toList(),
    );
  }
}
