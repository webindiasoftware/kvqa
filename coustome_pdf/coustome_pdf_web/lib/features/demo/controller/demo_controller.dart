import 'package:get/get.dart';
import 'package:coustome_pdf_web/app/api/domain/usecases/auth_usecase.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class DemoController extends GetxController {
  final AuthUseCases authUseCases;
  DemoController({required this.authUseCases});


  // Dropdown states
  var ownershipType = "Partnership".obs;
  var healthSafety = "Yes".obs;
  var otherFacilities = "Yes".obs;
  var workerStrike = "Yes".obs;

  // Text fields (can be expanded to individual RxStrings)
  final Map<String, String> formData = {};

  void updateField(String key, String value) {
    formData[key] = value;
  }


   Future<void> generateAndDownloadKAF01() async {
    final pdf = pw.Document();

    // Reusable Footer Component
    pw.Widget buildFooter() {
      return pw.Table(
        border: pw.TableBorder.all(color: PdfColors.grey),
        children: [
          pw.TableRow(children: [
            _pCell("Document Name:", bold: true),
            _pCell("Application Form"),
            _pCell("Edition No.", bold: true),
            _pCell("01"),
            _pCell("Revision No.", bold: true),
            _pCell("01"),
          ]),
          pw.TableRow(children: [
            _pCell("Document No.", bold: true),
            _pCell("KAF-01"),
            _pCell("Issue Date:", bold: true),
            _pCell("1.09.2021"),
            _pCell("Revision Date:", bold: true),
            _pCell("17.06.2023"), // Updated per source [cite: 8]
          ]),
        ],
      );
    }

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        footer: (context) => buildFooter(),
        build: (context) => [
          pw.Header(level: 0, text: "KVQA"),
          pw.Center(
            child: pw.Text(
              "Social Accountability Certification Application Questionnaire",
              style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold),
            ),
          ),
          pw.SizedBox(height: 20),

          // Main Facility Table
          pw.Table(
            border: pw.TableBorder.all(),
            columnWidths: {0: const pw.FlexColumnWidth(1), 1: const pw.FlexColumnWidth(2)},
            children: [
              _buildRow("Certification Standard", "SA 8000:2014 Standard"),
              _buildRow("Name of Main Facility", "STC International"),
              _buildRow("Address", "Plot No. 595A, Zone 8, Kolkata Leather Complex, Bantala, WB"),
              _buildRow("Approximate Size of Facility",
                  "Total site: ~4200 sq. meters\nBuilt-up: ~15200 sq. meters"), //
              _buildRow("Total Number of Employees", "417"), //
              _buildRow("Number of Salaried Employees", "417"), //
              _buildRow("Number of Non-Salaried Employees", "0"), //
              _buildRow("Number of Temporary Employees", "0"), //
            ],
          ),
          pw.SizedBox(height: 20),

          // Employee Statistics
          pw.Text("Employee Breakdown", style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
          pw.Table(
            border: pw.TableBorder.all(),
            children: [
              _buildRow("Skilled Workers", "97"),
              _buildRow("Semi-skilled Workers", "165"),
              _buildRow("Unskilled Workers", "155"),
              _buildRow("Working Hours", "48 hours per week"),
            ],
          ),
        ],
      ),
    );

    // Preview and Download/Print
    await Printing.layoutPdf(onLayout: (PdfPageFormat format) async => pdf.save());
  }

  static pw.TableRow _buildRow(String label, String value) {
    return pw.TableRow(
      children: [
        pw.Padding(padding: const pw.EdgeInsets.all(5), child: pw.Text(label, style: pw.TextStyle(fontWeight: pw.FontWeight.bold))),
        pw.Padding(padding: const pw.EdgeInsets.all(5), child: pw.Text(value)),
      ],
    );
  }

  static pw.Widget _pCell(String text, {bool bold = false}) {
    return pw.Padding(
      padding: const pw.EdgeInsets.all(4),
      child: pw.Text(text, style: pw.TextStyle(fontSize: 8, fontWeight: bold ? pw.FontWeight.bold : null)),
    );
  }
}
