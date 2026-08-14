import Link from "next/link";

export default function Sidebar() {
  return (
    <aside className="w-64 min-h-screen bg-slate-900 text-white flex flex-col">

      <div className="h-20 flex items-center px-6 border-b border-slate-800">
        <div>
          <h1 className="text-xl font-bold">
            Eczane Paneli
          </h1>

          <p className="text-xs text-slate-400 mt-1">
            Yönetim Sistemi
          </p>
        </div>
      </div>

      <nav className="flex-1 p-4 space-y-2">

        <Link
          href="/dashboard"
          className="flex items-center gap-3 px-4 py-3 rounded-lg bg-blue-600 text-white"
        >
          <span>▦</span>
          Dashboard
        </Link>

        <Link
          href="/prescriptions"
          className="flex items-center gap-3 px-4 py-3 rounded-lg text-slate-300 hover:bg-slate-800 hover:text-white transition"
        >
          <span>▤</span>
          Reçeteler
        </Link>

        <Link
          href="/orders"
          className="flex items-center gap-3 px-4 py-3 rounded-lg text-slate-300 hover:bg-slate-800 hover:text-white transition"
        >
          <span>▣</span>
          Siparişler
        </Link>

        <Link
          href="/users"
          className="flex items-center gap-3 px-4 py-3 rounded-lg text-slate-300 hover:bg-slate-800 hover:text-white transition"
        >
          <span>♙</span>
          Kullanıcılar
        </Link>

        <Link
          href="/settings"
          className="flex items-center gap-3 px-4 py-3 rounded-lg text-slate-300 hover:bg-slate-800 hover:text-white transition"
        >
          <span>⚙</span>
          Ayarlar
        </Link>

      </nav>

      <div className="p-4 border-t border-slate-800">
        <div className="flex items-center gap-3">
          <div className="w-10 h-10 rounded-full bg-blue-600 flex items-center justify-center font-bold">
            A
          </div>

          <div>
            <p className="text-sm font-semibold">
              Admin
            </p>

            <p className="text-xs text-slate-400">
              Yönetici
            </p>
          </div>
        </div>
      </div>

    </aside>
  );
}