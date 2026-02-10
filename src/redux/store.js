// redux/store.js
import { configureStore } from "@reduxjs/toolkit";

import authReducer from "./slices/authSlice";
// import formReducer from "./slices/formSlice";

export const store = configureStore({
  reducer: {
    auth: authReducer,
    // form: formReducer,
  },
  devTools: process.env.NODE_ENV !== "production",
});

export default store;
