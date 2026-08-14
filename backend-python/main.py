from fastapi import FastAPI,UploadFile,File,Form,HTTPException,status
from datetime import datetime
from zoneinfo import ZoneInfo
from pydantic import BaseModel 
from typing import List
import shutil
import os

app= FastAPI()
#Reçete ve barkod ekleme 
MAX_FILE_SIZE = 1 * 1024 * 1024
@app.post("/recete/gorsel")
async def gorsel_yukle(dosya: UploadFile = File(...)):
    dosya.file.seek(0, 2)
    dosya_boyutu = dosya.file.tell()
    dosya.file.seek(0)
    if dosya_boyutu > MAX_FILE_SIZE:
        raise HTTPException(
            status_code=status.HTTP_413_REQUEST_ENTITY_TOO_LARGE,
            detail=f"Yüklenen görsel 1 MB'tan büyük olamaz. Yüklenen dosya: {round(dosya_boyutu / (1024 * 1024), 2)} MB"
        )
    # Klasör yoksa oluşturup dosyayı kaydediyoruz
    os.makedirs("yuklenen_gorseller", exist_ok=True)
    dosya_yolu = f"yuklenen_gorseller/{dosya.filename}"
    with open(dosya_yolu, "wb") as buffer:
        shutil.copyfileobj(dosya.file, buffer)
    su_an = datetime.now(ZoneInfo("Europe/Istanbul")).strftime("%Y-%m-%d %H:%M:%S")
    return {
        "durum": "Başarılı",
        "dosya_adi": dosya.filename,
        "kaydedilen_yol": dosya_yolu,
        "islem_zamani": su_an,
        "mesaj": "Reçete görseli eczacı sistemine iletildi."
    }
@app.post("/recete/barkod")
async def barkod_yukle(barkod_no: str= Form(...)):
    su_an = datetime.now(ZoneInfo("Europe/Istanbul")).strftime("%Y-%m-%d %H:%M:%S")
    #Gelen barkodları kayıt tutmak için bir txt dosyasına ekliyoruz
    with open("gelen_barkodlar.txt", "a", encoding="utf-8") as dosya:
        dosya.write(f"[{su_an}] Barkod: {barkod_no}\n")
    return{
        "durum": "Başarılı",
        "barkod": barkod_no,
        "islem_zamani": su_an,
        "mesaj": "Barkod numarası işlenmek üzere iletildi. "
    }
# İşlem zamanı belli olması için su_an adında bir değişken belirledim. pip install tzdata kütüphanesi kurarak kodu çalıştırdım.

#REÇETE DOĞRULAMA SERVİSi

class ReceteDogrulamaGirdisi(BaseModel):
    recete_id: str
    gun_sayisi: int
    e_recete_onayli_mi: bool
    ilaclar: List[str]
@app.post("/recete/dogrula")
async def recete_dogrula(veri: ReceteDogrulamaGirdisi):
    gecerli_mi = True
    sebep = "Reçete geçerlidir."

    if veri.gun_sayisi >4:
        gecerli_mi = False
        sebep= "Reçete yazılış tarihinden itibaren 4 günü geçtiği için geçersizdir."
    elif not veri.e_recete_onayli_mi:
        gecerli_mi = False
        sebep= "Reçete e-reçete sisteminde hekim tarafından onaylanmamıştır."
    su_an = datetime.now(ZoneInfo("Europe/Istanbul")).strftime("%Y-%m-%d %H:%M:%S")

    return{
        "recete_id": veri.recete_id,
        "gecerli_mi": gecerli_mi,
        "detay": sebep,
        "islem_zamani": su_an
    }
db_stok_verisi = {
    "Alveres 25mg": {"stok": 15, "fiyat": 118.47},
    "Metpamid 10mg": {"stok": 15, "fiyat": 93.12},
    "Augmentin 500mg": {"stok": 5, "fiyat": 152.62},
    "Aspirin 500mg": {"stok": 0, "fiyat": 134.91}
}

class ReceteOnayGirdisi(BaseModel):
    recete_id: str
    ilaclar: List[str]

@app.post("/recete/onayla")
async def recete_onayla(veri: ReceteOnayGirdisi):
    toplam_tutar = 0.0
    eksik_ilaclar = []

    for ilac in veri.ilaclar:
        if ilac in db_stok_verisi and db_stok_verisi[ilac]["stok"] > 0:
            toplam_tutar += db_stok_verisi[ilac]["fiyat"]
        else:
            eksik_ilaclar.append(ilac)

    su_an = datetime.now(ZoneInfo("Europe/Istanbul")).strftime("%Y-%m-%d %H:%M:%S")

    # Eksik ilaç olsa bile hesaplanan toplam tutarı döndürüyoruz
    if eksik_ilaclar:
        return {
            "recete_id": veri.recete_id,
            "durum": "Onaylanmadı",
            "mesaj": "Reçetedeki bazı ilaçlar stokta bulunmamaktadır.",
            "eksik_ilaclar": eksik_ilaclar,
            "mevcut_ilaclarin_tutari_tl": round(toplam_tutar, 2),
            "islem_zamani": su_an
        }

    # Tüm ilaçlar stoktaysa
    return {
        "recete_id": veri.recete_id,
        "durum": "Onaylandı",
        "toplam_tutar_tl": round(toplam_tutar, 2),
        "islem_zamani": su_an
    }

if __name__ == "__main__":
    import uvicorn
    uvicorn.run("main:app", host="127.0.0.1", port=8000, reload=True)