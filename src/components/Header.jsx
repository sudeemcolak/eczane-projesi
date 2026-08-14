export default function Header() {
  return (
    <header className="h-20 bg-white border-b border-slate-200 flex items-center justify-between px-8">

      <div>
        <h2 className="text-xl font-semibold text-slate-800">
          Yönetim Paneli
        </h2>

        <p className="text-sm text-slate-500">
          Eczane yönetim sistemi
        </p>
      </div>

      <div className="flex items-center gap-4">

        <button className="w-10 h-10 rounded-full hover:bg-slate-100 flex items-center justify-center">
          🔔
        </button>

        <div className="flex items-center gap-3">
          <div className="w-10 h-10 rounded-full bg-blue-600 text-white flex items-center justify-center font-bold">
            A
          </div>

          <div>
            <p className="text-sm font-semibold text-slate-800">
              Admin
            </p>

            <p className="text-xs text-slate-500">
              Yönetici
            </p>
          </div>
        </div>

      </div>

    </header>
  );
}