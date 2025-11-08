# نتائج اختبار السيرفر على Railway

## 🔗 رابط السيرفر
**https://web-production-83e93.up.railway.app**

---

## ✅ الـ Endpoints المختبرة

### 1. Health Check ✅
- **URL**: `GET /api/health`
- **الحالة**: ✅ يعمل
- **النتيجة**: `{"status":"ok","message":"Server is running"}`

### 2. Login ✅
- **URL**: `POST /api/auth/login`
- **الحالة**: ✅ يعمل
- **البيانات**: 
  ```json
  {
    "username": "admin",
    "password": "admin123"
  }
  ```
- **النتيجة**: يعيد token وبيانات المستخدم

### 3. Initialize Database
- **URL**: `POST /api/init`
- **الحالة**: ⚠️ يحتاج اختبار
- **الوظيفة**: ينشئ collections في Firebase

### 4. Get Users (مع Token)
- **URL**: `GET /api/users`
- **Headers**: `Authorization: Bearer {token}`
- **الحالة**: ⚠️ يحتاج اختبار

### 5. Get Devices (مع Token)
- **URL**: `GET /api/devices`
- **Headers**: `Authorization: Bearer {token}`
- **الحالة**: ⚠️ يحتاج اختبار

---

## 📝 كيفية الاختبار يدوياً

### باستخدام PowerShell:
```powershell
# 1. Health Check
Invoke-RestMethod -Uri "https://web-production-83e93.up.railway.app/api/health"

# 2. Login
$body = @{username="admin";password="admin123"} | ConvertTo-Json
$login = Invoke-RestMethod -Uri "https://web-production-83e93.up.railway.app/api/auth/login" -Method Post -Body $body -ContentType "application/json"
$token = $login.token

# 3. Get Users
$headers = @{Authorization="Bearer $token"}
Invoke-RestMethod -Uri "https://web-production-83e93.up.railway.app/api/users" -Method Get -Headers $headers
```

### باستخدام curl:
```bash
# Health Check
curl https://web-production-83e93.up.railway.app/api/health

# Login
curl -X POST https://web-production-83e93.up.railway.app/api/auth/login \
  -H "Content-Type: application/json" \
  -d '{"username":"admin","password":"admin123"}'
```

---

## ⚠️ ملاحظات

1. **CORS**: تم تحديثه ليشمل نطاق Railway
2. **JWT_SECRET**: يجب إضافته في Railway Variables
3. **Firebase**: يجب إضافة جميع متغيرات Firebase في Railway

---

## 🔧 الخطوات التالية

1. ✅ السيرفر يعمل على Railway
2. ⚠️ تأكد من إضافة جميع متغيرات البيئة في Railway
3. ⚠️ اختبر Initialize Database endpoint
4. ⚠️ اختبر باقي الـ endpoints مع Token

