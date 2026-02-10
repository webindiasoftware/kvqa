import React from "react";
import { View, Text, StyleSheet, Image } from "@react-pdf/renderer";
import sign from "../../assets/signature.png"; // change path if needed

const styles = StyleSheet.create({
  container: { paddingHorizontal: 20, paddingVertical:10, fontFamily: "Helvetica-Bold" },
  
  // Text style for all text elements
  text: {
    fontSize: 8,
    fontWeight: "bold",
  },
    text2: {
    fontSize: 8,
    fontWeight: "bold",
  },

  title: {
    textAlign: "center",
    color: "#c5161d",
    fontSize: 18, // Increased from 8
    fontWeight: "bold",
    marginBottom:10
  },

  rowBetween: { flexDirection: "row", justifyContent: "space-between" },
  leftBlock: { width: "58%" },
  rightBlock: { width: "40%", backgroundColor: "#e5e5e5", padding: 8 },

  bold: { fontWeight: "bold" },

  /* ---------- TABLE ---------- */
  tableWrapper: { marginTop: 10, border: "1 solid #bfbfbf" },

  tableHeaderRow: {
    flexDirection: "row",
    backgroundColor: "#c5161d",
    color: "#fff",
    borderBottom: "1 solid #bfbfbf",
     fontSize: 10,
  },

  tableDataRow: {
    flexDirection: "row",
    borderBottom: "1 solid #bfbfbf",
     fontSize: 8,
  },

  cellSno: { 
    width: "10%", 
    padding: 6, 
    borderRight: "1 solid #bfbfbf", 
    fontWeight: "bold", 
    textAlign: 'center',
   
  },
  cellParticular: { 
    width: "70%", 
    padding: 6, 
    borderRight: "1 solid #bfbfbf", 
    fontWeight: "bold", 
    textAlign: 'center',
  },
  cellAmount: { 
    width: "20%", 
    padding: 6, 
    textAlign: "center", 
    fontWeight: "bold",
  },

  /* ---------- TOTAL ---------- */
  totalsBox: {
    width: "45%",
    alignSelf: "flex-end",
    border: "1 solid #bfbfbf",
    borderTop:0
  },

  totalsRow: {
    flexDirection: "row",
    justifyContent: "space-between",
    padding: 5,
    borderBottom: "1 solid #bfbfbf",
  },

grandRow: {
  flexDirection: "row",
  justifyContent: "space-between",
  padding: 6,
  backgroundColor: "#c5161d",
  color: "#fff",
  fontWeight: "bold",
  width: '45%',
  height: '100%', // Take full height of parent
  alignItems: 'center',
},

amountWords: {
  backgroundColor: "#c5161d",
  color: "#fff",
  padding: 6,
  fontWeight: "bold",
  fontSize: 10,
  width: '55%',
  height: '100%', // Take full height of parent
  justifyContent: 'center',
},

  /* ---------- PAYMENT PHASE TABLE ---------- */
  paymentHeader: {
    flexDirection: "row",
    backgroundColor: "#c5161d",
    color: "#fff",
    border: "1 solid #bfbfbf",
    marginTop: 10,
    fontSize: 10,
  },

  paymentRow: {
    flexDirection: "row",
    border: "1 solid #bfbfbf",
    borderTop: 0,
     fontSize: 8,
  },

  payCol1: { 
    width: "70%", 
    padding: 6, 
    borderRight: "1 solid #bfbfbf", 
    fontWeight: "bold",
    fontSize: 10,
  },
  payCol2: { 
    width: "30%", 
    padding: 6, 
    textAlign: "right", 
    fontWeight: "bold",
    fontSize: 10,
  },

  /* ---------- SECTIONS ---------- */
  sectionHeader: {
    backgroundColor: "#c5161d",
    color: "#fff",
    padding: 5,
    border: "1 solid #bfbfbf",
    fontWeight: "bold",
    fontSize: 10,
    textAlign:'center'
  },

  box: { 
    border: "1 solid #bfbfbf", 
    padding: 6 
  },
  box2: { 
    border: "1 solid #bfbfbf", 
    padding: 3
  },

  twoCol: { flexDirection: "row", marginTop: 10 },
  colLeft: { width: "50%", paddingRight: 5 },
  colRight: { width: "50%", paddingLeft: 5 },

  footerBar: {
    backgroundColor: "#c5161d",
    color: "#fff",
    padding: 6,
    textAlign: "center",
    marginTop: 10,
    fontWeight: "bold",
    fontSize: 10,
  },

  signBlock: { marginTop: 20 },
  signImage: { width: 100, height: 60 },

  thankYou: { 
    textAlign: "center", 
    marginTop: 40, 
    color: "#c5161d", 
    fontWeight: "bold", 
    fontSize: 8 
  },
});

const InvoiceLayout = () => {
  const items = [
    {
      desc: "Travelling, Fooding & Lodging Charges of Auditors against SA8000:2014 Stage-2 Audit",
      amount: "25,000",
    },
  ];

  return (
    <View style={styles.container}>
      <Text style={styles.title}>TAX INVOICE</Text>

      {/* Top */}
      <View style={styles.rowBetween}>
        <View style={styles.leftBlock}>
          <Text style={styles.text}>
            <Text style={styles.bold}>Kind Attention :</Text> Mr. Shubham Kheria
          </Text>
          <Text style={styles.text}>
            <Text style={styles.bold}>Designation :</Text> Partner
          </Text>
          <Text style={styles.text}>
            <Text style={styles.bold}>Bill To :</Text> AV Enterprises
          </Text>
          <Text style={styles.text}>
            <Text style={styles.bold}>Billing Address :</Text> Kolkata, India
          </Text>
        </View>

        <View style={styles.rightBlock}>
          <Text style={styles.text}>
            <Text style={styles.bold}>Tax Invoice Date :</Text> 11/09/2025
          </Text>
          <Text style={styles.text}>
            <Text style={styles.bold}>Tax Invoice Number :</Text> 1324
          </Text>
          <Text style={styles.text}>
            <Text style={styles.bold}>Client GST Number :</Text> 19AANFA0686M1ZV
          </Text>
          <Text style={styles.text}>
            <Text style={styles.bold}>Client PAN Number :</Text> AANFA0686M
          </Text>
          <Text style={styles.text}>
            <Text style={styles.bold}>Place of Supply :</Text> WEST BENGAL
          </Text>
        </View>
      </View>

      {/* Table */}
      <View style={styles.tableWrapper}>
        <View style={styles.tableHeaderRow}>
          <Text style={styles.cellSno}>S. NO.</Text>
          <Text style={styles.cellParticular}>PARTICULARS</Text>
          <Text style={styles.cellAmount}>AMOUNT (INR)</Text>
        </View>

        {items.map((it, i) => (
          <View style={styles.tableDataRow} key={i}>
            <Text style={styles.cellSno}>{i + 1}</Text>
            <Text style={styles.cellParticular}>{it.desc}</Text>
            <Text style={styles.cellAmount}>{it.amount}</Text>
          </View>
        ))}
      </View>

      {/* Totals */}
      <View style={styles.totalsBox}>
        <View style={styles.totalsRow}>
          <Text style={styles.text}>Total Amount Before Tax</Text>
          <Text style={styles.text}>25,000</Text>
        </View>
        <View style={styles.totalsRow}>
          <Text style={styles.text}>Tax Amount: IGST @18%</Text>
          <Text style={styles.text}>4,500</Text>
        </View>
      </View>
        <View style={{flexDirection:'row'}}>
          <View style={styles.amountWords}>
          <Text>
        Amount (In Words): Twenty-Nine Thousand & Five Hundred Only.
      </Text>
          </View>
          <View style={styles.grandRow}>
          <Text style={styles.text}>GRAND TOTAL</Text>
          <Text style={styles.text}>29,500</Text>
        </View>
        </View>
      

      {/* Payment Phase */}
      <View style={styles.paymentHeader}>
        <Text style={styles.payCol1}>PAYMENT PHASES</Text>
        <Text style={styles.payCol2}>AMOUNT (INR)</Text>
      </View>

      <View style={styles.paymentRow}>
        <Text style={styles.payCol1}>Full & Final Installment</Text>
        <Text style={styles.payCol2}>29,500</Text>
      </View>

      {/* Lower Sections */}
      <View style={styles.twoCol}>
        <View style={styles.colLeft}>
          <Text style={styles.sectionHeader}>PAYMENT TERMS</Text>
          <View style={styles.box}>
            <Text style={styles.text}>
              Please make all Payments in advance favoring 'KVQA Certification Services Pvt. Ltd." by Cheque/Demand Draft payable at Noida (India) or through NEFT/Electronic Transfer within 15 days at the Account Details Provided.
            </Text>
          </View>
          <View style={styles.box}>
            <Text style={styles.text}>
              In case of Non-Payment by the Customer within the Stipulated Period, KVQA Certification Services Pvt. Ltd. may stop the Service and Suspend the Certificate after giving a Notice of 15 Days to the Customer.
            </Text>
          </View>
          <View style={styles.box}>
            <Text style={styles.text}>
              All Outstation Cheque will be given Credit only after being Credited to "KVQA Certification Services Pvt. Ltd." Bank Account. Bank Charges, if any, shall be borne by the Customer.
            </Text>
          </View>
          <View style={styles.box}>
            <Text style={styles.text}>
              All Disputes are Subject to Delhi High Court Jurisdiction only.
            </Text>
          </View>
        </View>

        <View style={styles.colRight}>
          <Text style={styles.sectionHeader}>ACCOUNT DETAILS FOR BANK TRANSFER</Text>
          <View style={styles.box2}>
            <Text style={styles.text2}>Bank: IDFC FIRST</Text>
          </View>
          <View style={styles.box2}>
            <Text style={styles.text2}>BANK ACCOUNT NAME: KVQA CERTIFICATION SERVICES PVT LTD</Text>
          </View>
          <View style={styles.box2}>
            <Text style={styles.text2}>BANK ACCOUNT NUMBER: 85840199992</Text>
          </View>
          <View style={styles.box2}>
            <Text style={styles.text2}>IFSC CODE: IDFB0021331, SWIFT CODE: IDFBINBBMUM</Text>
          </View>
          <View style={styles.box2}>
            <Text style={styles.text2}>BRANCH: NOIDA SECTOR 63 BRANCH</Text>
          </View>

          <Text style={styles.sectionHeader}>COMPANY REGISTRATION DETAILS</Text>
          <View style={styles.box2}>
            <Text style={styles.text2}>GST NUMBER: 07AADCK8876E1Z7</Text>
          </View>
          <View style={styles.box2}>
            <Text style={styles.text2}>HSN CODE/SAC: 998214</Text>
          </View>
          <View style={styles.box2}>
            <Text style={styles.text2}>PAN NUMBER: AADCK8876E</Text>
          </View>
        </View>
      </View>

      <Text style={styles.footerBar}>
        If you have any Question about this Invoice, Please Contact KVQA
      </Text>

      <View style={styles.signBlock}>
        <Text style={styles.text}>FOR KVQA CERTIFICATION SERVICES PVT. LTD.</Text>
        <Image src={sign} style={styles.signImage} />
        <Text style={styles.text}>AUTHORIZED SIGNATORY</Text>
      </View>

      <Text style={styles.thankYou}>__________________________Thank You for Your Business______________________________</Text>
    </View>
  );
};

export default InvoiceLayout;