import "./globals.css";

export const metadata = {
  title: "Eczane Yönetim Paneli",
  description: "Eczane Yönetim Sistemi",
};

export default function RootLayout({ children }) {
  return (
    <html lang="tr">
      <body>{children}</body>
    </html>
  );
}