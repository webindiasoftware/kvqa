import { FaMobileAlt, FaChevronLeft } from "react-icons/fa";
import { Label } from "../components/FormFeild";
import RightSideDrawer from "../components/RightSideDrawer";
import { useState } from "react";
import enquiryMenuConfig from "../menuConfig/enquiryMenuConfig";
import useEnquiry from "../hooks/useEnquiry";

export default function AddEnquiry() {
  const [menuOpen, setMenuOpen] = useState(false);
  const { addEnquiry, loading } = useEnquiry();

const [formData, setFormData] = useState({
  clientName: "",
  contact: "",
  email: "",
  message: ""
});

  const handleChange = (e) => {
    const { name, value } = e.target;
    setFormData((prev) => ({ ...prev, [name]: value }));
  };

const handleSave = async () => {
  const payload = {
    name: formData.clientName,
    contact: formData.contact,
    email: formData.email,
    message: formData.message
  };

  const res = await addEnquiry(payload);

  if (res?.success) {
    setFormData({
      clientName: "",
      contact: "",
      email: "",
      message: ""
    });
  }
};

  return (
    <div className="bg-white rounded-xl p-8 shadow-sm">

      {/* HEADER */}
      <div className="flex items-center justify-between mb-10">
        <h1 className="text-[#cf1b2b] text-xl font-semibold">Add Enquiry</h1>

        <button className="bg-[#cf1b2b] text-white px-8 py-3 rounded-full text-sm font-semibold">
          VIEW LIST
        </button>
      </div>

      {/* RIGHT DRAWER BUTTON */}
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

      {/* FORM */}
      <div className="grid grid-cols-1 md:grid-cols-2 gap-8">

        {/* CLIENT NAME */}
        <div>
          <Label required>Client Name</Label>
          <input
            name="clientName"
            value={formData.clientName}
            onChange={handleChange}
            className="input"
            placeholder="Enter Client Name"
          />
        </div>

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
        <div className="md:col-span-1">
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

<div className="md:col-span-2">
  <Label>Message</Label>
  <textarea
    name="message"
    value={formData.message}
    onChange={handleChange}
    className="w-full min-h-[120px] border border-gray-300 rounded-lg px-4 py-3 text-sm
               focus:outline-none focus:ring-1 focus:ring-[#cf1b2b]"
    placeholder="Enter enquiry message"
  />
</div>

      </div>

      {/* SAVE */}
      <div className="mt-16 text-right">
        <button
          onClick={handleSave}
          className="bg-[#cf1b2b] hover:bg-red-700 text-white px-12 py-3 rounded-full font-semibold disabled:opacity-50"
        >
         {loading ? "Saving..." : "SAVE"}
        </button>
      </div>

    </div>
  );
}
