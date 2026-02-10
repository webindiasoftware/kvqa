 export function FormField({ label, required, children }) {
  return (
    <div>
      <label className="block text-xs font-medium text-gray-700 mb-1">
        {required && <span className="text-red-500 mr-1">*</span>}
        {label}
      </label>
      {children}
    </div>
  );
}

/* ---------- REUSABLE UI ---------- */

export function Label({ children, required }) {
  return (
    <label className="block text-xs font-semibold uppercase mb-2">
      {required && <span className="text-red-600 mr-1">*</span>}
      {children}
    </label>
  );
}

export function FormInput({ label, required, ...props }) {
  return (
    <div>
      <Label required={required}>{label}</Label>
      <input className="input" {...props} />
    </div>
  );
}

export function FormSelect({ label, required, ...props }) {
  return (
    <div>
      <Label required={required}>{label}</Label>
      <select className="input" {...props}>
        <option value="">{props.placeholder}</option>
      </select>
    </div>
  );
}


export function FormTextarea({ label, required, placeholder }) {
  return (
    <div>
      <Label required={required}>{label}</Label>
      <textarea
        className="w-full min-h-[110px] border border-gray-300 rounded-lg px-4 py-3 text-sm
                   focus:outline-none focus:ring-1 focus:ring-[#cf1b2b]"
        placeholder={placeholder}
      />
    </div>
  );
}
