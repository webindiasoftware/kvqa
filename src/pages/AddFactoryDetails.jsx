import { useState } from "react";
import { Label } from "../components/FormFeild";

export default function AddFactoryDetails() {
  const [formData, setFormData] = useState({
    client: "",
    factoryName: "",
    address1: "",
    address2: "",
    address3: "",
    country: "",
    state: "",
    city: "",
    pin: "",
    sezStatus: "Yes",
    visibility: "Active",
  });

  const handleChange = (e) => {
    const { name, value } = e.target;
    setFormData((p) => ({ ...p, [name]: value }));
  };

  const handleSave = () => {
    console.log("FACTORY DATA 👉", formData);
  };

  return (
    <div className="bg-white rounded-xl p-8 shadow-sm">

      {/* HEADER */}
      <div className="flex items-center justify-between mb-10">
        <h1 className="text-[#cf1b2b] text-xl font-semibold">
          Add Factory Details
        </h1>

        <button className="bg-[#cf1b2b] text-white px-8 py-3 rounded-full text-sm font-semibold">
          VIEW LIST
        </button>
      </div>

      {/* FORM GRID */}
      <div className="grid grid-cols-1 md:grid-cols-3 gap-6">

        <div>
          <Label required>Select Client</Label>
          <select name="client" onChange={handleChange} className="input">
            <option>Select Client</option>
          </select>
        </div>

        <div>
          <Label required>Factory Name</Label>
          <input
            name="factoryName"
            onChange={handleChange}
            className="input"
            placeholder="Enter Factory Name"
          />
        </div>

        <div>
          <Label required>Factory Address Line 1</Label>
          <input
            name="address1"
            onChange={handleChange}
            className="input"
            placeholder="Enter Address Line 1"
          />
        </div>

        <div>
          <Label>Factory Address Line 2</Label>
          <input
            name="address2"
            onChange={handleChange}
            className="input"
            placeholder="Enter Address Line 2"
          />
        </div>

        <div>
          <Label>Factory Address Line 3</Label>
          <input
            name="address3"
            onChange={handleChange}
            className="input"
            placeholder="Enter Address Line 3"
          />
        </div>

        <div>
          <Label required>Select Country</Label>
          <select name="country" onChange={handleChange} className="input">
            <option>Select Country</option>
          </select>
        </div>

        <div>
          <Label required>Select State</Label>
          <select name="state" onChange={handleChange} className="input">
            <option>Select State</option>
          </select>
        </div>

        <div>
          <Label required>Select City</Label>
          <select name="city" onChange={handleChange} className="input">
            <option>Select City</option>
          </select>
        </div>

        <div>
          <Label required>Pin Code</Label>
          <input
            name="pin"
            onChange={handleChange}
            className="input"
            placeholder="Enter Pin Code"
          />
        </div>

        {/* SEZ STATUS */}
        <div>
          <Label>Sez Site Status</Label>
          <div className="flex gap-6 mt-2">
            <label>
              <input
                type="radio"
                name="sezStatus"
                value="Yes"
                checked={formData.sezStatus === "Yes"}
                onChange={handleChange}
              />{" "}
              Yes
            </label>
            <label>
              <input
                type="radio"
                name="sezStatus"
                value="No"
                checked={formData.sezStatus === "No"}
                onChange={handleChange}
              />{" "}
              No
            </label>
          </div>
        </div>

        {/* VISIBILITY */}
        <div>
          <Label>Visibility Status</Label>
          <div className="flex gap-6 mt-2">
            <label>
              <input
                type="radio"
                name="visibility"
                value="Active"
                checked={formData.visibility === "Active"}
                onChange={handleChange}
              />{" "}
              Active
            </label>
            <label>
              <input
                type="radio"
                name="visibility"
                value="Inactive"
                checked={formData.visibility === "Inactive"}
                onChange={handleChange}
              />{" "}
              Inactive
            </label>
          </div>
        </div>

      </div>

      {/* SAVE */}
      <div className="mt-12">
        <button
          onClick={handleSave}
          className="bg-[#cf1b2b] hover:bg-red-700 text-white px-12 py-3 rounded-full font-semibold"
        >
          SAVE FACTORY DETAILS
        </button>
      </div>
    </div>
  );
}
