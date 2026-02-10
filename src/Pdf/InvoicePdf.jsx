import React from "react";
import { Document, Page, View } from "@react-pdf/renderer";
import styles from "./styles";
import { Header } from "./Common/Header";
import { Footer } from "./Common/Footer";
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
            <InvoiceLayout/>
        </View>
      </Page>
    </Document>
  );
}