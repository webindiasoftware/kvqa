import { Outlet, NavLink, useNavigate } from "react-router-dom";
import { useState } from "react";
import {
  FaSignOutAlt,
  FaTachometerAlt,
  FaUsers,
  FaFileAlt,
  FaCog,
  FaThLarge,
  FaChevronLeft,
  FaChevronRight,
  FaList,
} from "react-icons/fa";
import { Breadcrumb } from "./Breadcrumb";
import useAuth from "../hooks/useAuth";

export default function AppLayout() {
  const navigate = useNavigate();
  const [collapsed, setCollapsed] = useState(true); // default CLOSED

  const { logoutUser } = useAuth();

  const logout = () => {
    logoutUser();       
    navigate("/login");
  };

  return (
    <div className="min-h-screen flex bg-[#f3f6f9]">
      {/* SIDEBAR */}
      <aside
        className={`bg-white  flex flex-col transition-all duration-300 ease-in-out ${
          collapsed ? "w-[80px]" : "w-[200px]"
        }`}
      >
        {/* Logo */}
        <div className="h-[90px] flex items-center justify-center relative">
          <img
            src="https://kvqaeast.com/images/logo.png"
            alt="KVQA"
            className={`transition-all duration-300 ${
              collapsed ? "h-0" : "h-20"
            }`}
          />

          {/* Toggle */}
          <button
            onClick={() => setCollapsed(!collapsed)}
            className="absolute right-2 top-1\2 -translate-y-1/2 w-8 h-8 rounded-full bg-[#cf1b2b] text-white flex items-center justify-center shadow"
          >
            {collapsed ? <FaChevronRight /> : <FaChevronLeft />}
          </button>
        </div>

        {/* Menu */}
        <nav className="px-2 py-6 space-y-2 text-sm font-medium">
          <SideLink
            to="/"
            icon={<FaTachometerAlt />}
            label="Dashboard"
            collapsed={collapsed}
          />

          <SideLink
          to="/enquiry"
          icon={<FaList />} 
          label="Enquiry" 
          collapsed={collapsed} />

          <SideLink
            to="/clients"
            icon={<FaUsers />}
            label="Clients"
            collapsed={collapsed}
          />
          <SideLink
            to="/proposal/add"
            icon={<FaFileAlt />}
            label="Proposal Add"
            collapsed={collapsed}
          />
          <SideLink
            to="/kaf-01"
            icon={<FaFileAlt />}
            label="KAF 01"
            collapsed={collapsed}
          />
          <SideLink
            to="/kaf-02"
            icon={<FaFileAlt />}
            label="KAF 02"
            collapsed={collapsed}
          />
        </nav>
      </aside>

      {/* MAIN */}
      <div className="flex-1 flex flex-col">
        {/* TOP BAR */}
        <header className="h-[64px] bg-[#cf1b2b] flex items-center justify-between px-6 text-white shadow">
          <div>
            <p className="font-semibold leading-tight">Admin</p>
            <button
              onClick={logout}
              className="text-xs flex items-center gap-1 opacity-90 hover:opacity-100"
            >
              Logout <FaSignOutAlt />
            </button>
          </div>

          <div className="flex items-center gap-3">
            <button className="w-9 h-9 rounded-full bg-white text-[#cf1b2b] flex items-center justify-center">
              <FaCog />
            </button>
            <button className="w-9 h-9 rounded-full bg-white text-[#cf1b2b] flex items-center justify-center">
              <FaThLarge />
            </button>
          </div>
        </header>

  
          <Breadcrumb/>
      

        {/* PAGE CONTENT */}
        <main className="flex-1 px-6 pb-10">
          <Outlet />
        </main>
      </div>
    </div>
  );
}

function SideLink({ to, icon, label, collapsed }) {
  return (
    <NavLink
      to={to}
      className={({ isActive }) =>
        `group flex items-center gap-3 px-4 py-3 rounded-lg transition ${
          isActive
            ? "bg-[#cf1b2b] text-white"
            : "text-gray-700 hover:bg-gray-100"
        }`
      }
    >
      <span className="text-lg">{icon}</span>
      {!collapsed && <span>{label}</span>}
    </NavLink>
  );
}
