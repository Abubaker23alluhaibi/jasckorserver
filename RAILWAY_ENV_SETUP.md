# إعداد متغيرات البيئة في Railway

## 📋 قائمة المتغيرات المطلوبة

انسخ هذه المتغيرات وأضفها في Railway Dashboard:

### 1. Firebase Configuration (مطلوبة)

```env
FIREBASE_API_KEY=your-firebase-api-key
FIREBASE_AUTH_DOMAIN=your-project.firebaseapp.com
FIREBASE_PROJECT_ID=your-project-id
FIREBASE_STORAGE_BUCKET=your-project.appspot.com
FIREBASE_MESSAGING_SENDER_ID=your-messaging-sender-id
FIREBASE_APP_ID=your-app-id
```

### 2. JWT Secret (مطلوبة - أمنية حرجة)

```env
JWT_SECRET=your-very-strong-random-secret-key-minimum-32-characters
```

**⚠️ مهم جداً**: 
- يجب أن يكون JWT_SECRET قوياً وعشوائياً
- لا تشاركه مع أحد
- استخدم مولد كلمات مرور قوية
- مثال: `aB3$kL9#mN2@pQ7&rS5*tU8!vW1^xY4%zA6^bC9`

### 3. Server Configuration (اختيارية)

```env
NODE_ENV=production
PORT=3000
```

### 4. Frontend URL (اختيارية - إذا كان لديك frontend منفصل)

```env
FRONTEND_URL=https://your-frontend-domain.com
```

---

## 🚀 خطوات الإضافة في Railway

1. اذهب إلى مشروعك على Railway: https://railway.app
2. اختر المشروع الخاص بك
3. اضغط على **Variables** من القائمة الجانبية
4. اضغط على **+ New Variable**
5. أضف كل متغير من القائمة أعلاه
6. احفظ التغييرات
7. السيرفر سيعيد التشغيل تلقائياً

---

## ✅ التحقق من الإعداد

بعد إضافة جميع المتغيرات:

1. تأكد من أن السيرفر يعمل: `https://web-production-83e93.up.railway.app/api/health`
2. جرب تسجيل الدخول: `POST /api/auth/login`
3. تحقق من أن Firebase متصل بشكل صحيح

---

## 📝 ملاحظات

- **PORT**: Railway يضبطه تلقائياً، لا حاجة لتعديله
- **NODE_ENV**: ضعه `production` للإنتاج
- **Firebase**: تأكد من تفعيل Cloud Firestore API في Google Cloud Console
- **JWT_SECRET**: إذا لم تضفه، السيرفر لن يعمل في الإنتاج (سيتم إيقافه)

---

## 🔒 الأمان

- لا تشارك ملف `.env` أو المتغيرات البيئية مع أحد
- استخدم JWT_SECRET قوي وفريد
- تأكد من إعداد Firebase Security Rules بشكل صحيح

