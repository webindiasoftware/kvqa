/* ===========================
   KAF-02 QUESTIONS (4 STEPS)
   =========================== */

export const STEP_1 = [
  { name: "auditNumber", label: "Audit Number", type: "text", required: true },
  { name: "clientName", label: "Client Name", type: "text", required: true },
  { name: "preparedBy", label: "Prepared By", type: "text", required: true },
  { name: "datePrepared", label: "Date Prepared", type: "date", required: true },
  { name: "hoAddress", label: "Head Office Address", type: "textarea", required: true },
  {
    name: "otherHO",
    label:
      "Does company have Head office else where in the city? If yes, where & what are the processed covered in HO",
    type: "yesno-text",
    required: true,
  },
  {
    name: "statutoryCompliance",
    label:
      "Does company comply to all the applicable statutory and regulatory requirements? (Provide Detail)",
    type: "textarea",
    required: true,
  },
  { name: "factoryLicense", label: "Factory License No.", type: "text", required: true },
  { name: "gstNo", label: "GST No.", type: "text", required: true },
  { name: "fireLicense", label: "Fire license No.", type: "text", required: true },
  { name: "pollutionNoc", label: "Pollution NOC", type: "text", required: true },
  {
    name: "hsImplemented",
    label:
      "Does company have minimum level of Health & Safety standards implemented in the company?",
    type: "yesno",
    required: true,
  },
  {
    name: "sisterConcern",
    label:
      "Is company having any sister concern/family business (If any please provide detail activities)",
    type: "yesno-text",
    required: true,
  },
  {
    name: "workerUnrest",
    label:
      "Did company ever go through/face workers strike OR unrest in the past? (If Yes Please provide details)",
    type: "yesno-text",
    required: true,
  },
  { name: "eacCode", label: "EAC Code", type: "text", required: true },
  { name: "naceCode", label: "NACE Code", type: "text", required: true },
  {
    name: "saAuditLast6Months",
    label: "Any SA 8000 Audit in the last 6 months",
    type: "yesno",
    required: true,
  },
];

export const STEP_2 = [
  { name: "totalWorkers", label: "Total number of workers", type: "number", required: true },
  { name: "womenWorkers", label: "Women", type: "number", required: true },
  { name: "menWorkers", label: "Men", type: "number", required: true },
  { name: "migrantWomen", label: "Migrant Women", type: "number", required: true },
  { name: "migrantMen", label: "Migrant Men", type: "number", required: true },
  { name: "homeWorkers", label: "Home Worker", type: "number", required: true },
  { name: "whiteCollar", label: "Managers / White Collars", type: "number", required: true },
  { name: "contractWorkers", label: "Contract service suppliers", type: "number", required: true },
  { name: "skilled", label: "No of skilled workers", type: "number", required: true },
  { name: "semiSkilled", label: "No of semi-skilled workers", type: "number", required: true },
  { name: "unSkilled", label: "No of unskilled workers", type: "number", required: true },
  { name: "pieceRate", label: "No of workers on piece rate", type: "yesno", required: true },
  { name: "useHomeWorkers", label: "Use of home workers, if any?", type: "yesno", required: true },
  { name: "wageUnskilled", label: "Minimum wage – Unskilled", type: "number", required: true },
  { name: "wageSemiSkilled", label: "Minimum wage – Semi-skilled", type: "number", required: true },
  { name: "wageSkilled", label: "Minimum wage – Skilled", type: "number", required: true },
  { name: "wageHighlySkilled", label: "Minimum wage – Highly Skilled", type: "number", required: true },
  { name: "livingWage", label: "Living wage calculated by the company", type: "yesno", required: true },
  { name: "industryWage", label: "Industry prevalent wage (If any)", type: "yesno", required: true },
  { name: "workingHours", label: "Working Hours", type: "text", required: true },
  { name: "noOfShifts", label: "No of Shifts", type: "number", required: true },
  { name: "shiftTiming", label: "Shift Timings", type: "text", required: true },
  { name: "lunchBreak", label: "Lunch Break", type: "text", required: true },
];

export const STEP_3 = [
  { name: "outsourcing", label: "Outsourcing process, (if any)", type: "yesno", required: true },
  { name: "seasonalBusiness", label: "Whether it's a seasonal product/business", type: "yesno", required: true },
  {
    name: "otherCertifications",
    label: "Does the company have any other certification? If yes, what?",
    type: "textarea",
    required: true,
  },
  {
    name: "scope",
    label:
      "Scope (Manufacturing OR Service delivery process Outsourcing process, Exclusive supplier & Details of all Processes)",
    type: "textarea",
    required: true,
  },
  {
    name: "productionProcess",
    label: "The main production processes are",
    type: "textarea",
    required: true,
  },
  {
    name: "additionalLocations",
    label: "Additional Locations Name & Address",
    type: "textarea",
    required: false,
  },
  { name: "legalInfo", label: "Legal/Regulatory Info. Available?", type: "yesno", required: true },
  { name: "localNorms", label: "Local Norms/Other Data Available?", type: "yesno", required: true },
  { name: "ngoInfo", label: "Local NGO Information Available?", type: "yesno", required: true },
  {
    name: "languages",
    label:
      "Special Language Ability Required? (Specify the Language spoken by majority of workers)",
    type: "text",
    required: true,
  },
  { name: "specialistRequired", label: "Specialist Required?", type: "yesno", required: true },
  { name: "technicalExpert", label: "Technical Expert Required?", type: "yesno", required: true },
  {
    name: "hazardCategory",
    label: "Check the Hazard category of Industry Sector",
    type: "text",
    required: true,
  },
];

export const STEP_4 = [
  {
    name: "consultantContract",
    label: "Consultant contract agreement verified (date)",
    type: "date",
    required: true,
  },
  {
    name: "consultantTransparency",
    label:
      "Is the consultant's responsibilities and relationship with the organization's management transparent?",
    type: "yesno",
    required: true,
  },
  {
    name: "managementControl",
    label:
      "Is the company management shall retain overall control of SA8000-related services provided by consultant?",
    type: "yesno",
    required: true,
  },
  {
    name: "consultantAccountability",
    label: "Is Consultant accountability in company's management clearly defined?",
    type: "yesno",
    required: true,
  },
  {
    name: "countryRisk",
    label: "COUNTRY RISK CATEGORY (as per WGI risk ranking)",
    type: "select",
    options: ["Highest risk", "High risk", "Lower risk"],
    required: true,
  },
  { name: "comments", label: "Comments and/or Notes", type: "textarea", required: false },
];

export const STEPS = [STEP_1, STEP_2, STEP_3, STEP_4];