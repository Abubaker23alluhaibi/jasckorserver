# متغيرات البيئة المطلوبة (Environment Variables)

## قائمة بجميع المتغيرات البيئية المطلوبة للسيرفر

### 1. Server Configuration
```env
PORT=3000
NODE_ENV=production
```

### 2. Firebase Configuration (مطلوبة)
```env
FIREBASE_API_KEY=your-firebase-api-key-here
FIREBASE_AUTH_DOMAIN=your-project.firebaseapp.com
FIREBASE_PROJECT_ID=your-project-id
FIREBASE_STORAGE_BUCKET=your-project.appspot.com
FIREBASE_MESSAGING_SENDER_ID=your-messaging-sender-id
FIREBASE_APP_ID=your-app-id
```

### 3. JWT Secret (مطلوبة - أمنية حرجة)
```env
JWT_SECRET=your-very-strong-random-secret-key-here-change-this
```

### 4. Frontend URL (اختيارية)
```env
FRONTEND_URL=https://your-frontend-domain.com
```

---

## كيفية إضافة المتغيرات في Railway

1. اذهب إلى مشروعك على Railway
2. اضغط على **Variables** في القائمة الجانبية
3. أضف كل متغير من القائمة أعلاه
4. احفظ التغييرات

## ملاحظات مهمة:

⚠️ **JWT_SECRET**: يجب أن يكون:
- طويل (32 حرف على الأقل)
- عشوائي
- لا تشاركه مع أحد
- استخدم مولد كلمات مرور قوية

مثال على JWT_SECRET قوي:
```
aB3$kL9#mN2@pQ7&rS5*tU8!vW1^xY4%zA6^bC9
```

⚠️ **Firebase**: تأكد من:
- تفعيل Cloud Firestore API في Google Cloud Console
- إعداد قواعد الأمان (Security Rules) بشكل صحيح
- نسخ جميع القيم من Firebase Console بدقة

---

## مثال كامل لملف .env (للاستخدام المحلي فقط):

```env
PORT=3000
NODE_ENV=development

FIREBASE_API_KEY=AIzaSyBxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
FIREBASE_AUTH_DOMAIN=your-project.firebaseapp.com
FIREBASE_PROJECT_ID=your-project-id
FIREBASE_STORAGE_BUCKET=your-project.appspot.com
FIREBASE_MESSAGING_SENDER_ID=123456789012
FIREBASE_APP_ID=1:123456789012:web:abcdef123456

JWT_SECRET=your-super-secret-jwt-key-change-this-in-production

FRONTEND_URL=http://localhost:5173
```

---

## التحقق من المتغيرات:

بعد إضافة المتغيرات، تأكد من:
1. إعادة تشغيل السيرفر
2. فحص endpoint: `GET /api/health`
3. التحقق من أن Firebase متصل بشكل صحيح

