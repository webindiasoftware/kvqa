import { NavLink, useLocation } from "react-router-dom";

export function Breadcrumb() {
  const location = useLocation();

  const pathnames = location.pathname
    .split("/")
    .filter(Boolean);

  const labelMap = {
    "": "Dashboard",
    "enquiry": "Enquiry",
    "clients": "Clients",
    "proposal": "Proposal",
    "kaf-01": "KAF 01",
    "kaf-02": "KAF 02",
    "addEnquiry" : "Add Enquiry"
  };

  return (
    <div className="bg-[#f3f6f9] px-6 py-4 text-sm flex items-center gap-1">
      <NavLink
        to="/"
        className="text-red-600 font-medium hover:underline"
      >
        Dashboard
      </NavLink>

      {pathnames.map((value, index) => {
        const to = `/${pathnames.slice(0, index + 1).join("/")}`;
        const isLast = index === pathnames.length - 1;

        return (
          <span key={to} className="flex items-center gap-1">
            <span className="mx-1">›</span>

            {isLast ? (
              <span className="text-gray-600">
                {labelMap[value] || value}
              </span>
            ) : (
              <NavLink
                to={to}
                className="text-red-600 hover:underline"
              >
                {labelMap[value] || value}
              </NavLink>
            )}
          </span>
        );
      })}
    </div>
  );
}
