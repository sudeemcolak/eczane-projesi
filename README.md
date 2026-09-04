# Eczane Backend - Rails API

Eczane uygulamasının kullanıcı, eczane, sipariş, stok ve eczacı işlemlerini yöneten Rails API backend'idir.

## 🚀 Kullanılan Teknolojiler

- Ruby on Rails
- Ruby
- PostgreSQL
- JWT
- REST API
- FastAPI entegrasyonu
- Postman

## 📌 Backend'in Sorumlulukları

Rails backend aşağıdaki işlemleri yönetir:

- Kullanıcı kayıt ve giriş işlemleri
- JWT tabanlı kimlik doğrulama
- Kullanıcı profil işlemleri
- Eczanelerin yönetimi
- Eczacı giriş işlemleri
- Sipariş oluşturma ve görüntüleme
- Eczacı tarafından sipariş durumlarının yönetilmesi
- Eczane stoklarının yönetimi
- Kullanıcı konumuna göre uygun eczanenin belirlenmesi
- Reçete barkodunun FastAPI backend'ine gönderilmesi

## 🏗️ Proje Yapısı

```text
app/
├── controllers/
│   ├── api/v1/
│   │   ├── orders_controller.rb
│   │   ├── pharmacies_controller.rb
│   │   ├── pharmacist_orders_controller.rb
│   │   ├── pharmacist_sessions_controller.rb
│   │   ├── prescriptions_controller.rb
│   │   ├── sessions_controller.rb
│   │   └── users_controller.rb
│   └── application_controller.rb
│
├── models/
│   ├── user.rb
│   ├── order.rb
│   ├── order_item.rb
│   ├── drugstore.rb
│   ├── drugstore_stock.rb
│   └── pharmacist.rb
│
└── services/
    ├── json_web_token.rb
    └── nearest_drugstore_service.rb
