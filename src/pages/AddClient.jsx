import { FaSyncAlt, FaMobileAlt, FaChevronLeft } from "react-icons/fa";
import { FormSelect, Label, FormInput } from "../components/FormFeild";
import RightSideDrawer from "../components/RightSideDrawer";

import { useState } from "react";
import enquiryMenuConfig from "../menuConfig/enquiryMenuConfig";

export default function AddClient() {
  const [menuOpen, setMenuOpen] = useState(false);

  const [formData, setFormData] = useState({
    gstin: "",
    pan: "",
    clientName: "",
    contact: "",
    email: "",
    website: "",
    description: "",
    country: "",
    state: "",
    city: "",
    pincode: "",
    manager: ""
  });

  const handleChange = (e) => {
    const { name, value } = e.target;
    setFormData((prev) => ({ ...prev, [name]: value }));
  };

  const handleSave = () => {
    console.log("ENQUIRY DATA 👉", formData);
  };

  return (
    <div className="bg-white rounded-xl p-8 shadow-sm">

      {/* PAGE HEADER */}
      <div className="flex items-center justify-between mb-8">
        <h1 className="text-[#cf1b2b] text-xl font-semibold">
          Add Client
        </h1>

        <button className="bg-[#cf1b2b] text-white text-xs px-6 py-4 rounded-full">
          VIEW LIST
        </button>
      </div>

               <button
              onClick={() => setMenuOpen(true)}
              className="fixed right-0 top-[180px] z-30 bg-[#cf1b2b] text-white w-10 h-14 rounded-l-xl flex items-center justify-center shadow-lg"
            >
              <FaChevronLeft />
            </button>

      {/* SIDE DRAWER */}
      <RightSideDrawer
        open={menuOpen}
        onClose={() => setMenuOpen(false)}
        title="Client Section"
        sections={enquiryMenuConfig}
      />

      {/* FORM GRID */}
      <div className="grid grid-cols-1 md:grid-cols-2 gap-x-8 gap-y-6">

        {/* GSTIN */}
        <div>
          <Label>Client GSTIN Number</Label>
          <div className="relative">
            <input
              name="gstin"
              value={formData.gstin}
              onChange={handleChange}
              className="input pr-14"
              placeholder="Enter Client GSTIN Number"
            />
            <button
              type="button"
              className="absolute right-0 top-0 h-full w-14 bg-[#cf1b2b] rounded-r-lg flex items-center justify-center text-white"
            >
              <FaSyncAlt />
            </button>
          </div>
        </div>

        {/* PAN */}
        <FormInput
          label="Client PAN Number"
          placeholder="Client PAN Number"
          value={formData.pan}
          onChange={handleChange}
          name="pan"
        />

        {/* NAME */}
        <FormInput
          label="Client Name"
          required
          placeholder="Enter Client Name"
          value={formData.clientName}
          onChange={handleChange}
          name="clientName"
        />

        {/* CONTACT */}
        <div>
          <Label>Contact Number</Label>
          <div className="relative">
            <input
              name="contact"
              value={formData.contact}
              onChange={handleChange}
              className="input pr-14"
              placeholder="Enter Landline Number"
            />
            <div className="absolute right-0 top-0 h-full w-14 bg-[#cf1b2b] rounded-r-lg flex items-center justify-center text-white">
              <FaMobileAlt />
            </div>
          </div>
        </div>

        {/* EMAIL */}
        <div>
          <Label>Email</Label>
          <div className="relative">
            <input
              name="email"
              value={formData.email}
              onChange={handleChange}
              className="input pr-14"
              placeholder="Enter Email"
            />
            <div className="absolute right-0 top-0 h-full w-14 bg-[#cf1b2b] rounded-r-lg flex items-center justify-center text-white">
              <FaMobileAlt />
            </div>
          </div>
        </div>

        {/* WEBSITE */}
        <FormInput
          label="Client Website URL"
          placeholder="Enter Client Website URL"
          value={formData.website}
          onChange={handleChange}
          name="website"
        />
      </div>

      {/* DESCRIPTION */}
      <div className="mt-10">
        <Label required>Enquiry Description</Label>
        <textarea
          name="description"
          value={formData.description}
          onChange={handleChange}
          className="w-full min-h-[120px] border border-gray-300 rounded-lg px-4 py-3 text-sm
                     focus:outline-none focus:ring-1 focus:ring-[#cf1b2b]"
          placeholder="Enter Enquiry Description"
        />
      </div>

      {/* ADDRESS GRID */}
      <div className="grid grid-cols-1 md:grid-cols-2 gap-x-8 gap-y-6 mt-10">

        <FormSelect
          label="Country"
          required
          placeholder="Select Country"
          name="country"
          value={formData.country}
          onChange={handleChange}
        />

        <FormSelect
          label="State"
          required
          placeholder="Select State"
          name="state"
          value={formData.state}
          onChange={handleChange}
        />

        <FormSelect
          label="City"
          required
          placeholder="Select City"
          name="city"
          value={formData.city}
          onChange={handleChange}
        />

        <FormInput
          label="Pincode"
          required
          placeholder="Enter Pincode"
          name="pincode"
          value={formData.pincode}
          onChange={handleChange}
        />

        <FormSelect
          label="Assigned Manager"
          required
          placeholder="Select Manager"
          name="manager"
          value={formData.manager}
          onChange={handleChange}
        />
      </div>

      {/* SAVE */}
      <div className="mt-12 text-right">
        <button
          type="button"
          onClick={handleSave}
          className="bg-[#cf1b2b] hover:bg-red-700 transition text-white px-10 py-3 rounded-full font-semibold text-sm"
        >
          SAVE
        </button>
      </div>

    </div>
  );
}
