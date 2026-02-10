// redux/slices/authSlice.js
import { createSlice } from "@reduxjs/toolkit";

const initialState = {
  token: localStorage.getItem("token"),
  member: JSON.parse(localStorage.getItem("member")),
};

const authSlice = createSlice({
  name: "auth",
  initialState,
  reducers: {
    login: (state, action) => {
      state.token = action.payload.token;
      state.member = action.payload.member;

      localStorage.setItem("token", action.payload.token);
      localStorage.setItem(
        "member",
        JSON.stringify(action.payload.member)
      );
    },
    logout: (state) => {
      state.token = null;
      state.member = null;

      localStorage.removeItem("token");
      localStorage.removeItem("member");
    },
  },
});

export const { login, logout } = authSlice.actions;

// ✅ Default export for store
export default authSlice.reducer;;