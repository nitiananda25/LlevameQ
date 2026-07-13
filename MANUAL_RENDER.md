# 🚀 MANUAL COMPLETO - RENDER + DOMINIO GRATIS

## 🎯 LO QUE VAS A OBTENER

```
✅ Backend en línea (hosting gratis)
✅ PostgreSQL gratis
✅ SSL/HTTPS automático
✅ Dominio .onrender.com gratis
✅ Opción: Dominio personalizado gratis
✅ Todo funcionando en 15 minutos
```

---

## ⚡ MÉTODO RÁPIDO (15 minutos)

### PASO 1: Ejecutar Script (5 min)

```bash
cd lleevameq-backend
chmod +x DEPLOY_RENDER.sh
./DEPLOY_RENDER.sh
```

¡El script te guía paso a paso!

---

## 📋 MÉTODO MANUAL DETALLADO

### PREREQUISITOS:

```
✅ Node.js 18+
✅ npm
✅ Git
✅ Cuenta en Render.com (gratis)
✅ Cuenta en GitHub (gratis)
```

---

### PASO 1: Crear Cuenta en Render

1. Ve a: **https://render.com**
2. Click en "Get Started for Free"
3. Regístrate con:
   - Email
   - O GitHub (recomendado)
4. Confirma tu email

**Beneficios del plan gratis:**
- ✅ 750 horas/mes de hosting
- ✅ PostgreSQL gratis
- ✅ SSL automático
- ✅ Dominio .onrender.com
- ✅ Deploy automático

---

### PASO 2: Subir Código a GitHub

```bash
cd lleevameq-backend

# Inicializar Git
git init

# Agregar archivos
git add .
git commit -m "Initial commit - LlevameQ Backend"

# Crear repo en GitHub
# Ve a: https://github.com/new
# Nombre: llevameq-backend

# Conectar y subir
git remote add origin https://github.com/TU-USUARIO/llevameq-backend.git
git branch -M main
git push -u origin main
```

---

### PASO 3: Crear Base de Datos PostgreSQL

1. En Render Dashboard: **https://dashboard.render.com**
2. Click "New +" → "PostgreSQL"
3. Configuración:
   ```
   Name:              llevameq-db
   Database:          llevameq
   User:              llevameq_user
   Region:            Oregon (US West)
   PostgreSQL Version: 16
   Plan:              Free
   ```
4. Click "Create Database"
5. Espera 1-2 minutos
6. **IMPORTANTE:** Copia el "Internal Database URL"
   - Formato: `postgresql://user:pass@host/db`

---

### PASO 4: Crear Web Service (Backend)

1. En Render Dashboard, click "New +" → "Web Service"
2. Conecta tu repositorio de GitHub
3. Selecciona: **llevameq-backend**
4. Configuración:

```
Name:           llevameq-backend
Region:         Oregon (US West)
Branch:         main
Root Directory: (vacío)
Environment:    Node
Build Command:  npm install && npm run build
Start Command:  npm run start:prod
Plan:           Free
```

5. Click "Advanced" para variables de entorno

---

### PASO 5: Variables de Entorno

Agrega estas variables en "Environment Variables":

```
NODE_ENV        = production
PORT            = 3000
DATABASE_URL    = [Pega Internal Database URL]
JWT_SECRET      = [Genera uno seguro]*
JWT_EXPIRES_IN  = 7d
```

**Generar JWT_SECRET seguro:**
```bash
openssl rand -base64 32
```

O usa: `tu_secreto_jwt_muy_seguro_123456789`

---

### PASO 6: Deploy

1. Click "Create Web Service"
2. Render comenzará el deploy automáticamente
3. Espera 3-5 minutos
4. Verás logs en tiempo real

**Deploy exitoso cuando veas:**
```
==> Your service is live 🎉
```

---

### PASO 7: Obtener URL

Tu backend estará en:
```
https://llevameq-backend.onrender.com
```

(O el nombre que le pusiste)

---

## 🌐 DOMINIO GRATIS INCLUIDO

### Opción A: Usar .onrender.com (Gratis)

```
✅ Ya incluido automáticamente
✅ SSL/HTTPS automático
✅ Sin configuración extra

URL: https://llevameq-backend.onrender.com
```

**Ventajas:**
- ✅ Gratis
- ✅ Inmediato
- ✅ SSL incluido

**Desventajas:**
- ⚠️ Nombre largo
- ⚠️ No es personalizado

---

### Opción B: Dominio Personalizado Gratis

#### 1. Freenom (.tk, .ml, .ga, .cf, .gq)

**Paso a paso:**

1. Ve a: **https://www.freenom.com**
2. Busca un dominio disponible:
   - `llevameq.tk`
   - `llevameq.ml`
   - `llevameq.ga`
3. Click "Get it now!"
4. Checkout (gratis, 12 meses)
5. Crea cuenta en Freenom

**Configurar DNS:**
```
Ve a: My Domains → Manage Domain → Management Tools → Nameservers

Usa nameservers personalizados:
- ns1.render.com
- ns2.render.com
```

**En Render Dashboard:**
```
1. Ve a tu Web Service
2. Settings → Custom Domains
3. Click "Add Custom Domain"
4. Ingresa: llevameq.tk
5. Render configurará SSL automáticamente
```

**Tiempo:** 15-30 minutos para propagación

---

#### 2. Cloudflare (con dominio gratis)

**Paso a paso:**

1. Crea cuenta en: **https://www.cloudflare.com**
2. Agrega tu sitio (puedes usar el .onrender.com)
3. Cloudflare te da DNS gratis
4. Configura CNAME:
   ```
   Type:  CNAME
   Name:  @
   Value: llevameq-backend.onrender.com
   ```
5. SSL: Full (strict)

---

#### 3. DuckDNS (Subdominio gratis)

**Paso a paso:**

1. Ve a: **https://www.duckdns.org**
2. Login con GitHub/Google
3. Agrega un dominio:
   - `llevameq.duckdns.org`
4. Copia tu token
5. Configura:
   ```
   Domain: llevameq
   IP:     [IP de Render]
   ```

---

## 🔧 CONFIGURACIÓN AVANZADA

### Health Check Endpoint

En tu backend (ya incluido):

```typescript
// src/main.ts o src/app.controller.ts
@Get('/health')
health() {
  return { status: 'ok' };
}
```

---

### CORS Configuración

Para las apps móviles:

```typescript
// src/main.ts
app.enableCors({
  origin: '*', // O tu dominio específico
  methods: 'GET,HEAD,PUT,PATCH,POST,DELETE',
  credentials: true,
});
```

---

### Variables de Entorno Adicionales

```
# Opcional: Para producción
THROTTLE_TTL=60
THROTTLE_LIMIT=10
LOG_LEVEL=info

# Si usas ePayco
EPAYCO_PUBLIC_KEY=tu_key_public
EPAYCO_PRIVATE_KEY=tu_key_private

# Si usas emails
SMTP_HOST=smtp.gmail.com
SMTP_PORT=587
SMTP_USER=tu_email@gmail.com
SMTP_PASS=tu_password
```

---

## ✅ VERIFICAR QUE TODO FUNCIONA

### Test 1: Health Check

```bash
curl https://llevameq-backend.onrender.com/api/health
```

**Respuesta esperada:**
```json
{"status":"ok"}
```

---

### Test 2: Base de Datos

```bash
curl https://llevameq-backend.onrender.com/api/users
```

**Respuesta esperada:**
```json
[]
```

O lista de usuarios si ya hay datos.

---

### Test 3: Registro de Usuario

```bash
curl -X POST https://llevameq-backend.onrender.com/api/auth/register \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Test User",
    "email": "test@test.com",
    "password": "password123",
    "phone": "3001234567",
    "role": "passenger"
  }'
```

---

## 📱 ACTUALIZAR APPS CON NUEVA URL

### App Pasajeros

**Archivo:** `lleevameq-passenger-app/App.tsx`

```typescript
// Línea 23 (aproximadamente)
const API_URL = 'https://llevameq-backend.onrender.com/api';
const WS_URL = 'https://llevameq-backend.onrender.com';
```

---

### App Conductores

**Archivo:** `lleevameq-driver-app/App.tsx`

```typescript
// Línea 23 (aproximadamente)
const API_URL = 'https://llevameq-backend.onrender.com/api';
const WS_URL = 'https://llevameq-backend.onrender.com';
```

---

## 🚀 GENERAR APKs CON NUEVA URL

```bash
# App Pasajeros
cd lleevameq-passenger-app/android
./gradlew clean
./gradlew assembleRelease

# APK en:
# app/build/outputs/apk/release/app-release.apk

# App Conductores
cd ../../lleevameq-driver-app/android
./gradlew clean
./gradlew assembleRelease

# APK en:
# app/build/outputs/apk/release/app-release.apk
```

---

## 📊 MONITOREO Y LOGS

### Ver Logs en Vivo

1. Render Dashboard
2. Click en tu servicio
3. Pestaña "Logs"
4. Ver logs en tiempo real

### Métricas

1. Render Dashboard
2. Click en tu servicio
3. Pestaña "Metrics"
4. Ver uso de CPU, memoria, peticiones

---

## 🔄 ACTUALIZAR EL BACKEND

### Deploy Automático (con GitHub)

```bash
cd lleevameq-backend

# Hacer cambios en el código
git add .
git commit -m "Descripción de cambios"
git push

# Render detecta el push y deploya automáticamente
```

### Deploy Manual

1. Render Dashboard
2. Tu servicio → "Manual Deploy"
3. Click "Deploy latest commit"

---

## ⚠️ LIMITACIONES DEL PLAN GRATIS

```
CPU:          0.1 CPU
RAM:          512 MB
Disco:        Sin límite
Tráfico:      100 GB/mes
SSL:          ✅ Incluido
Dominio:      ✅ .onrender.com
PostgreSQL:   1 GB almacenamiento
Sleep:        ⚠️ Después de 15 min inactividad
```

**Sleep Mode:**
- Backend se "duerme" tras 15 min sin uso
- Primera petición tarda 30-60 segundos en "despertar"
- Peticiones subsecuentes son normales

**Solución:**
- Actualizar a plan de pago ($7/mes)
- O usar cron job para mantenerlo activo

---

## 💰 PLANES DE RENDER

```
FREE:
$0/mes
- 750 horas/mes
- Sleep después de 15 min inactividad
- PostgreSQL 1 GB

STARTER:
$7/mes
- Sin sleep
- Más CPU/RAM
- PostgreSQL 10 GB

STANDARD:
$25/mes
- Más recursos
- PostgreSQL 50 GB
- Soporte prioritario
```

---

## 🎯 RESUMEN EJECUTIVO

```
╔═══════════════════════════════════════════╗
║  RENDER: MEJOR OPCIÓN GRATUITA            ║
╚═══════════════════════════════════════════╝

✅ Hosting gratis (750h/mes)
✅ PostgreSQL gratis (1GB)
✅ SSL/HTTPS automático
✅ Dominio .onrender.com gratis
✅ Deploy automático desde GitHub
✅ Logs y métricas incluidos
✅ Sin tarjeta de crédito requerida

PERFECTO PARA:
- Desarrollo
- Testing
- MVP
- Demos
- Producción pequeña

TIEMPO DE SETUP:
- Con script: 15 minutos
- Manual: 30 minutos
```

---

## 📞 SOPORTE

**Documentación Render:**
- https://render.com/docs

**Comunidad:**
- https://community.render.com

**Support:**
- support@render.com

---

## 🎊 ¡LISTO!

```
✅ Backend en línea
✅ PostgreSQL funcionando
✅ SSL/HTTPS activo
✅ Dominio gratis
✅ Apps actualizadas
✅ APKs generados

¡LLEVAMEQ ESTÁ VIVO EN INTERNET! 🚀
```

---

**Creado para Que - LlevameQ**  
**Deploy Render + Dominio Gratis**  
**Enero 21, 2026**  
**Quibdó, Chocó, Colombia 🇨🇴**
