"use client";

import { useState } from "react";
import { useRouter } from "next/navigation";

export default function LoginPage() {
  const router = useRouter();

  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");

  function handleLogin(e) {
    e.preventDefault();

    if (
      email === "admin@eczane.com" &&
      password === "EczaneAdmin2026!"
    ) {
      router.push("/dashboard");
    } else {
      alert("E-posta veya şifre hatalı!");
    }
  }

  return (
    <main className="min-h-screen bg-slate-100 flex items-center justify-center px-4">
      
      <div className="w-full max-w-md bg-white rounded-2xl shadow-xl p-8">

        <div className="text-center mb-8">
          <div className="w-16 h-16 mx-auto bg-blue-100 rounded-2xl flex items-center justify-center mb-5">
            <span className="text-3xl">💊</span>
          </div>

          <h1 className="text-3xl font-bold text-slate-800">
            Hoş Geldiniz
          </h1>

          <p className="text-slate-500 mt-2">
            Eczane yönetim paneline giriş yapın
          </p>
        </div>

        <form onSubmit={handleLogin} className="space-y-5">

          <div>
            <label className="block text-sm font-medium text-slate-700 mb-2">
              E-posta adresi
            </label>

            <input
              type="email"
              value={email}
              onChange={(e) => setEmail(e.target.value)}
              placeholder="admin@eczane.com"
              className="w-full border border-slate-300 rounded-lg px-4 py-3 bg-white text-slate-800 outline-none focus:ring-2 focus:ring-blue-500"
              required
            />
          </div>

          <div>
            <label className="block text-sm font-medium text-slate-700 mb-2">
              Şifre
            </label>

            <input
              type="password"
              value={password}
              onChange={(e) => setPassword(e.target.value)}
              placeholder="Şifrenizi girin"
              className="w-full border border-slate-300 rounded-lg px-4 py-3 bg-white text-slate-800 outline-none focus:ring-2 focus:ring-blue-500"
              required
            />
          </div>

          <button
            type="submit"
            className="w-full bg-blue-600 hover:bg-blue-700 text-white font-semibold py-3 rounded-lg transition"
          >
            Giriş Yap
          </button>

        </form>

        <p className="text-center text-sm text-slate-400 mt-6">
          Eczane Yönetim Sistemi
        </p>

      </div>

    </main>
  );
}