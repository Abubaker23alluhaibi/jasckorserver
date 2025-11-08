# كيفية الحصول على متغيرات Firebase

## 📍 الخطوات التفصيلية

### 1. اذهب إلى Firebase Console
- افتح المتصفح واذهب إلى: **https://console.firebase.google.com**
- سجل الدخول بحساب Google الخاص بك

### 2. اختر المشروع
- إذا كان لديك مشروع موجود: اختره من القائمة
- إذا لم يكن لديك مشروع: اضغط **Add project** وأنشئ مشروع جديد

### 3. احصل على Firebase Config

#### الطريقة الأولى: من Project Settings

1. اضغط على **⚙️ Settings** (الإعدادات) في القائمة الجانبية
2. اختر **Project settings**
3. انتقل إلى تبويب **General** (عام)
4. ابحث عن قسم **Your apps** أو **SDK setup and configuration**
5. إذا لم يكن لديك تطبيق Web:
   - اضغط على أيقونة **Web** (`</>`)
   - أدخل اسم التطبيق (مثلاً: "josck-backend")
   - اضغط **Register app**
6. ستظهر لك شاشة تحتوي على `firebaseConfig` مثل هذا:

```javascript
const firebaseConfig = {
  apiKey: "AIzaSyBxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
  authDomain: "your-project.firebaseapp.com",
  projectId: "your-project-id",
  storageBucket: "your-project.appspot.com",
  messagingSenderId: "123456789012",
  appId: "1:123456789012:web:abcdef123456"
};
```

### 4. استخرج المتغيرات

من الكود أعلاه، استخرج القيم التالية:

```env
FIREBASE_API_KEY=AIzaSyBxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
FIREBASE_AUTH_DOMAIN=your-project.firebaseapp.com
FIREBASE_PROJECT_ID=your-project-id
FIREBASE_STORAGE_BUCKET=your-project.appspot.com
FIREBASE_MESSAGING_SENDER_ID=123456789012
FIREBASE_APP_ID=1:123456789012:web:abcdef123456
```

---

## 🔧 تفعيل Cloud Firestore API

**مهم جداً**: يجب تفعيل Cloud Firestore API قبل استخدام Firebase

### الخطوات:

1. اذهب إلى [Google Cloud Console](https://console.cloud.google.com)
2. اختر المشروع الخاص بك (نفس مشروع Firebase)
3. من القائمة الجانبية، اذهب إلى **APIs & Services** > **Library**
4. ابحث عن **"Cloud Firestore API"**
5. اضغط على النتيجة
6. اضغط **Enable** (تفعيل)

---

## 📝 مثال كامل

بعد الحصول على القيم، أضفها في Railway:

1. اذهب إلى [Railway Dashboard](https://railway.app)
2. اختر مشروعك
3. اضغط **Variables**
4. أضف كل متغير:

```
FIREBASE_API_KEY=AIzaSyBxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
FIREBASE_AUTH_DOMAIN=my-project-12345.firebaseapp.com
FIREBASE_PROJECT_ID=my-project-12345
FIREBASE_STORAGE_BUCKET=my-project-12345.appspot.com
FIREBASE_MESSAGING_SENDER_ID=123456789012
FIREBASE_APP_ID=1:123456789012:web:abcdef1234567890
```

---

## ⚠️ ملاحظات مهمة

1. **لا تشارك هذه القيم مع أحد** - خاصة `apiKey` (رغم أنها آمنة للاستخدام في Frontend)
2. **انسخ القيم بدقة** - أي خطأ في النسخ سيسبب مشاكل
3. **تأكد من تفعيل Firestore API** - بدونها لن يعمل السيرفر
4. **استخدم نفس المشروع** - تأكد من استخدام نفس `projectId` في جميع المتغيرات

---

## 🎯 التحقق من الإعداد

بعد إضافة جميع المتغيرات:

1. أعد تشغيل السيرفر على Railway
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

## 🆘 إذا واجهت مشاكل

### المشكلة: "Firebase not initialized"
- **الحل**: تأكد من إضافة جميع المتغيرات الستة في Railway

### المشكلة: "Invalid resource field value"
- **الحل**: 
  1. تأكد من تفعيل Cloud Firestore API
  2. تحقق من أن القيم صحيحة (لا توجد مسافات إضافية)

### المشكلة: "PERMISSION_DENIED"
- **الحل**: 
  1. تحقق من Firebase Security Rules
  2. تأكد من تفعيل Cloud Firestore API

---

## 📸 لقطات شاشة (Screen Shots)

إذا كنت بحاجة لمساعدة بصرية:
1. اذهب إلى Firebase Console
2. Project Settings > General
3. Your apps > Web app
4. ستجد `firebaseConfig` هناك

