import React from "react";
import { Document, Page, View } from "@react-pdf/renderer";
import styles from "./styles";
import { Header } from "./Common/Header";
import { Footer } from "./Common/Footer";
import Page1 from "./QouatationPdfPages/Page1";
import Page2 from "./QouatationPdfPages/Page2";
import Page3 from "./QouatationPdfPages/Page3";
import Page4 from "./QouatationPdfPages/Page4";
import Page7 from "./QouatationPdfPages/Page7";
import Page5 from "./QouatationPdfPages/Page5";
import Page6 from "./QouatationPdfPages/Page6";
import InvoiceLayout from "./InvoicePdfLayout/Invoicelayout";


export default function ContractProposalPDF() {
  return (
    <Document>
      <Page size="A4" style={styles.page}  wrap={true}>
        {/* Fixed elements */}
        <Header />
        <Footer />

        {/* Scrollable content */}
        <View style={styles.content}>
            <Page1/>
            <Page2/>  
            <Page3/>
            <Page4/>
            <Page5/>
            <Page6/>
            <Page7/>
            {/* <InvoiceLayout/> */}
        </View>
      </Page>
    </Document>
  );
}

// import { PDFDownloadLink } from "@react-pdf/renderer";
// import ContractProposalPDF from "./ContractProposalPDF";

// <PDFDownloadLink
//   document={<ContractProposalPDF />}
//   fileName="KVQA_Contract_Proposal.pdf"
// >
//   Download PDF
// </PDFDownloadLink>