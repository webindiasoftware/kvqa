import { Routes, Route } from "react-router-dom";

import LoginPage from "./pages/Login";
import Dashboard from "./pages/Dashboard";
import Clients from "./pages/Clients";
import Enquiry from "./pages/Enquiry";
import AddEnquiry from "./pages/AddEnquiry";
import ProposalAdd from "./pages/ProposalAdd";

import AppLayout from "./components/AppLayout";
import ProtectedRoute from "./components/ProtectedRoute";
import PublicRoute from "./components/PublicRoute";
import ToastConfig from "./components/ToastConfig";
import Kaf2 from "./pages/Kaf2";

function App() {
  return (
    <>
      <ToastConfig />
      
    <Routes>
      {/* LOGIN */}
      <Route
        path="/login"
        element={
          <PublicRoute>
            <LoginPage />
          </PublicRoute>
        }
      />

      {/* PROTECTED APP */}
      <Route
        path="/"
        element={
          <ProtectedRoute>
            <AppLayout />
          </ProtectedRoute>
        }
      >
        <Route index element={<Dashboard />} />
        <Route path="clients" element={<Clients />} />
        <Route path="enquiry" element={<Enquiry />} />
        <Route path="addEnquiry" element={<AddEnquiry />} />
        <Route path="kaf-02" element={<Kaf2 />} />
        <Route path="proposal/add" element={<ProposalAdd />} />
      </Route>
    </Routes>
    </>
  );
}

export default App;
