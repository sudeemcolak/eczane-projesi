export default function DashboardPage() {
  return (
    <div>

      {/* BAŞLIK */}
      <div className="mb-8">
        <h1 className="text-3xl font-bold text-slate-800">
          Hoş Geldiniz, Admin 👋
        </h1>

        <p className="text-slate-500 mt-2">
          Eczane yönetim paneline genel bakış.
        </p>
      </div>


      {/* İSTATİSTİK KARTLARI */}
      <div className="grid grid-cols-1 md:grid-cols-2 xl:grid-cols-4 gap-6">

        <div className="bg-white rounded-xl p-6 shadow-sm border border-slate-200">
          <p className="text-sm text-slate-500">
            Toplam Reçete
          </p>

          <h2 className="text-3xl font-bold text-slate-800 mt-3">
            154
          </h2>

          <p className="text-sm text-green-600 mt-2">
            ↑ %12 geçen aya göre
          </p>
        </div>


        <div className="bg-white rounded-xl p-6 shadow-sm border border-slate-200">
          <p className="text-sm text-slate-500">
            Bekleyen Reçete
          </p>

          <h2 className="text-3xl font-bold text-slate-800 mt-3">
            18
          </h2>

          <p className="text-sm text-orange-500 mt-2">
            İşlem bekliyor
          </p>
        </div>


        <div className="bg-white rounded-xl p-6 shadow-sm border border-slate-200">
          <p className="text-sm text-slate-500">
            Bugünkü Sipariş
          </p>

          <h2 className="text-3xl font-bold text-slate-800 mt-3">
            42
          </h2>

          <p className="text-sm text-blue-600 mt-2">
            Bugün oluşturuldu
          </p>
        </div>


        <div className="bg-white rounded-xl p-6 shadow-sm border border-slate-200">
          <p className="text-sm text-slate-500">
            Kargodaki Sipariş
          </p>

          <h2 className="text-3xl font-bold text-slate-800 mt-3">
            11
          </h2>

          <p className="text-sm text-purple-600 mt-2">
            Kargo sürecinde
          </p>
        </div>

      </div>


      {/* ALT BÖLÜM */}
      <div className="grid grid-cols-1 xl:grid-cols-2 gap-6 mt-8">


        {/* SON REÇETELER */}
        <div className="bg-white rounded-xl shadow-sm border border-slate-200">

          <div className="p-6 border-b border-slate-200">
            <h2 className="text-lg font-semibold text-slate-800">
              Son Reçeteler
            </h2>
          </div>

          <div className="divide-y divide-slate-100">

            <div className="p-5 flex items-center justify-between">
              <div>
                <p className="font-medium text-slate-800">
                  REC-00154
                </p>

                <p className="text-sm text-slate-500">
                  Ahmet Yılmaz
                </p>
              </div>

              <span className="px-3 py-1 rounded-full bg-yellow-100 text-yellow-700 text-xs font-medium">
                Bekliyor
              </span>
            </div>


            <div className="p-5 flex items-center justify-between">
              <div>
                <p className="font-medium text-slate-800">
                  REC-00153
                </p>

                <p className="text-sm text-slate-500">
                  Ayşe Demir
                </p>
              </div>

              <span className="px-3 py-1 rounded-full bg-green-100 text-green-700 text-xs font-medium">
                Onaylandı
              </span>
            </div>


            <div className="p-5 flex items-center justify-between">
              <div>
                <p className="font-medium text-slate-800">
                  REC-00152
                </p>

                <p className="text-sm text-slate-500">
                  Mehmet Kaya
                </p>
              </div>

              <span className="px-3 py-1 rounded-full bg-blue-100 text-blue-700 text-xs font-medium">
                Hazırlanıyor
              </span>
            </div>

          </div>

        </div>


        {/* SON SİPARİŞLER */}
        <div className="bg-white rounded-xl shadow-sm border border-slate-200">

          <div className="p-6 border-b border-slate-200">
            <h2 className="text-lg font-semibold text-slate-800">
              Son Siparişler
            </h2>
          </div>

          <div className="divide-y divide-slate-100">

            <div className="p-5 flex items-center justify-between">
              <div>
                <p className="font-medium text-slate-800">
                  #ORD-00421
                </p>

                <p className="text-sm text-slate-500">
                  Bugün, 10:42
                </p>
              </div>

              <span className="text-sm font-semibold text-slate-700">
                Hazırlanıyor
              </span>
            </div>


            <div className="p-5 flex items-center justify-between">
              <div>
                <p className="font-medium text-slate-800">
                  #ORD-00420
                </p>

                <p className="text-sm text-slate-500">
                  Bugün, 09:18
                </p>
              </div>

              <span className="text-sm font-semibold text-green-600">
                Kargoda
              </span>
            </div>


            <div className="p-5 flex items-center justify-between">
              <div>
                <p className="font-medium text-slate-800">
                  #ORD-00419
                </p>

                <p className="text-sm text-slate-500">
                  Dün, 16:35
                </p>
              </div>

              <span className="text-sm font-semibold text-blue-600">
                Tamamlandı
              </span>
            </div>

          </div>

        </div>

      </div>

    </div>
  );
}