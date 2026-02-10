import { useState } from "react";
import { STEP_1, STEP_2, STEP_3, STEP_4, STEPS } from "../utils/Kaf2Steps";

/* ===========================
   COMPONENT
   =========================== */

export default function Kaf2() {
  const [step, setStep] = useState(0);
  const [formData, setFormData] = useState({});
  const [errors, setErrors] = useState({});
  const [submitted, setSubmitted] = useState(false);

  const setValue = (name, value) => {
    setFormData((p) => ({ ...p, [name]: value }));
    // Clear error for this field when user starts typing
    if (errors[name]) {
      setErrors((p) => ({ ...p, [name]: null }));
    }
  };

  // Clean up form data - remove details fields when "No" is selected
  const getCleanedFormData = () => {
    const cleaned = { ...formData };
    
    [...STEP_1, ...STEP_2, ...STEP_3, ...STEP_4].forEach((field) => {
      if (field.type === "yesno-text") {
        // If the answer is "No", remove the details field
        if (cleaned[field.name] === "No") {
          delete cleaned[`${field.name}_details`];
        }
      }
    });
    
    return cleaned;
  };

  const validateStep = () => {
    const currentStepFields = STEPS[step];
    const newErrors = {};

    currentStepFields.forEach((field) => {
      if (field.required) {
        const value = formData[field.name];
        
        if (!value || value === "" || value === null || value === undefined) {
          newErrors[field.name] = "This field is required";
        }
        
        // For yesno-text fields, validate details only if "Yes" is selected
        if (field.type === "yesno-text" && formData[field.name] === "Yes") {
          const detailsValue = formData[`${field.name}_details`];
          if (!detailsValue || detailsValue.trim() === "") {
            newErrors[`${field.name}_details`] = "Please provide details";
          }
        }
        
        // For number fields, check if it's a valid number
        if (field.type === "number" && value !== undefined && value !== "") {
          if (isNaN(value) || value < 0) {
            newErrors[field.name] = "Please enter a valid number";
          }
        }
      }
    });

    setErrors(newErrors);
    return Object.keys(newErrors).length === 0;
  };

  const renderField = (q) => {
    const hasError = errors[q.name];
    const errorClass = hasError ? "border-red-500" : "";

    if (q.type === "text")
      return (
        <>
          <input
            className={`input ${errorClass}`}
            value={formData[q.name] || ""}
            onChange={(e) => setValue(q.name, e.target.value)}
          />
          {hasError && <p className="text-red-500 text-xs mt-1">{hasError}</p>}
        </>
      );

    if (q.type === "number")
      return (
        <>
          <input
            type="number"
            className={`input ${errorClass}`}
            value={formData[q.name] || ""}
            onChange={(e) => setValue(q.name, e.target.value)}
            min="0"
          />
          {hasError && <p className="text-red-500 text-xs mt-1">{hasError}</p>}
        </>
      );

    if (q.type === "date")
      return (
        <>
          <input
            type="date"
            className={`input ${errorClass}`}
            value={formData[q.name] || ""}
            onChange={(e) => setValue(q.name, e.target.value)}
          />
          {hasError && <p className="text-red-500 text-xs mt-1">{hasError}</p>}
        </>
      );

    if (q.type === "textarea")
      return (
        <>
          <textarea
            className={`input min-h-[100px] ${errorClass}`}
            value={formData[q.name] || ""}
            onChange={(e) => setValue(q.name, e.target.value)}
          />
          {hasError && <p className="text-red-500 text-xs mt-1">{hasError}</p>}
        </>
      );

    if (q.type === "yesno")
      return (
        <>
          <div className="flex gap-4 mt-2">
            <label>
              <input
                type="radio"
                name={q.name}
                checked={formData[q.name] === "Yes"}
                onChange={() => setValue(q.name, "Yes")}
              />{" "}
              Yes
            </label>
            <label>
              <input
                type="radio"
                name={q.name}
                checked={formData[q.name] === "No"}
                onChange={() => setValue(q.name, "No")}
              />{" "}
              No
            </label>
          </div>
          {hasError && <p className="text-red-500 text-xs mt-1">{hasError}</p>}
        </>
      );

    if (q.type === "yesno-text") {
      const showDetails = formData[q.name] === "Yes";
      const detailsError = errors[`${q.name}_details`];
      
      return (
        <>
          <div className="flex gap-4 mt-2">
            <label>
              <input
                type="radio"
                name={q.name}
                checked={formData[q.name] === "Yes"}
                onChange={() => {
                  setValue(q.name, "Yes");
                }}
              />{" "}
              Yes
            </label>
            <label>
              <input
                type="radio"
                name={q.name}
                checked={formData[q.name] === "No"}
                onChange={() => {
                  setValue(q.name, "No");
                  // Clear the details field when "No" is selected
                  setValue(`${q.name}_details`, "");
                }}
              />{" "}
              No
            </label>
          </div>
          {hasError && <p className="text-red-500 text-xs mt-1">{hasError}</p>}
          
          {showDetails && (
            <>
              <textarea
                className={`input mt-2 ${detailsError ? "border-red-500" : ""}`}
                placeholder="Please provide details"
                value={formData[`${q.name}_details`] || ""}
                onChange={(e) => setValue(`${q.name}_details`, e.target.value)}
              />
              {detailsError && <p className="text-red-500 text-xs mt-1">{detailsError}</p>}
            </>
          )}
        </>
      );
    }

    if (q.type === "select")
      return (
        <>
          <select
            className={`input ${errorClass}`}
            value={formData[q.name] || ""}
            onChange={(e) => setValue(q.name, e.target.value)}
          >
            <option value="">Select</option>
            {q.options.map((o) => (
              <option key={o} value={o}>
                {o}
              </option>
            ))}
          </select>
          {hasError && <p className="text-red-500 text-xs mt-1">{hasError}</p>}
        </>
      );
  };

  const next = () => {
    if (validateStep()) {
      const cleanedData = getCleanedFormData();
      console.log(`STEP ${step + 1} SAVED`, cleanedData);
      setStep(step + 1);
    }
  };

  const back = () => {
    setStep(step - 1);
    setErrors({});
  };

  const submit = () => {
    if (validateStep()) {
      const cleanedData = getCleanedFormData();
      console.log("FINAL KAF-02 SUBMIT", cleanedData);
      setSubmitted(true);
    }
  };

  const getSummaryData = () => {
    const cleanedData = getCleanedFormData();
    
    return {
      step1: STEP_1.reduce((acc, field) => {
        acc[field.label] = cleanedData[field.name] || "N/A";
        if (field.type === "yesno-text" && cleanedData[field.name] === "Yes") {
          acc[`${field.label} (Details)`] = cleanedData[`${field.name}_details`] || "N/A";
        }
        return acc;
      }, {}),
      step2: STEP_2.reduce((acc, field) => {
        acc[field.label] = cleanedData[field.name] || "N/A";
        return acc;
      }, {}),
      step3: STEP_3.reduce((acc, field) => {
        acc[field.label] = cleanedData[field.name] || "N/A";
        return acc;
      }, {}),
      step4: STEP_4.reduce((acc, field) => {
        acc[field.label] = cleanedData[field.name] || "N/A";
        return acc;
      }, {}),
    };
  };

  if (submitted) {
    const summary = getSummaryData();
    return (
      <div className="bg-white p-8 rounded-xl shadow-sm max-w-4xl mx-auto">
        <h1 className="text-2xl font-bold text-[#cf1b2b] mb-6">
          KAF-02 Submission Summary
        </h1>

        {Object.entries(summary).map(([stepName, stepData]) => (
          <div key={stepName} className="mb-8">
            <h2 className="text-xl font-semibold text-gray-800 mb-4 capitalize border-b-2 border-[#cf1b2b] pb-2">
              {stepName.replace("step", "Step ")}
            </h2>
            <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
              {Object.entries(stepData).map(([label, value]) => (
                <div key={label} className="bg-gray-50 p-3 rounded">
                  <p className="text-xs font-medium text-gray-600 mb-1">{label}</p>
                  <p className="text-sm text-gray-900">{value}</p>
                </div>
              ))}
            </div>
          </div>
        ))}

        <div className="flex justify-center gap-4 mt-8">
          <button
            onClick={() => {
              setSubmitted(false);
              setStep(0);
            }}
            className="bg-gray-500 text-white px-8 py-3 rounded-full font-semibold hover:bg-gray-600"
          >
            Edit Form
          </button>
          <button
            onClick={() => {
              const finalData = getCleanedFormData();
              alert("Form data has been saved!");
              console.log("Final submission:", finalData);
              // Here you would send finalData to your API
            }}
            className="bg-green-600 text-white px-8 py-3 rounded-full font-semibold hover:bg-green-700"
          >
            Confirm & Save
          </button>
        </div>
      </div>
    );
  }

  return (
    <div className="bg-white p-8 rounded-xl shadow-sm max-w-5xl mx-auto">
      <h1 className="text-xl font-semibold text-[#cf1b2b] mb-4">
        KAF-02 Application Review
      </h1>

      <div className="flex items-center justify-between mb-6">
        <p className="text-sm text-gray-500">Step {step + 1} of 4</p>
        <div className="flex gap-2">
          {[0, 1, 2, 3].map((i) => (
            <div
              key={i}
              className={`h-2 w-12 rounded-full ${
                i <= step ? "bg-[#cf1b2b]" : "bg-gray-300"
              }`}
            />
          ))}
        </div>
      </div>

      <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
        {STEPS[step].map((q) => (
          <div key={q.name} className={q.type === "textarea" ? "md:col-span-2" : ""}>
            <label className="text-sm font-medium">
              {q.label}
              {q.required && <span className="text-red-500 ml-1">*</span>}
            </label>
            {renderField(q)}
          </div>
        ))}
      </div>

      <div className="flex justify-between mt-10">
        <button
          onClick={back}
          disabled={step === 0}
          className={`px-8 py-3 rounded-full font-semibold ${
            step === 0
              ? "bg-gray-300 text-gray-500 cursor-not-allowed"
              : "bg-gray-500 text-white hover:bg-gray-600"
          }`}
        >
          ← Back
        </button>

        {step < 3 ? (
          <button
            onClick={next}
            className="bg-[#cf1b2b] text-white px-10 py-3 rounded-full font-semibold hover:bg-[#b01828]"
          >
            Save & Next →
          </button>
        ) : (
          <button
            onClick={submit}
            className="bg-green-600 text-white px-10 py-3 rounded-full font-semibold hover:bg-green-700"
          >
            Submit KAF-02 ✓
          </button>
        )}
      </div>
    </div>
  );
}