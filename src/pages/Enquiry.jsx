import {
  FaPlus,
  FaSearch,
  FaFileExcel,
  FaFilePdf,
  FaEye,
  FaEnvelope,
  FaChevronLeft,
  FaList,
  FaSortUp,
  FaSortDown,
  FaClipboardList,
   FaCheckCircle, 
   FaTimesCircle, 
   FaPaperPlane
} from "react-icons/fa";
import RightSideDrawer from "../components/RightSideDrawer";
import { useState, useMemo } from "react";
import { useNavigate } from "react-router-dom";
import enquiryMenuConfig from "../menuConfig/enquiryMenuConfig";

/* MOCK DATA */
const enquiries = [
  { id: 1, name: "abc", phone: "1234567890", mail: "abc@mail.com", status: "Signed" },
  { id: 2, name: "demo name", phone: "1234567890", mail: "a@mail.com", status: "Signed" },
  { id: 3, name: "abcd", phone: "1234567890", mail: "a@mail.com", status: "Expired" },
  { id: 4, name: "xyz", phone: "9876543210", mail: "x@mail.com", status: "Signed" },
  { id: 5, name: "test", phone: "9999999999", mail: "t@mail.com", status: "Expired" }
];

export default function Enquiry() {
  const navigate = useNavigate();
  const [menuOpen, setMenuOpen] = useState(false);

  /* PAGINATION */
  const rowsPerPage = 3;
  const [currentPage, setCurrentPage] = useState(1);

  /* COLUMN VISIBILITY */
  const [visibleColumns, setVisibleColumns] = useState({
    id: true,
    name: true,
    phone: true,
    mail: true,
    status: true,
    action: true
  });

  /* SORTING */
  const [sortConfig, setSortConfig] = useState({
    key: null,
    direction: null // "asc" | "desc"
  });

  /* TOGGLE SORT */
  const handleSort = (key) => {
    setCurrentPage(1);
    setSortConfig((prev) => {
      if (prev.key !== key) return { key, direction: "asc" };
      if (prev.direction === "asc") return { key, direction: "desc" };
      if (prev.direction === "desc") return { key: null, direction: null };
      return prev;
    });
  };

  /* SORTED DATA */
  const sortedData = useMemo(() => {
    if (!sortConfig.key) return enquiries;

    return [...enquiries].sort((a, b) => {
      const aVal = a[sortConfig.key];
      const bVal = b[sortConfig.key];

      if (aVal < bVal) return sortConfig.direction === "asc" ? -1 : 1;
      if (aVal > bVal) return sortConfig.direction === "asc" ? 1 : -1;
      return 0;
    });
  }, [sortConfig]);

  /* PAGINATED DATA */
  const totalPages = Math.ceil(sortedData.length / rowsPerPage);

  const paginatedData = useMemo(() => {
    const start = (currentPage - 1) * rowsPerPage;
    return sortedData.slice(start, start + rowsPerPage);
  }, [sortedData, currentPage]);

  /* COLUMN FILTER */
  const toggleColumn = (key) => {
    setVisibleColumns((prev) => ({ ...prev, [key]: !prev[key] }));
  };

  /* SORT ICON */
  const SortIcon = ({ column }) => {
    if (sortConfig.key !== column) return <FaSortUp className="opacity-30" />;
    return sortConfig.direction === "asc" ? (
      <FaSortUp />
    ) : (
      <FaSortDown />
    );
  };

  return (
    <div className="space-y-4">

      {/* RIGHT DRAWER TOGGLE */}
      <button
        onClick={() => setMenuOpen(true)}
        className="fixed right-0 top-[180px] z-30 bg-[#cf1b2b] text-white w-10 h-14 rounded-l-xl flex items-center justify-center shadow-lg"
      >
        <FaChevronLeft />
      </button>

      <RightSideDrawer
        open={menuOpen}
        onClose={() => setMenuOpen(false)}
        title="Client Section"
        sections={enquiryMenuConfig}
      />

      {/* CARD */}
      <div className="bg-white rounded-xl shadow p-6">

        {/* HEADER */}
        <div className="flex items-center justify-between mb-4">
          <div className="flex items-center gap-1">
            <FaClipboardList className="text-[#cf1b2b] text-2xl" />
            <h2 className="text-xl font-semibold">Enquiry List</h2>
          </div>

          <button
            onClick={() => navigate("/addEnquiry")}
            className="flex items-center gap-2 bg-[#cf1b2b] text-white rounded-full px-6 py-2 font-medium hover:bg-red-700"
          >
            <FaPlus />
            ADD ENQUIRY
          </button>
        </div>

        {/* FILTER */}
        <div className="flex flex-wrap gap-6 text-sm mb-4">
          {[
            ["id", "ENQUIRY ID"],
            ["name", "ENQUIRY NAME"],
            ["phone", "PHONE"],
            ["mail", "MAIL"],
            ["status", "KAF 01 STATUS"]
          ].map(([key, label]) => (
            <label key={key} className="flex items-center gap-2">
              <input
                type="checkbox"
                checked={visibleColumns[key]}
                onChange={() => toggleColumn(key)}
              />
              {label}
            </label>
          ))}
        </div>

        {/* TABLE TOOLS */}
<div className="flex items-center justify-between mb-3">
  
  {/* EXPORT BUTTONS */}
  <div className="flex gap-3">
    <button className="flex items-center gap-2 bg-green-700 text-white px-4 py-2 rounded hover:bg-green-800">
      <FaFileExcel /> XLS
    </button>

    <button className="flex items-center gap-2 bg-red-600 text-white px-4 py-2 rounded hover:bg-red-700">
      <FaFilePdf /> PDF
    </button>
  </div>

  {/* SEARCH */}
  <div className="relative">
    <FaSearch className="absolute left-3 top-1/2 -translate-y-1/2 text-gray-500" />
    <input
      type="text"
      placeholder="Search records"
      className="pl-10 pr-4 py-2 border rounded-full focus:outline-none focus:ring-2 focus:ring-gray-300"
    />
  </div>
</div>


        {/* TABLE */}
        <div className="overflow-x-auto">
          <table className="w-full border">
            <thead>
              <tr className="bg-black text-white text-sm">
                {visibleColumns.id && (
                  <th className="px-4 py-3 cursor-pointer" onClick={() => handleSort("id")}>
                    <div className="flex items-center justify-center gap-1">
                      ENQUIRY ID <SortIcon column="id" />
                    </div>
                  </th>
                )}

                {visibleColumns.name && (
                  <th className="px-4 py-3 cursor-pointer" onClick={() => handleSort("name")}>
                    <div className="flex items-center justify-center gap-1">
                      ENQUIRY NAME <SortIcon column="name" />
                    </div>
                  </th>
                )}

                {visibleColumns.phone && (
                  <th className="px-4 py-3 cursor-pointer" onClick={() => handleSort("phone")}>
                    <div className="flex items-center justify-center gap-1">
                      PHONE <SortIcon column="phone" />
                    </div>
                  </th>
                )}

                {visibleColumns.mail && (
                  <th className="px-4 py-3 cursor-pointer" onClick={() => handleSort("mail")}>
                    <div className="flex items-center justify-center gap-1">
                      MAIL <SortIcon column="mail" />
                    </div>
                  </th>
                )}

                {visibleColumns.status && (
                  <th className="px-4 py-3 cursor-pointer" onClick={() => handleSort("status")}>
                    <div className="flex items-center justify-center gap-1">
                      KAF 01 STATUS <SortIcon column="status" />
                    </div>
                  </th>
                )}

                {visibleColumns.action && <th className="px-4 py-3">TAKE ACTION</th>}
              </tr>
            </thead>

            <tbody>
              {paginatedData.map((e) => (
                <tr key={e.id} className="border-b text-sm">
                  {visibleColumns.id && <td className="px-4 py-3 text-center">{e.id}</td>}
                  {visibleColumns.name && <td className="px-4 py-3 text-center">{e.name}</td>}
                  {visibleColumns.phone && <td className="px-4 py-3 text-center">{e.phone}</td>}
                  {visibleColumns.mail && <td className="px-4 py-3 text-center">{e.mail}</td>}

{visibleColumns.status && (
  <td className="px-4 py-3 text-center">
    {e.status === "Signed" && (
      <span className="inline-flex items-center gap-1 bg-green-500 text-white px-3 py-1 rounded text-xs font-semibold">
        <FaCheckCircle /> Signed
      </span>
    )}

    {e.status === "Expired" && (
      <span className="inline-flex items-center gap-1 bg-red-500 text-white px-3 py-1 rounded text-xs font-semibold">
        <FaTimesCircle /> Expired
      </span>
    )}

    {e.status === "Sent" && (
      <span className="inline-flex items-center gap-1 bg-sky-500 text-white px-3 py-1 rounded text-xs font-semibold">
        <FaPaperPlane /> Sent
      </span>
    )}
  </td>
)}


                  {visibleColumns.action && (
  <td className="px-4 py-3">
    <div className="flex justify-center gap-3">

      {/* SIGNED → VIEW + ADD */}
      {e.status === "Signed" && (
        <>
          <div className="relative group">
            <button className="bg-gray-200 text-[#cf1b2b] p-2 rounded-full">
              <FaEye />
            </button>
            <span className="absolute -top-8 left-1/2 -translate-x-1/2 
              bg-gray-500 text-white text-xs px-2 py-1 rounded 
              opacity-0 group-hover:opacity-100 transition">
              View
            </span>
          </div>

          <div className="relative group">
            <button className="bg-gray-200 text-[#cf1b2b] p-2 rounded-full">
              <FaPlus />
            </button>
            <span className="absolute -top-8 left-1/2 -translate-x-1/2 
              bg-gray-500 text-white text-xs px-2 py-1 rounded 
              opacity-0 group-hover:opacity-100 transition">
              Add
            </span>
          </div>
        </>
      )}

      {/* SENT OR EXPIRED → ENVELOPE */}
      {(e.status === "Sent" || e.status === "Expired") && (
        <div className="relative group">
          <button className="bg-gray-200 text-[#cf1b2b] p-2 rounded-full">
            <FaEnvelope />
          </button>
          <span className="absolute -top-8 left-1/2 -translate-x-1/2 
            bg-gray-500 text-white text-xs px-2 py-1 rounded 
            opacity-0 group-hover:opacity-100 transition">
            Send
          </span>
        </div>
      )}

    </div>
  </td>
)}

                </tr>
              ))}
            </tbody>
          </table>
        </div>

        {/* PAGINATION */}
        <div className="flex items-center justify-between mt-6 text-sm">
          <span>
            Showing {(currentPage - 1) * rowsPerPage + 1} to{" "}
            {Math.min(currentPage * rowsPerPage, sortedData.length)} of{" "}
            {sortedData.length} entries
          </span>

          <div className="flex items-center gap-2">
            <button
              disabled={currentPage === 1}
              onClick={() => setCurrentPage((p) => p - 1)}
              className="border px-4 py-1 rounded-full disabled:opacity-40"
            >
              Previous Page
            </button>

            <button className="bg-black text-white w-8 h-8 rounded-full">
              {currentPage}
            </button>

            <button
              disabled={currentPage === totalPages}
              onClick={() => setCurrentPage((p) => p + 1)}
              className="border px-4 py-1 rounded-full disabled:opacity-40"
            >
              Next Page
            </button>
          </div>
        </div>
      </div>
    </div>
  );
}
