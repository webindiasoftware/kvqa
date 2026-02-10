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
    marginTop: 10,
    marginBottom:250
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
    width: "46%",
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

export default function Page6() {
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
            <Text style={styles.sectionNumber}>13.</Text> FORCE MAJEURE
          </Text>

          <Text style={styles.paragraph}>
            13.1. Delay in or Failure of Performance of either Party hereto shall
            not constitute a default hereunder or give rise to any Claim for
            damage if and to the extent such delay or failure is caused by any
            event beyond the control of the party affected which the party had
            no reasonable way of preventing or grounds to anticipate, including
            but not limited to an act of War, Natural Disaster, Fire, Explosion,
            Labour Dispute or any International sanctions or Restrictions on
            Trade. The Affected Party shall immediately notify the other Party
            in writing of the Causes and Expected Duration of any such
            Occurrence.
          </Text>

          <Text style={styles.sectionTitle}>
            <Text style={styles.sectionNumber}>14.</Text> LIABILITY OF KVQA
            CERTIFICATION SERVICES PRIVATE LIMITED
          </Text>

          <Text style={styles.paragraph}>
            14.1. Irrespective of the legal basis and in particular in the event
            of a breach of contractual obligations and tort, the liability of
            KVQA CERTIFICATION SERVICES PRIVATE LIMITED for all damages, loss and
            reimbursement of expenses caused by legal representatives and/or
            employees of KVQA CERTIFICATION SERVICES PRIVATE LIMITED shall be
            limited to: (i) in the case of contract with a fixed overall fee, an
            amount equal to the overall fee for the entire contract; (ii) in the
            case of contracts for annually recurring services, an amount equal
            to the agreed annual fee; (iii) in the case of contracts expressly
            charged on a time and material basis to a maximum of Rs.10,00,000/-
            (Rupees Ten Lacs only); and (iv) in the case of framework agreements
            that provide for the possibility of placing individual orders, to
            an amount equal to three times the fee for the individual order
            under which the damage occurred. The maximum liability of KVQA
            CERTIFICATION SERVICES PRIVATE LIMITED is limited in any event of
            damage or loss to the contract value, unless specifically agreed
            otherwise. KVQA CERTIFICATION SERVICES PRIVATE LIMITED shall not be
            liable for personnel made available by the client to support KVQA
            CERTIFICATION SERVICES PRIVATE LIMITED in the performance of its
            services regardless under this contract. The client shall indemnify
            KVQA CERTIFICATION SERVICES PRIVATE LIMITED against any claims made
            by third parties for all loss that may be caused to or suffered by
            KVQA CERTIFICATION SERVICES PRIVATE LIMITED due to acts of omission
            and commission by the client.
          </Text>

          <Text style={styles.paragraph}>
            14.2. The limitation periods for claims for damages shall be based on
            statutory provisions & none of the provisions of this article 12
            changes the burden of proof to the disadvantage of the client.
          </Text>

        </View>

        {/* ============ RIGHT COLUMN ============ */}
        <View style={styles.column}>

          <Text style={styles.sectionTitle}>
            <Text style={styles.sectionNumber}>15.</Text> GOVERNING LAW & JURISDICTION
          </Text>

          <Text style={styles.paragraph}>
            15.1. The Agreement, and any dispute or claim arising out of or in
            connection with it or its subject matter, shall be governed by, and
            construed in accordance with, the laws of India, notwithstanding
            any conflicts of laws rules that could require the application of
            any other law. The Agreement and any Non-Contractual Obligations
            shall be interpreted according to Indian law and the Delhi High
            Court shall have exclusive jurisdiction.
          </Text>

          <Text style={styles.paragraph}>
            15.2. No ancillary agreements to this contract have been concluded.
          </Text>

          <Text style={styles.paragraph}>
            15.3. All amendments and supplements must be in writing in order to
            be effective; this also applies to amendments and supplements to
            the requirement for the written form.
          </Text>

        </View>
      </View>
    </View>
  );
}
