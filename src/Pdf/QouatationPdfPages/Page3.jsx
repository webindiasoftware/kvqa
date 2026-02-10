import React from "react";
import { View, Text, StyleSheet, Image } from "@react-pdf/renderer";
import logo from "../../assets/signature.png"

const RED = "#c4161c";

const styles = StyleSheet.create({
  page: {
    fontSize: 9,
    fontFamily: "Helvetica",
    marginHorizontal:10,
    marginBottom:200,
    marginTop:30
  },

  /* ================= TITLES ================= */
  title: {
    fontWeight: "bold",
    marginBottom: 6,
  },

  subtitle: {
    fontWeight: "bold",
    marginTop: 10,
    marginBottom: 6,
  },

  /* ================= BULLETS ================= */
  bulletList: {
    marginBottom: 6,
  },

  bulletRow: {
    flexDirection: "row",
    marginBottom: 5,
  },

  bulletIcon: {
    width: 8,
    height: 8,
    border: `1 solid ${RED}`,
    borderRadius: 8,
    marginTop: 3,
    marginRight: 6,
  },

  bulletText: {
    flex: 1,
    fontStyle: "italic",
    lineHeight: 1.25,
  },

  bold: {
    fontWeight: "bold",
  },

  /* ================= PARAGRAPH ================= */
  paragraph: {
    fontStyle: "italic",
    lineHeight: 1.25,
    marginTop: 6,
  },

  /* ================= SIGNATURE ================= */
  company: {
    marginTop: 14,
    fontWeight: "bold",
  },

  signRow: {
    flexDirection: "col",
    marginTop: 6,
    alignItems: "start",
  },

  seal: {
    width: 80,
    height: 60,
    marginRight: 10,
    marginBottom:4
  },

  signText: {
    fontWeight: "bold",
    marginTop: 10,
    marginBottom:30
  },

  /* ================= FOOTER IMAGE ================= */
  footerImage: {
    marginTop: 20,
    width: "100%",
    height: 90,
    objectFit: "cover",
  },
});

export default function Page3() {
  return (
    <View style={styles.page}>

      {/* ================= PAYMENT TERMS ================= */}
      <Text style={styles.title}>PAYMENT TERMS</Text>

      <View style={styles.bulletList}>
        <View style={styles.bulletRow}>
          <View style={styles.bulletIcon} />
          <Text style={styles.bulletText}>
            <Text style={styles.bold}>
              100% of the Certification Audit Fees to be paid in Advance before
              the Certification Audit
            </Text>{" "}
            based against the Invoice. Any Other Fees apart from Certification
            Audit, (if any) shall be paid before delivery of the Certificate
            against the invoice which would include travel/living/other
            applicable taxes & expenses at actuals.
          </Text>
        </View>

        <View style={styles.bulletRow}>
          <View style={styles.bulletIcon} />
          <Text style={styles.bulletText}>
            <Text style={styles.bold}>Bank Charges</Text>, if any, shall be borne
            by the Client. In case of failure to pay the invoices despite
            reminders, the Company shall reserve the right to proceed legally
            against the client, including availing the services of third-party
            recovery companies and the costs incurred thereon, shall exclusively
            be borne by the client.
          </Text>
        </View>

        <View style={styles.bulletRow}>
          <View style={styles.bulletIcon} />
          <Text style={styles.bulletText}>
            Charges may be made against Expenses incurred for Cancellation of
            Confirmed Visit Dates.
          </Text>
        </View>

        <View style={styles.bulletRow}>
          <View style={styles.bulletIcon} />
          <Text style={styles.bulletText}>
            The Company shall also reserve the Right to Withdraw or Suspend all
            or any of its Services to the Client, till such time that the Invoice
            is settled.
          </Text>
        </View>
      </View>

      {/* ================= TRAVEL ================= */}
      <Text style={styles.subtitle}>TRAVEL & ACCOMMODATION EXPENSES</Text>

      <View style={styles.bulletList}>
        <View style={styles.bulletRow}>
          <View style={styles.bulletIcon} />
          <Text style={styles.bulletText}>
            <Text style={styles.bold}>
              The client shall provide or be charged for Travel & Accommodation
              of the Auditing Team on actuals.
            </Text>
          </Text>
        </View>

        <View style={styles.bulletRow}>
          <View style={styles.bulletIcon} />
          <Text style={styles.bulletText}>
            All other Expenses incurred in connection with the Certification
            Process shall be borne by the Client.
          </Text>
        </View>
      </View>

      {/* ================= CLOSING PARAGRAPH ================= */}
      <Text style={styles.paragraph}>
        The formal <Text style={styles.bold}>Confirmation of Acceptance of our Offer</Text>{" "}
        will be required to freeze on the Contract. We request you to please
        review the Proposal carefully, resolve discrepancies, if any, and
        thereafter return the <Text style={styles.bold}>Acceptance of Proposal</Text>{" "}
        in original duly signed and stamped on the assigned space on Last Page.
        We look forward to receiving your favorable reply and to work together
        with you. <Text style={styles.bold}>
          Should you have any questions please don't hesitate to contact us at
          social@kvqaindia.com.
        </Text>
      </Text>

      {/* ================= SIGNATURE ================= */}
      <Text style={styles.company}>
        FOR KVQA CERTIFICATION SERVICES PVT. LTD.
      </Text>

      <View style={styles.signRow}>
        {/* Stamp / Seal image */}
        <Image
          style={styles.seal}
          src={logo}
        />

        <Text style={styles.signText}>AUTHORIZED SIGNATORY</Text>
      </View>

      {/* ================= FOOTER IMAGE ================= */}
      {/* {footerImageUrl && (
        <Image
          style={styles.footerImage}
          src={footerImageUrl}
        />
      )} */}

    </View>
  );
}
