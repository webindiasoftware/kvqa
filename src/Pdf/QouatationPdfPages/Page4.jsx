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
  },

  title: {
    fontSize: 13,
    fontStyle:'italic',
    fontWeight: "bold",
    textAlign: "center",
    marginBottom: 16,
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

  bold: {
    fontWeight: "bold",
  },
});

export default function Page4() {
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
            <Text style={styles.sectionNumber}>1.</Text> DEFINITIONS AND INTERPRETATION
          </Text>

          <Text style={styles.paragraph}>
            1.1. The Definitions & Rules of Interpretation in this Article apply in these
            specific Terms & Conditions of Service.
          </Text>

          <Text style={styles.paragraph}>
            <Text style={styles.bold}>COMPANY:</Text> "KVQA CERTIFICATION SERVICES PRIVATE LIMITED"
            herein referred to as the "COMPANY".
          </Text>

          <Text style={styles.paragraph}>
            <Text style={styles.bold}>CUSTOMER:</Text> The person, firm, company, partnership,
            association, trust, or government agency or authority that purchases Services
            from the Company and is identified in the applicable Company Order Form or
            agreed written instruction.
          </Text>

          <Text style={styles.sectionTitle}>
            <Text style={styles.sectionNumber}>2.</Text> SCOPE
          </Text>

          <Text style={styles.paragraph}>
            2.1. The following terms and conditions apply to agreed services including
            information and deliveries as well as ancillary services and other secondary
            obligations provided within the scope of contract performance.
          </Text>

          <Text style={styles.paragraph}>
            2.2. If there is any conflict between these terms and conditions and the
            client's General Terms and Conditions of Business, including the client's
            Terms and Conditions of Purchasing, if any, these terms and conditions shall
            apply.
          </Text>

          <Text style={styles.sectionTitle}>
            <Text style={styles.sectionNumber}>3.</Text> CONTRACT
          </Text>

          <Text style={styles.paragraph}>
            3.1. Unless otherwise agreed, all quotations submitted by KVQA CERTIFICATION
            SERVICES PRIVATE LIMITED shall be subject to change without notice.
          </Text>

          <Text style={styles.paragraph}>
            3.2.  The contract shall come into effect for the agreed term upon the 
quotation letter of KVQA CERTIFICATION SERVICES PRIVATE LIMITED or a 
separate contractual document being signed by both contracting 
parties, or upon the works requested by the client being carried out by 
KVQA CERTIFICATION SERVICES PRIVATE LIMITED. If the client instructs 
KVQA CERTIFICATION SERVICES PRIVATE LIMITED without receiving a 
prior quotation from KVQA CERTIFICATION SERVICES PRIVATE LIMITED 
(Contract), KVQA CERTIFICATION SERVICES PRIVATE LIMITED is – in its sole 
discretion – entitled to accept the order by giving written notice of such 
acceptance (including notice sent via electronic means) or by 
performing the requested services.
          </Text>

          <Text style={styles.paragraph}>
            3.3. The contract term starts upon the coming into effect of the contract in 
accordance with article 3.1 and shall continue for the term agreed in 
the contract.
          </Text>

          <Text style={styles.paragraph}>
            3.4. his Offer is valid for three (3) Months (90 Days) from the Date of 
Submission. The Certification Fee once paid shall be Non-Refundable
          </Text>

          <Text style={styles.paragraph}>
            3.5. The Contract Proposal is based on the Inputs provided by the client. If 
however, during the course of providing the Service it is found that the 
Information furnished by the Client is not in agreement with what was 
provided earlier, the Company reserves the Right to alter & amend the 
Contract Proposal and send the final Invoice accordingly, which shall 
be binding on the Client. 
          </Text>

                    <Text style={styles.paragraph}>
            3.6. The Company reserves the right to amend the Contract Proposal 
upwards, in the event of any Unforeseen Expenses, including Statutory 
Requirements, which is beyond our Control.
          </Text>

                    <Text style={styles.paragraph}>
            3.7. Information about any changes with regard to the Clients Top 
Management, Ownership, Change of Location, Scope shall be 
intimated to KVQA CERTIFICATION PRIVATE LIMITED as applicable.  
          </Text>

 <Text style={styles.sectionTitle}>
            <Text style={styles.sectionNumber}>4.</Text> SCOPE OF SERVICES
          </Text>

          <Text style={styles.paragraph}>
            4.1. The scope of the services shall be decided solely by a unanimous 
declaration issued by both parties. If no such declaration exists, then 
the written confirmation of order by KVQA CERTIFICATION SERVICES 
PRIVATE LIMITED shall be decisive. 
          </Text>

          <Text style={styles.paragraph}>
            4.2. The agreed services shall be performed in compliance with the regulations 
in force at the time the contract is entered into. 
          </Text>

        </View>

        {/* ============ RIGHT COLUMN ============ */}
        <View style={styles.column}>

 <Text style={styles.sectionTitle}>
            <Text style={styles.sectionNumber}>4.</Text> SCOPE OF SERVICES
          </Text>

          <Text style={styles.paragraph}>
            4.3. Furthermore, KVQA CERTIFICATION SERVICES PRIVATE LIMITED is entitled to 
determine (in its sole discretion) the method and nature of the assessment 
unless otherwise agreed in writing or if mandatory provisions require a 
specific procedure to be followed.
          </Text>
                    <Text style={styles.paragraph}>
            4.4. On execution of the work there shall be no simultaneous assumption of 
any guarantee of the correctness (proper quality) and working order of 
either tested or examined parts nor of the installation as a whole and its 
upstream and/or downstream processes, organizations, use and 
application in accordance with regulations, nor of the systems on which 
the installation is based; in particular, no responsibility shall be assumed 
for the construction, selection of materials and assembly of installations 
examined, nor for their use and application in accordance with 
regulations unless these questions are expressly covered by the contract. 
          </Text>

          <Text style={styles.paragraph}>
            4.5.  In the case of inspection work, KVQA CERTIFICATION SERVICES PRIVATE 
LIMITED shall not be responsible for the accuracy or checking of the safety 
programs or safety regulations on which the inspections are based, unless 
otherwise expressly agreed in writing. 
          </Text>

          <Text style={styles.sectionTitle}>
            <Text style={styles.sectionNumber}>5.</Text> PERFORMANCE PERIODS / DATES
          </Text>

          <Text style={styles.paragraph}>
            5.1. The contractually agreed periods and dates of performance are based on 
estimates of the work involved which are prepared in line with the details 
provided by the client. They shall only be binding if confirmed as binding 
by KVQA CERTIFICATION SERVICES PRIVATE LIMITED Ltd in writing. 
          </Text>

          <Text style={styles.paragraph}>
            5.2.  If binding periods of performance have been agreed, these periods shall 
not commence until the client has submitted all required documents to 
KVQA CERTIFICATION SERVICES PRIVATE LIMITED This also applies, even 
without express approval by the client, to all extensions of agreed dates 
for performance not caused by KVQA CERTIFICATION SERVICES PRIVATE LIMITED .
          </Text>

          <Text style={styles.sectionTitle}>
            <Text style={styles.sectionNumber}>6.</Text> CLIENT OBLIGATIONS
          </Text>

          <Text style={styles.paragraph}>
            6.1. The Customer shall co-operate with the Company in all matters relating to 
the Services. The Customer shall provide the Company, its Agents, 
Subcontractors, Consultants and Employees, in a timely manner and at no 
charge, with access to the Customer's Premises, Office Accommodation, 
Equipments, Information, Data and other Facilities and Personnel as 
required by the Company in relation to which the Service is to be provided; 
          </Text>

          <Text style={styles.paragraph}>
            6.2.  Design documents, supplies, auxiliary staff, etc. necessary for 
performance of the services shall be made available free of charge by 
the client. Moreover, collaborative action of the client must be undertaken 
in accordance with legal provisions, standards, safety regulations and 
accident prevention instructions. 
          </Text>

         <Text style={styles.paragraph}>
            6.2.   The client shall bear any additional cost incurred on account of work 
having to be redone or being delayed as a result of late, incorrect or 
incomplete information or lack of proper cooperation. Even where a fixed 
or maximum price is agreed, KVQA CERTIFICATION SERVICES PRIVATE 
LIMITED shall be entitled to charge extra for such additional expense.  
          </Text>

          <Text style={styles.sectionTitle}>
            <Text style={styles.sectionNumber}>7.</Text> INVOICING OF WORK
          </Text>

          <Text style={styles.paragraph}>
            7.1. If the scope of performance is not laid down in writing when the order is 
placed, invoicing shall be based on costs incurred. If no payment is 
agreed in writing, invoicing shall be in accordance with the KVQA 
CERTIFICATION SERVICES PRIVATE LIMITED price list valid at the time of 
performance. 
          </Text>

          <Text style={styles.paragraph}>
            7.2. . Unless otherwise agreed, work shall be invoiced according to the progress 
of the work. 
          </Text>

          <Text style={styles.sectionTitle}>
            <Text style={styles.sectionNumber}>8.</Text> PAYMENT TERMS AND CONDITIONS
          </Text>

          <Text style={styles.paragraph}>
            8.1. All invoice amounts shall be due for payment on receipt of the Invoice, 
subject only to statutory deductions as per applicable tax laws. No 
discounts shall be granted. 

          </Text>

        </View>
      </View>
    </View>
  );
}
