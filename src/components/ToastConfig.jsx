import { ToastContainer } from "react-toastify";
import {
  FaCheckCircle,
  FaTimesCircle,
  FaInfoCircle,
  FaExclamationTriangle,
} from "react-icons/fa";
import "react-toastify/dist/ReactToastify.css";

export default function ToastConfig() {
  const iconMap = {
    success: <FaCheckCircle className="text-green-500" size={20} />,
    error: <FaTimesCircle className="text-red-500" size={20} />,
    info: <FaInfoCircle className="text-blue-500" size={20} />,
    warning: <FaExclamationTriangle className="text-amber-500" size={20} />,
  };

  return (
    <ToastContainer
      position="top-center"
      autoClose={3200}
      newestOnTop
      closeOnClick
      pauseOnHover
      draggable
      icon={({ type }) => iconMap[type] || null}
      toastClassName={() =>
        `
        flex items-center gap-3
        rounded-xl px-5 py-4
        bg-white text-gray-800
        shadow-[0_12px_35px_rgba(0,0,0,0.12)]
        border border-gray-100
        min-w-[340px]
        `
      }
      bodyClassName="text-[14px] font-medium"
      progressClassName="bg-[#cf1b2b]"
    />
  );
}
