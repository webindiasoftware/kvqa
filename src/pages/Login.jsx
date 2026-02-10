import { FaUser, FaLock } from "react-icons/fa";
import { useNavigate } from "react-router-dom";
import useAuth from "../hooks/useAuth";
import { useState } from "react";

export default function LoginPage() {
  const navigate = useNavigate();
  const { loginUser, loading } = useAuth();

  const [form, setForm] = useState({
    empId: "",
    password: "",
  });

  const handleChange = (e) => {
    setForm({
      ...form,
      [e.target.name]: e.target.value,
    });
  };

  const handleLogin = async (e) => {
    e.preventDefault();

    const result = await loginUser(form);

    if (result.success) {
      navigate("/");
    }
  };

  return (
    <div className="min-h-screen flex items-center justify-center bg-gradient-to-br from-[#ffff] via-[#ffff] to-[#ffff] px-6 ">
      {/* Glass Card */}
      <div className="relative w-full max-w-md rounded-2xl bg-white/10 backdrop-blur-xl border border-white/20 shadow-2xl p-10 baackground">
        
        {/* Logo */}
        <div className="flex justify-center mb-8">
          <img
            src="https://kvqaeast.com/images/logo.png"
            alt="KVQA"
            className="w-40"
          />
        </div>

        <h1 className="text-center text-2xl font-semibold text-white mb-2">
          Welcome back
        </h1>
        <p className="text-center text-sm text-white/70 mb-8">
          Sign in to continue to KVQA ERP
        </p>

        <form onSubmit={handleLogin} className="space-y-6">
          {/* Employee ID */}
          <div className="relative">
            <FaUser className="absolute left-4 top-1/2 -translate-y-1/2 text-white/70" />
            <input
              name="empId"
              type="text"
               value={form.email}
             onChange={handleChange}
              placeholder="Employee ID"
              className="w-full h-12 pl-11 pr-4 rounded-xl bg-white/10 text-white placeholder-white/60 border border-white/20 focus:outline-none focus:ring-2 focus:ring-white/40"
            />
          </div>

          {/* Password */}
          <div className="relative">
            <FaLock className="absolute left-4 top-1/2 -translate-y-1/2 text-white/70" />
            <input
              type="password"
              name="password"
              value={form.password}
             onChange={handleChange}
              placeholder="Password"
              className="w-full h-12 pl-11 pr-4 rounded-xl bg-white/10 text-white placeholder-white/60 border border-white/20 focus:outline-none focus:ring-2 focus:ring-white/40"
            />
          </div>

          {/* Options */}
          <div className="flex items-center justify-between text-sm text-white/70">
            {/* <label className="flex items-center gap-2">
              <input
                type="checkbox"
                className="accent-white"
              />
              Remember me
            </label> */}
            <button
              type="button"
              className="hover:text-white transition"
            >
              Forgot?
            </button>
          </div>

          {/* Button */}
          <button
            type="submit"
            className="w-full h-12 rounded-xl bg-white text-[#cf1b2b] font-semibold tracking-wide hover:bg-white/90 transition"
          >
            SIGN IN
          </button>
        </form>

        {/* Footer */}
        <p className="text-center text-xs text-white/50 mt-8">
          © 2026 KVQA Certification Services
        </p>
      </div>
    </div>
  );
}
