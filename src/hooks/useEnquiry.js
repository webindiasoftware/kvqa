import { useState } from "react";
import { toast } from "react-toastify";

import { baseClient } from "../services/api.clients";
import { APIEndpoints } from "../services/api.endpoints";

export const useEnquiry = () => {
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState(null);

  /* ==========================
      GET ENQUIRY LIST
  ========================== */
  const getEnquiryList = async (payload) => {
    setLoading(true);
    setError(null);

    try {
      const response = await baseClient.post(
        APIEndpoints.enquiryList,
        payload
      );

      if (response.data?.status === true) {
        return {
          success: true,
          data: response.data?.data || [],
        };
      } else {
        const errMsg = response.data?.message || "Failed to fetch enquiries";
        setError(errMsg);
        toast.error(errMsg);

        return { success: false };
      }
    } catch (err) {
      const errMsg =
        err?.response?.data?.message || "Something went wrong";
      setError(errMsg);
      toast.error(errMsg || "Something went wrong");

      return { success: false };
    } finally {
      setLoading(false);
    }
  };

  /* ==========================
      ADD ENQUIRY
  ========================== */
  const addEnquiry = async (data) => {
    setLoading(true);
    setError(null);

    try {
      const response = await baseClient.post(
        APIEndpoints.addEnquiry,
        data
      );

      if (response.data?.status === true) {
        toast.success("Enquiry added successfully");
        return { success: true };
      } else {
        const errMsg = response.data?.message || "Failed to add enquiry";
        setError(errMsg);
        toast.error(errMsg);

        return { success: false };
      }
    } catch (err) {
      const errMsg =
        err?.response?.data?.message || "Something went wrong";

      setError(errMsg);
      toast.error(errMsg || "Something went wrong");

      return { success: false };
    } finally {
      setLoading(false);
    }
  };

  return {
    getEnquiryList,
    addEnquiry,
    loading,
    error,
  };
};

export default useEnquiry;
