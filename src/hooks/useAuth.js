// hooks/useAuth.js
import { useState } from "react";
import { useDispatch } from "react-redux";
import { toast } from "react-toastify";

import { baseClient } from "../services/api.clients";
import { APIEndpoints } from "../services/api.endpoints";
import { login, logout } from "../redux/slices/authSlice";

export const useAuth = () => {
  const dispatch = useDispatch();

  const [loading, setLoading] = useState(false);
  const [error, setError] = useState(null);

  /* ==========================
     LOGIN
  ========================== */
  const loginUser = async (credentials) => {
    setLoading(true);
    setError(null);

    try {
      // const response = await baseClient.post(
      //   APIEndpoints.logIn,
      //   credentials
      // );

      // if (response.data?.status === true) {
      //   const { token, member } = response.data;

      console.log(credentials)
      const { empId, password } = credentials;


        if (empId === "EMP001" && password === "123456") {
      const token = "dummy-token-123";
      const member = {
        empId: "EMP001",
        name: "Demo User",
        role: "Employee",
      };

        dispatch(
          login({
            token,
            member,
          })
        );

        toast.success("Login successful. Welcome back!");

        return { success: true };
      } else {
        const errMsg = response.data?.message || "Login failed";
        setError(errMsg);

        toast.error(errMsg);

        return { success: false };
      }
    } catch (err) {
      const errMsg =
        err?.response?.data?.message || "Something went wrong";

      setError(errMsg);
      toast.error(errMsg);

      return { success: false };
    } finally {
      setLoading(false);
    }
  };

  /* ==========================
     LOGOUT
  ========================== */
  const logoutUser = () => {
    dispatch(logout());
    toast.success("Logged out successfully");
  };

  return {
    loginUser,
    logoutUser,
    loading,
    error,
  };
};

export default useAuth;
