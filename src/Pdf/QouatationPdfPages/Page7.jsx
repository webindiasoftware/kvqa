import React from "react";
import { View, Text, StyleSheet } from "@react-pdf/renderer";

const styles = StyleSheet.create({
  page: {
    fontFamily: "Helvetica",
    fontSize: 9,
    paddingTop: 20,
    paddingHorizontal: 30,
    lineHeight: 1.35,
    marginTop:30
  },

  title: {
    fontSize: 13,
    fontWeight: "bold",
    textAlign: "center",
    textDecoration: "underline",
    marginBottom: 18,
  },

  centerItalic: {
    textAlign: "center",
    fontStyle: "italic",
    marginBottom: 10,
  },

  detailsRow: {
    flexDirection: "row",
    marginBottom: 8,
  },

  label: {
    width: "45%",
    fontWeight: "bold",
    fontStyle: "italic",
  },

  dash: {
    width: "5%",
    textAlign: "center",
  },

  value: {
    width: "50%",
    fontStyle: "italic",
  },

  highlightBox: {
    backgroundColor: "#e0e0e0",
    padding: 8,
    marginVertical: 18,
  },

  highlightText: {
    fontSize: 8.5,
    fontStyle: "italic",
    textAlign: "center",
  },

  signatureBlock: {
    marginTop: 25,
  },

  signatureRow: {
    flexDirection: "row",
    alignItems: "center",
    marginBottom: 18,
  },

  signatureLabel: {
    width: "35%",
    fontStyle: "italic",
  },

  signatureLine: {
    width: "65%",
    borderBottom: "1 dotted #000",
    height: 12,
  },

  footerText: {
    fontSize: 8.5,
    fontStyle: "italic",
    textAlign: "center",
    marginTop: 20,
  },
});

export default function Page7() {
  return (
    <View style={styles.page}>
      {/* TITLE */}
      <Text style={styles.title}>ACCEPTANCE OF CONTRACT</Text>

      {/* INTRO */}
      <Text style={styles.centerItalic}>
        The Signatory to the Contract undertakes to ensure, on behalf of the Company,
        that the Information supplied will be accurate, that the required Information
        will not be withheld and that no attempt will be made to mislead the Lead Auditor.
      </Text>

      <Text style={styles.centerItalic}>
        Please Complete and Sign this Form which indicates that the Terms & Conditions
        applying to the Contract specified below are Accepted.
      </Text>

      {/* DETAILS */}
      <View style={{ marginTop: 15 }}>
        <View style={styles.detailsRow}>
          <Text style={styles.label}>CONTRACT PROPOSAL NUMBER</Text>
          <Text style={styles.dash}>-</Text>
          <Text style={styles.value}>KVQA/CERT/SA-14/05-25/0068</Text>
        </View>

        <View style={styles.detailsRow}>
          <Text style={styles.label}>CONTRACT DESCRIPTION</Text>
          <Text style={styles.dash}>-</Text>
          <Text style={styles.value}>SA8000 CERTIFICATION</Text>
        </View>

        <View style={styles.detailsRow}>
          <Text style={styles.label}>COMPANY</Text>
          <Text style={styles.dash}>-</Text>
          <Text style={styles.value}>BBS GLOBAL PVT. LTD.</Text>
        </View>

        <View style={styles.detailsRow}>
          <Text style={styles.label}>COMPANY CONTACT</Text>
          <Text style={styles.dash}>-</Text>
          <Text style={styles.value}>MR. ANUPAM TARWAY</Text>
        </View>

        <View style={styles.detailsRow}>
          <Text style={styles.label}>CONTRACT VALUE</Text>
          <Text style={styles.dash}>-</Text>
          <Text style={styles.value}>INR 620975 INCLUSIVE OF GST</Text>
        </View>

        <View style={styles.detailsRow}>
          <Text style={styles.label}>PROPOSED AUDIT DATE</Text>
          <Text style={styles.dash}>-</Text>
          <Text style={styles.value}>TO BE CONFIRMED</Text>
        </View>
      </View>

      {/* HIGHLIGHT */}
      <View style={styles.highlightBox}>
        <Text style={styles.highlightText}>
          The Signatory has Read, Understood and Approved the Content of present Contract
          – including Terms of Payment, particular and General Terms & Conditions of
          Certification – and their Signature is the Proof of their Acceptance.
        </Text>
      </View>

      {/* SIGNATURE */}
      <View style={styles.signatureBlock}>
        <View style={styles.signatureRow}>
          <Text style={styles.signatureLabel}>*Signature & Company Seal</Text>
          <View style={styles.signatureLine} />
        </View>

        <View style={styles.signatureRow}>
          <Text style={styles.signatureLabel}>Representative’s Name</Text>
          <View style={styles.signatureLine} />
        </View>

        <View style={styles.signatureRow}>
          <Text style={styles.signatureLabel}>Position in Company</Text>
          <View style={styles.signatureLine} />
        </View>

        <View style={styles.signatureRow}>
          <Text style={styles.signatureLabel}>Date</Text>
          <View style={styles.signatureLine} />
        </View>
      </View>

      {/* FOOTER */}
      <Text style={styles.footerText}>
        The Proposed Certification Audits cannot be booked until receipt of Payment of
        the Contract Value which must be received at least Three (3) Weeks prior to
        Commencement of the Audit. Reports & Certificates cannot be issued until Receipt
        of Payment of Expenses & Signed Declaration.
      </Text>

      <Text style={styles.footerText}>
        Please mail the Complete Form to social@kvqaindia.com. If you have any Queries
        regarding the Contract Proposal, Please Contact Mr. Lav Kaushik at +91 9891295551
        or E-mail to social@kvqaindia.com.
      </Text>
    </View>
  );
}
