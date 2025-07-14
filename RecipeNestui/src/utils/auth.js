// src/utils/auth.js
export const setToken = (token) => localStorage.setItem("token", token);
export const getToken = () => localStorage.getItem("token");
export const logout = () => localStorage.removeItem("token");
export const isLoggedIn = () => !!localStorage.getItem("token");
