# اختبار السيرفر على Railway
$baseUrl = "https://web-production-83e93.up.railway.app"

Write-Host "`n🧪 اختبار السيرفر على Railway..." -ForegroundColor Cyan
Write-Host "=====================================`n" -ForegroundColor Cyan

# 1. اختبار Health Check
Write-Host "1️⃣ اختبار Health Check..." -ForegroundColor Yellow
try {
    $health = Invoke-RestMethod -Uri "$baseUrl/api/health" -Method Get
    Write-Host "✅ Health Check: $($health.message)" -ForegroundColor Green
    Write-Host "   Status: $($health.status)`n" -ForegroundColor Green
} catch {
    Write-Host "❌ خطأ في Health Check: $($_.Exception.Message)" -ForegroundColor Red
}

# 2. اختبار Initialize Database
Write-Host "2️⃣ اختبار Initialize Database..." -ForegroundColor Yellow
try {
    $init = Invoke-RestMethod -Uri "$baseUrl/api/init" -Method Post
    Write-Host "✅ Initialize: $($init.message)" -ForegroundColor Green
    Write-Host "   Collections: $($init.collections)`n" -ForegroundColor Green
} catch {
    Write-Host "❌ خطأ في Initialize: $($_.Exception.Message)" -ForegroundColor Red
    if ($_.ErrorDetails.Message) {
        Write-Host "   Details: $($_.ErrorDetails.Message)" -ForegroundColor Red
    }
}

# 3. اختبار Login
Write-Host "3️⃣ اختبار Login..." -ForegroundColor Yellow
try {
    $loginBody = @{
        username = "admin"
        password = "admin123"
    } | ConvertTo-Json

    $login = Invoke-RestMethod -Uri "$baseUrl/api/auth/login" -Method Post -Body $loginBody -ContentType "application/json"
    Write-Host "✅ Login نجح!" -ForegroundColor Green
    Write-Host "   User: $($login.user.name) ($($login.user.role))" -ForegroundColor Green
    Write-Host "   Token: $($login.token.Substring(0, 20))..." -ForegroundColor Gray
    $global:token = $login.token
    Write-Host ""
} catch {
    Write-Host "❌ خطأ في Login: $($_.Exception.Message)" -ForegroundColor Red
    if ($_.ErrorDetails.Message) {
        $errorDetails = $_.ErrorDetails.Message | ConvertFrom-Json
        Write-Host "   Error: $($errorDetails.error)" -ForegroundColor Red
    }
}

# 4. اختبار Get Users (مع Token)
if ($global:token) {
    Write-Host "4️⃣ اختبار Get Users (مع Token)..." -ForegroundColor Yellow
    try {
        $headers = @{
            "Authorization" = "Bearer $global:token"
        }
        $users = Invoke-RestMethod -Uri "$baseUrl/api/users" -Method Get -Headers $headers
        Write-Host "✅ Get Users نجح!" -ForegroundColor Green
        Write-Host "   عدد المستخدمين: $($users.Count)" -ForegroundColor Green
        Write-Host ""
    } catch {
        Write-Host "❌ خطأ في Get Users: $($_.Exception.Message)" -ForegroundColor Red
    }
}

# 5. اختبار Get Devices (مع Token)
if ($global:token) {
    Write-Host "5️⃣ اختبار Get Devices (مع Token)..." -ForegroundColor Yellow
    try {
        $headers = @{
            "Authorization" = "Bearer $global:token"
        }
        $devices = Invoke-RestMethod -Uri "$baseUrl/api/devices" -Method Get -Headers $headers
        Write-Host "✅ Get Devices نجح!" -ForegroundColor Green
        Write-Host "   عدد الأجهزة: $($devices.Count)" -ForegroundColor Green
        Write-Host ""
    } catch {
        Write-Host "❌ خطأ في Get Devices: $($_.Exception.Message)" -ForegroundColor Red
        if ($_.ErrorDetails.Message) {
            $errorDetails = $_.ErrorDetails.Message | ConvertFrom-Json
            Write-Host "   Error: $($errorDetails.error)" -ForegroundColor Red
        }
    }
}

Write-Host "=====================================" -ForegroundColor Cyan
Write-Host "تم الانتهاء من الاختبار!`n" -ForegroundColor Green

