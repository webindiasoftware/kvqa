import React from "react";
import { View, Text, StyleSheet } from "@react-pdf/renderer";

const RED = "#c4161c";
const BORDER = "#999";

const styles = StyleSheet.create({
  page: {
    fontSize: 9,
    fontFamily: "Helvetica",
    paddingBottom:50,
    marginHorizontal:10,
  },

  /* ================= SECTION TITLE ================= */
  sectionTitle: {
    textAlign: "left",
    fontWeight: "bold",
    fontSize: 11,
    textDecoration: "underline",
    marginVertical: 6,
  },

  /* ================= TABLE ================= */
  table: {
    border: `1 solid ${BORDER}`,
    marginTop: 6,
    fontStyle: "italic",
  },

  tableHeader: {
    flexDirection: "row",
    backgroundColor: RED,
  },

  th: {
    color: "#fff",
    fontWeight: "bold",
    padding: 5,
    borderRight: "1 solid #fff",
    textAlign: "center",
  },

  tr: {
    flexDirection: "row",
    borderTop: `1 solid ${BORDER}`,
  },

  td: {
    padding: 5,
    borderRight: `1 solid ${BORDER}`,
  },

  center: { textAlign: "center" },
  right: { textAlign: "right" },
  bold: { fontWeight: "bold" },

  /* ================= COLUMN WIDTHS ================= */
  c1: { width: "5%" },
  c2: { width: "43%" },
  c3: { width: "12%" },
  c4: { width: "15%" },
  c5: { width: "25%" },

  /* ================= TOTALS ================= */
  totalsBox: {
    width: 200,
    alignSelf: "flex-end",
    marginTop: 8,
  },

  totalRow: {
    flexDirection: "row",
    justifyContent: "space-between",
    borderBottom: `1 solid ${BORDER}`,
    paddingVertical: 3,
  },

  amountView:{
    flexDirection:'row',
    justifyContent:"space-between",
    alignItems:'center',
    marginBottom:10,
    // border:" 1 solid red"
  },
  /* ================= AMOUNT WORDS ================= */
  amountWords: {
    backgroundColor: RED,
    color: "#fff",
    padding: 6,
    marginTop: 8,
    fontWeight: "bold",
    width:"70%"
  },

  /* ================= GRAND TOTAL ================= */
  grandTotal: {
    border: `1 solid ${BORDER}`,
    alignSelf: "flex-end",
    padding: 6,
    marginTop: 6,
    fontWeight: "bold",
  },

  /* ================= PAYMENT TERMS ================= */
  paymentTerms: {
    marginTop: 10,
    fontSize: 8,
  },

  termRow: {
    flexDirection: "row",
    marginBottom: 4,
  },

  bullet: {
    width: 6,
    height: 6,
    backgroundColor: RED,
    borderRadius: 6,
    marginTop: 4,
    marginRight: 6,
  },
});

export default function Page2() {
  return (
    <View style={styles.page}>

      {/* ================= OUR FEES ================= */}
      <Text style={styles.sectionTitle}>OUR FEES</Text>

      <View style={styles.table}>
        <View style={styles.tableHeader}>
          <Text style={[styles.th, styles.c1]}>S.NO.</Text>
          <Text style={[styles.th, styles.c2]}>DESCRIPTION OF SERVICE</Text>
          <Text style={[styles.th, styles.c3]}>NO. OF MANDAYS</Text>
          <Text style={[styles.th, styles.c4]}>HSN/SAC CODE</Text>
          <Text style={[styles.th, styles.c5]}>AMOUNT (INR)</Text>
        </View>

        {[
          ["1", "Year-1 Pre-Assessment of SA8000:2014 (Onsite)", "1", "998311", "35,000"],
          ["2", "Year-1 Stage 1 Audit of SA8000:2014 (Onsite)", "2", "998311", "70,000"],
          ["3", "Admin Fees", "", "998311", "20,000"],
          ["4", "Year 1 Stage 2 Audit of SA8000:2014 (Onsite)", "4", "998311", "1,40,000"],
          ["5", "Admin Fees", "", "998311", "20,000"],
          ["6", "1st Surveillance of SA8000:2014 (Onsite) (before 6 Months)", "2.5", "998311", "87,500"],
          ["7", "Admin Fees", "", "998311", "20,000"],
          ["8", "Follow up Review of SA8000:2014 (Offsite) (before 12 Months)", "0.25", "998311", "8,750"],
          ["9", "2nd Surveillance of SA8000:2014 (Onsite) (before 18 Months)", "2.5", "998311", "87,500"],
          ["10", "Admin Fees", "", "998311", "20,000"],
          ["11", "Follow up Review of SA8000:2014 (Offsite) (before 24 Months)", "0.25", "998311", "8,750"],
          ["12", "Re-Certification Audit (before 30 Months)", "", "Will be agreed mutually at 24 Months", ""],
          ["13", "Follow up Review of SA8000:2014 (Offsite) (before 35 Months)", "0.25", "998311", "8,750"],
        ].map((r, i) => (
          <View key={i} style={styles.tr}>
            <Text style={[styles.td, styles.c1, styles.center]}>{r[0]}</Text>
            <Text style={[styles.td, styles.c2]}>{r[1]}</Text>
            <Text style={[styles.td, styles.c3, styles.center]}>{r[2]}</Text>
            <Text style={[styles.td, styles.c4, styles.center]}>{r[3]}</Text>
            <Text style={[styles.td, styles.c5, styles.right]}>{r[4]}</Text>
          </View>
        ))}
      </View>

      {/* ================= TOTALS ================= */}
      <View style={styles.totalsBox}>
        <View style={styles.totalRow}>
          <Text style={styles.bold}>TOTAL AMOUNT BEFORE TAX</Text>
          <Text>5,26,250</Text>
        </View>
        <View style={styles.totalRow}>
          <Text>IGST @ 18%</Text>
          <Text>94,725</Text>
        </View>
        <View style={styles.totalRow}>
          <Text style={styles.bold}>TOTAL GST @ 18%</Text>
          <Text style={styles.bold}>94,725</Text>
        </View>
      </View>

    <View style={styles.amountView}>
          {/* ================= AMOUNT IN WORDS ================= */}
      <Text style={styles.amountWords}>
        Amount (In Words): INR Six Lacs Twenty Thousand Nine Hundred & Seventy-Five Only.
      </Text>

      {/* ================= GRAND TOTAL ================= */}
      <View style={styles.grandTotal}>
        <Text>GRAND TOTAL : 6,20,975</Text>
      </View>
    </View>

      {/* ================= PAYMENT PHASE ================= */}
      <Text style={styles.sectionTitle}>PAYMENT PHASE</Text>

      <View style={styles.table}>
        <View style={styles.tableHeader}>
          <Text style={[styles.th, { width: "15%" }]}>YEAR DETAILS</Text>
          <Text style={[styles.th, { width: "60%" }]}>DESCRIPTION OF SERVICE FOR PAYMENT</Text>
          <Text style={[styles.th, { width: "25%" }]}>AMOUNT INCLUSIVE OF TAXES (INR)</Text>
        </View>

        {[
          ["YEAR-1", "Pre-Assessment, Stage I & Stage II Audit (Onsite)", "3,36,300"],
          ["YEAR-2", "1st Surveillance (Onsite) & Follow up Review (Offsite)", "1,37,175"],
          ["YEAR-3", "2nd Surveillance (Onsite) & Follow up Review (Offsite)", "1,47,500"],
        ].map((r, i) => (
          <View key={i} style={styles.tr}>
            <Text style={[styles.td, { width: "15%" }, styles.center, styles.bold]}>{r[0]}</Text>
            <Text style={[styles.td, { width: "60%" }]}>{r[1]}</Text>
            <Text style={[styles.td, { width: "25%" }, styles.right, styles.bold]}>{r[2]}</Text>
          </View>
        ))}
      </View>

      {/* ================= PAYMENT TERMS ================= */}
      <Text style={styles.sectionTitle}>PAYMENT TERMS</Text>

      <View style={styles.paymentTerms}>
        {[
          "All Payments shall be made through Demand Draft / Pay Orders / Cheques / Telegraphic Transfer in favour of KVQA CERTIFICATION SERVICES PVT. LTD.",
          "GST at current rates (18%) is payable in addition to Fees Quoted.",
          "Payment to be released within 15 days from receipt of invoice. Beyond 45 days, Interest @18% per month shall be charged.",
        ].map((t, i) => (
          <View key={i} style={styles.termRow}>
            <View style={styles.bullet} />
            <Text>{t}</Text>
          </View>
        ))}
      </View>
    </View>
  );
}
