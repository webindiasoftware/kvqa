// api.enviroments.js

export const Enviornments = {
  local: 0,
  dev: 1,
  production: 2,
};

const souvik = "192.168.";

export const URLs = {
  [Enviornments.local]: {
    apiURL: `http://${souvik}:8000/app_api/`,
  },
  [Enviornments.dev]: {
    apiURL: "https://kvqa.softskirl.co.in/newapp/api",
  },
  [Enviornments.production]: {
    apiURL: "",
  },
};

// 👇 change env here
export const enviornment = Enviornments.dev;
