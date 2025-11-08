# متغيرات Firebase للإضافة في Railway

## ✅ القيم الصحيحة من Firebase Config

انسخ هذه القيم وأضفها في Railway Dashboard:

```env
FIREBASE_API_KEY=AIzaSyAcLuRQoL-6H-4LQBRqxMcypsrqAmpAkYM
FIREBASE_AUTH_DOMAIN=josck-system.firebaseapp.com
FIREBASE_PROJECT_ID=josck-system
FIREBASE_STORAGE_BUCKET=josck-system.firebasestorage.app
FIREBASE_MESSAGING_SENDER_ID=668885365211
FIREBASE_APP_ID=1:668885365211:web:fd5fffa67794cabb13f7fe
```

## 📝 ملاحظات:

- **measurementId**: لا نحتاجه في Backend (يستخدم فقط في Frontend للـ Analytics)
- **storageBucket**: لاحظ أن القيمة هي `josck-system.firebasestorage.app` وليس `.appspot.com` (هذا صحيح في الإصدارات الجديدة من Firebase)

---

## 🚀 خطوات الإضافة في Railway:

1. اذهب إلى: https://railway.app
2. اختر مشروعك
3. اضغط **Variables** من القائمة الجانبية
4. اضغط **+ New Variable**
5. أضف كل متغير من القائمة أعلاه (6 متغيرات)
6. احفظ التغييرات
7. السيرفر سيعيد التشغيل تلقائياً

---

## ⚠️ مهم جداً:

### 1. JWT_SECRET (مطلوب أيضاً)
لا تنس إضافة JWT_SECRET:

```env
JWT_SECRET=your-very-strong-random-secret-key-minimum-32-characters
```

مثال:
```env
JWT_SECRET=aB3$kL9#mN2@pQ7&rS5*tU8!vW1^xY4%zA6^bC9
```

### 2. تفعيل Cloud Firestore API
تأكد من تفعيل Cloud Firestore API:
1. اذهب إلى: https://console.cloud.google.com
2. اختر مشروع "josck-system"
3. APIs & Services > Library
4. ابحث عن "Cloud Firestore API"
5. اضغط **Enable**

---

## ✅ بعد الإضافة:

1. انتظر إعادة تشغيل السيرفر
2. تحقق من السجلات - يجب أن ترى:
   ```
   ✅ Firebase initialized successfully
   ```
3. اختبر Health Check:
   ```
   GET https://web-production-83e93.up.railway.app/api/health
   ```
   يجب أن ترى: `"firebase": "connected"`

---

## 📋 قائمة كاملة بجميع المتغيرات المطلوبة:

```env
# Firebase (6 متغيرات)
FIREBASE_API_KEY=AIzaSyAcLuRQoL-6H-4LQBRqxMcypsrqAmpAkYM
FIREBASE_AUTH_DOMAIN=josck-system.firebaseapp.com
FIREBASE_PROJECT_ID=josck-system
FIREBASE_STORAGE_BUCKET=josck-system.firebasestorage.app
FIREBASE_MESSAGING_SENDER_ID=668885365211
FIREBASE_APP_ID=1:668885365211:web:fd5fffa67794cabb13f7fe

# JWT Secret (مطلوب)
JWT_SECRET=your-very-strong-random-secret-key-minimum-32-characters

# Server (اختياري)
NODE_ENV=production
```

