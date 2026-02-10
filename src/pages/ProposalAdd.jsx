import { FaCalendarAlt } from "react-icons/fa";
import { FormSelect, Label , FormInput } from "../components/FormFeild";

export default function ProposalAdd() {
  return (
    <div className="bg-white rounded-xl p-8 shadow-sm">
      {/* FORM GRID */}
      <div className="grid grid-cols-1 md:grid-cols-2 gap-x-8 gap-y-6">

        {/* CLIENT NAME */}
        <FormSelect label="Client Name" required placeholder="Select Client" />

        {/* ISSUE DATE */}
        <div>
          <Label required>Contract Proposal Issue Date</Label>
          <div className="relative">
            <input
              type="text"
              value="03/02/2026"
              className="input pr-14"
              readOnly
            />
            <button className="absolute right-0 top-0 h-full w-14 bg-[#cf1b2b] rounded-r-lg flex items-center justify-center text-white">
              <FaCalendarAlt />
            </button>
          </div>
        </div>

        {/* PROJECT DURATION */}
        <FormSelect label="Project Duration" required placeholder="Select Project Duration" />

        {/* SERVICE */}
        <FormSelect label="Service" required placeholder="Select Service" />

      </div>

      {/* SECONDARY SERVICE */}
      <div className="mt-10">
        <Label required>Secondary Service(s)</Label>

        <div className="overflow-x-auto mt-3">
          <table className="w-full border-collapse">
            <thead className="bg-black text-white text-xs">
              <tr>
                <th className="px-4 py-3 text-left">S. NO.</th>
                <th className="px-4 py-3 text-left">STANDARD</th>
                <th className="px-4 py-3 text-left">
                  STANDARD VALIDITY<br />PERIOD (IN YEARS)
                </th>
                <th className="px-4 py-3 text-left">
                  NUMBER OF SURVEILLANCE AUDITS<br />
                  DUE IN THE CERTIFICATION PERIOD
                </th>
                <th className="px-4 py-3 text-center">
                  TICK TO SELECT <span className="text-yellow-400">▢</span>
                </th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td colSpan={5} className="h-14 border-b"></td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>

      {/* LOWER FORM */}
      <div className="grid grid-cols-1 md:grid-cols-2 gap-x-8 gap-y-6 mt-10">

        <FormSelect label="Payment Phase" required placeholder="Select Payment Phase" />
        <FormSelect label="Surveillance Audit Type" required placeholder="Select Surveillance Audit" />

        <FormSelect label="Accreditation Required" required placeholder="Select Accreditation" />
        <FormInput label="Annexure B Term Category Selection" required placeholder="Select Annexure B Term Category" />

        {/* ANNEXURE C */}
        <div className="md:col-span-1">
          <Label required>Annexure C Reflection Applicable</Label>
          <div className="input flex items-center justify-between">
            <span className="text-gray-400">Select Appropriate Option</span>
            <div className="flex gap-6 text-sm">
              <label className="flex items-center gap-1">
                <input type="radio" name="annexure" />
                Yes
              </label>
              <label className="flex items-center gap-1">
                <input type="radio" name="annexure" defaultChecked />
                No
              </label>
            </div>
          </div>
        </div>

      </div>

      {/* BUTTON */}
      <div className="mt-12">
        <button className="bg-[#cf1b2b] hover:bg-red-700 transition text-white px-8 py-3 rounded-full font-semibold text-sm">
          CONTINUE TO NEXT PAGE
        </button>
      </div>
    </div>
  );
}

