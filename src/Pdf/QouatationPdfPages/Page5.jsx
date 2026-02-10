import React from "react";
import { View, Text, StyleSheet } from "@react-pdf/renderer";

const RED = "#c4161c";

const styles = StyleSheet.create({
  page: {
    fontFamily: "Helvetica",
    fontSize: 8.5,
    paddingTop: 10,
    marginHorizontal:10,
    lineHeight: 1.15,
    marginTop:20,
    marginBottom: 20,
  },

  title: {
    fontSize: 13,
    fontStyle: "italic",
    fontWeight: "bold",
    textAlign: "center",
    marginBottom: 14,
    textDecoration: "underline",
  },

  columns: {
    flexDirection: "row",
    justifyContent: "space-between",
  },

  column: {
    width: "45%",
  },

  sectionTitle: {
    fontWeight: "bold",
    marginBottom: 4,
    color: RED,
  },

  sectionNumber: {
    color: RED,
    fontWeight: "bold",
  },

  paragraph: {
    fontStyle: "italic",
    marginBottom: 6,
    textAlign: "justify",
  },
});

export default function Page5() {
  return (
    <View style={styles.page}>
      {/* ================= TITLE ================= */}
      <Text style={styles.title}>
        GENERAL TERMS & CONDITIONS OF KVQA CERTIFICATION SERVICES PVT.LTD.
      </Text>

      {/* ================= TWO COLUMNS ================= */}
      <View style={styles.columns}>

        {/* ============ LEFT COLUMN ============ */}
        <View style={styles.column}>

          <Text style={styles.sectionTitle}>
            <Text style={styles.sectionNumber}>8.</Text> PAYMENT TERMS AND CONDITIONS
          </Text>

          <Text style={styles.paragraph}>
            8.2. Payments shall be made to the bank account of KVQA CERTIFICATION
            SERVICES PRIVATE LIMITED as indicated on the invoice, stating the
            invoice and customer numbers.
          </Text>

          <Text style={styles.paragraph}>
            8.3. In cases of default of payment, KVQA CERTIFICATION SERVICES
            PRIVATE LIMITED shall be entitled to claim default interest at a rate
            of 18% p.a. at the same time, KVQA CERTIFICATION SERVICES PRIVATE
            LIMITED reserves the right to claim further damages.
          </Text>

          <Text style={styles.paragraph}>
            8.4. Objections to the invoices of KVQA CERTIFICATION SERVICES PRIVATE
            LIMITED shall be submitted in writing within two weeks of receipt of
            the invoice.
          </Text>

          <Text style={styles.paragraph}>
            8.5. KVQA CERTIFICATION SERVICES PRIVATE LIMITED shall be entitled to
            demand appropriate advance payments.
          </Text>

          <Text style={styles.paragraph}>
            8.6. Should the client default in payment of the invoice despite being
            granted a reasonable grace period, KVQA CERTIFICATION SERVICES
            PRIVATE LIMITED shall be entitled to cancel the contract, withdraw
            the certificate, claim damages for non-performance and refuse to
            continue performance of the contract. KVQA CERTIFICATION SERVICES
            PRIVATE LIMITED also reserves the right to publish the names of
            defaulting clients in public domains as may be fit and also meet any
            other requirements as prescribed by accreditation agencies.
          </Text>

          <Text style={styles.paragraph}>
            8.7. The provisions set forth in this clause shall apply equally to
            consumer insolvency proceedings against the client and commencement
            of insolvency proceedings against the client's assets or cases in
            which the commencement of insolvency proceedings has been dismissed
            due to lack of assets.
          </Text>

          <Text style={styles.paragraph}>
            8.8. KVQA CERTIFICATION SERVICES PRIVATE LIMITED shall be entitled to
            charge its fees at the beginning of a month if overheads and/or
            purchase costs have increased. In this case, KVQA CERTIFICATION
            SERVICES PRIVATE LIMITED shall notify the client in writing of the
            fee rise. This notification shall be issued one month prior to the
            rise in fees if less than some time effect (period of notice of
            changes in fees). If the rise in fees remains under 5% per contractual
            year, the client shall be entitled to terminate the contractual
            relationship by the end of the period of notice if the change in fees
            cannot be reached by agreement expiry above period.
          </Text>

          <Text style={styles.paragraph}>
            8.9. Only legally established and undisputed claims may be offset
            against claims by KVQA CERTIFICATION SERVICES PRIVATE LIMITED.
          </Text>

          <Text style={styles.sectionTitle}>
            <Text style={styles.sectionNumber}>9.</Text> ACCEPTANCE OF THE CONTRACT
          </Text>

          <Text style={styles.paragraph}>
            9.1. Any part of the work ordered which is complete in itself may be
            presented by KVQA CERTIFICATION SERVICES PRIVATE LIMITED for
            acceptance as instalment. The client shall be obliged to accept it
            immediately.
          </Text>

          <Text style={styles.paragraph}>
            9.2. If the client fails to fulfil its acceptance obligation immediately,
            acceptance shall be deemed to have taken place 4 calendar weeks
            after performance of the work if KVQA CERTIFICATION SERVICES PRIVATE
            LIMITED has specifically made the client aware of the aforementioned
            deadline upon performance of the service.
          </Text>

          <Text style={styles.sectionTitle}>
            <Text style={styles.sectionNumber}>10.</Text> CONFIDENTIALITY
          </Text>

          <Text style={styles.paragraph}>
            10.1. Both Parties shall maintain strict confidence and shall not
            disclose to any third party any information or material relating to
            the other or the other’s business which comes into their possession
            and shall not use such information and material. This provision
            shall, however, apply to information or material which is or becomes
            public knowledge other than by breach by a party of this clause.
          </Text>

        </View>

        {/* ============ RIGHT COLUMN ============ */}
        <View style={styles.column}>

<Text style={styles.sectionTitle}>
            <Text style={styles.sectionNumber}>10.</Text> CONFIDENTIALITY
          </Text>

          <Text style={styles.paragraph}>
            10.2. Each Party shall be responsible for ensuring that all persons to
            whom Confidential Information of the other Party is disclosed under
            the Agreement shall keep such information confidential and shall not
            disclose or divulge the same to any unauthorized person or entity and
            shall assume full responsibility for any breach of said undertaking.
          </Text>

          <Text style={styles.paragraph}>
            10.3. During the course of the Contract Arrangement with the Company,
            the Customer will acquire, gain, generate, gather and develop
            knowledge of and be given access to Business Information about
            Service Activities, know-how, methods or refinements and other
            information concerning the Service / Business of the Company,
            hereinafter called the "INFORMATION". The protection of Privileged
            and Confidential Information, including Trade Secrets, is vital to
            the interests of the Company.
          </Text>

          <Text style={styles.paragraph}>
            10.4. Customer's Obligation to maintain the Confidentiality & Security
            of Confidential Information remains even after the Customer’s
            Contract with Company and continues for so long as such Confidential
            Information remains a Trade Secret.
          </Text>

          <Text style={styles.paragraph}>
            10.5. All confidential information shall remain the property of the
            disclosing party. The receiving party hereby agrees to immediately
            (i) return all confidential information, including all copies, to the
            disclosing party, and/or, on request by the disclosing party, to (ii)
            destroy all confidential information, including all copies, and
            confirm the destruction of this confidential information to the
            disclosing party in writing at any time if so requested by the
            disclosing party and if the latest period after termination or expiry
            of this contract. This does not extend to include reports and
            certificates prepared for the client pursuant to fulfilment of
            obligations under this contract, which shall remain with the client.
            However, KVQA CERTIFICATION SERVICES PRIVATE LIMITED is entitled to
            make file copies of such reports, certificates and confidential
            information that forms the basis for preparing these reports and
            certificates in order to evidence the correctness of its results and
            for general documentation purposes.
          </Text>

          <Text style={styles.paragraph}>
            10.6. From the start of this contract and for a period of three years
            after termination or expiry of this contract, the receiving party
            shall maintain strict secrecy of all confidential information and
            shall not disclose this information to any third parties or use it
            for itself.
          </Text>

          <Text style={styles.sectionTitle}>
            <Text style={styles.sectionNumber}>11.</Text>  COMPLAINTS 
          </Text>

           <Text style={styles.paragraph}>
            11.1. Complaints must be submitted in writing to the KVQA CERTIFICATION 
SERVICES PRIVATE LIMITED. 
          </Text>

          <Text style={styles.paragraph}>
            11.2. If the complaint is justified, the KVQA CERTIFICATION SERVICES PRIVATE 
LIMITED will accordingly initiate action. 
          </Text>

          <Text style={styles.paragraph}>
            11.3. Should the complaint be untenable from the point of view of the KVQA 
CERTIFICATION SERVICES PRIVATE LIMITED. 
          </Text>

          <Text style={styles.paragraph}>
            11.4. his will be communicated to the complainant and the latter for 
comment within a period of 30 calendar days. Should not agreement 
with the complainant the parties agree to hold arbitration otherwise, 
legal action will be taken. . 
          </Text>

          <Text style={styles.sectionTitle}>
            <Text style={styles.sectionNumber}>12.</Text> TERMINATION 
          </Text>

          <Text style={styles.paragraph}>
            12.1. This Agreement shall remain in full force and effect until terminated by 
any one of the parties as set out in this Agreement. Each Party may 
terminate this Agreement by Written Notice to the other Party under 
the following circumstances: (i) If the other Party commits a Material 
Breach of this Agreement and fail to rectify such within 10 Working 
Days after the other Party’s Written Notice; (ii) If the other Party 
becomes Insolvent, unable to pay its debts as they fall due, or subject 
to Bankruptcy Proceedings, Receivership, Dissolution, Liquidation, 
Wind-Up or otherwise Discontinue Business; (iii) For convenience after 
serving the other party a written notice 60 days prior to termination.

          </Text>


        </View>
      </View>
    </View>
  );
}
