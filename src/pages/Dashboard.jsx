import React, { useState } from "react";
import { PDFViewer, PDFDownloadLink } from "@react-pdf/renderer";

import ContractProposalPDF from "../Pdf/QuoatationPdf";
import InvoicePdf from "../Pdf/InvoicePdf";

const Dashboard = () => {
  const [previewType, setPreviewType] = useState(null); // "quotation" | "invoice"

  const renderPreview = () => {
    if (previewType === "quotation") return <ContractProposalPDF />;
    if (previewType === "invoice") return <InvoicePdf />;
    return null;
  };

  return (
    <div className="h-screen w-full flex flex-col">
      {/* ===== TOP BAR ===== */}
      <div className="flex items-center gap-4 p-4 border-b bg-white">

        {/* ===== QUOTATION ===== */}
        <button
          onClick={() => setPreviewType("quotation")}
          className="px-4 py-2 rounded-md bg-blue-600 text-white font-medium hover:bg-blue-700"
        >
          Preview Quotation
        </button>

        <PDFDownloadLink
          document={<ContractProposalPDF />}
          fileName="KVQA-Contract-Proposal.pdf"
        >
          {({ loading }) => (
            <button
              className="px-4 py-2 rounded-md bg-green-600 text-white font-medium hover:bg-green-700"
              disabled={loading}
            >
              {loading ? "Preparing..." : "Download Quotation"}
            </button>
          )}
        </PDFDownloadLink>

        {/* ===== INVOICE ===== */}
        <button
          onClick={() => setPreviewType("invoice")}
          className="px-4 py-2 rounded-md bg-indigo-600 text-white font-medium hover:bg-indigo-700"
        >
          Preview Invoice
        </button>

        <PDFDownloadLink
          document={<InvoicePdf />}
          fileName="Invoice.pdf"
        >
          {({ loading }) => (
            <button
              className="px-4 py-2 rounded-md bg-emerald-600 text-white font-medium hover:bg-emerald-700"
              disabled={loading}
            >
              {loading ? "Preparing..." : "Download Invoice"}
            </button>
          )}
        </PDFDownloadLink>
      </div>

      {/* ===== PREVIEW AREA ===== */}
      {previewType ? (
        <div className="flex-1">
          <PDFViewer width="100%" height="100%">
            {renderPreview()}
          </PDFViewer>
        </div>
      ) : (
        <div className="flex-1 flex items-center justify-center text-gray-400 text-sm">
          Select Preview to view the document
        </div>
      )}
    </div>
  );
};

export default Dashboard;
