# ⚡ INICIO RÁPIDO - RENDER EN 15 MINUTOS

## 🎯 3 COMANDOS = SISTEMA EN LÍNEA

```bash
# 1. Instalar (5 min)
./INSTALAR_TODO.sh

# 2. Deploy (10 min)
cd lleevameq-backend
./DEPLOY_RENDER.sh

# ¡LISTO! ✅
```

---

## 📋 PREREQUISITOS

```
✅ Node.js 18+  → https://nodejs.org
✅ Git          → https://git-scm.com
✅ Cuenta Render (gratis, sin tarjeta) → https://render.com
```

---

## 🚀 PASO A PASO

### PASO 1: Extraer (30 seg)

```bash
unzip lleevameq-render-completo.zip
cd lleevameq
```

---

### PASO 2: Instalar (5 min)

```bash
chmod +x INSTALAR_TODO.sh
./INSTALAR_TODO.sh
```

**Esto instala:**
- ✅ Backend
- ✅ App Pasajeros
- ✅ App Conductores

---

### PASO 3: Deploy a Render (10 min)

```bash
cd lleevameq-backend
chmod +x DEPLOY_RENDER.sh
./DEPLOY_RENDER.sh
```

**El script te guía:**
1. Crear cuenta Render
2. Crear PostgreSQL
3. Subir código
4. Deploy automático

---

### PASO 4: Obtener URL

Tu backend estará en:
```
https://llevameq-backend.onrender.com
```

---

## ✅ VERIFICAR

```bash
curl https://tu-url.onrender.com/api/health

# Respuesta: {"status":"ok"}
```

---

## 📱 ACTUALIZAR APPS

```typescript
// lleevameq-passenger-app/App.tsx (línea 23)
const API_URL = 'https://tu-url.onrender.com/api';

// lleevameq-driver-app/App.tsx (línea 23)
const API_URL = 'https://tu-url.onrender.com/api';
```

---

## 🎯 RESULTADO

```
✅ Backend en línea
✅ PostgreSQL gratis
✅ SSL/HTTPS automático
✅ Dominio .onrender.com gratis
✅ Apps actualizadas
✅ Listo para generar APKs

TOTAL: 15 minutos ⏱️
COSTO: $0 USD 💰
```

---

## 📖 MÁS INFO

- **README_RENDER.md** - Visión general
- **MANUAL_RENDER.md** - Guía completa (10 páginas)
- **DEPLOY_RENDER.sh** - Script automático

---

## 💡 TIPS

```
🎯 USA EL SCRIPT: ./DEPLOY_RENDER.sh hace todo
🌐 DOMINIO GRATIS: .onrender.com incluido
🔒 SSL GRATIS: HTTPS automático
💰 HOSTING GRATIS: 750 horas/mes
```

---

**¡Empieza ahora! Toma solo 15 minutos. 🚀**
