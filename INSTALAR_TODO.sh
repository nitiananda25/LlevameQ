#!/bin/bash

# ========================================
# LLEEVAMEQ - INSTALACIÓN AUTOMÁTICA COMPLETA
# Este script instala TODO automáticamente
# ========================================

clear
echo "╔══════════════════════════════════════════╗"
echo "║   🚀 LLEVAMEQ - INSTALACIÓN COMPLETA    ║"
echo "║   Instalación automática de todo        ║"
echo "╚══════════════════════════════════════════╝"
echo ""

# Colores
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m'

# Función para mostrar paso
show_step() {
    echo ""
    echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${CYAN}$1${NC}"
    echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo ""
}

# ========================================
# VERIFICAR PREREQUISITOS
# ========================================

show_step "📋 PASO 1/5: Verificando prerequisitos..."

# Verificar Node.js
if ! command -v node &> /dev/null; then
    echo -e "${RED}❌ Node.js no está instalado${NC}"
    echo ""
    echo "Por favor instala Node.js desde: https://nodejs.org"
    echo "Versión recomendada: 18 o superior"
    exit 1
fi

NODE_VERSION=$(node -v)
echo -e "${GREEN}✅ Node.js instalado: $NODE_VERSION${NC}"

# Verificar npm
if ! command -v npm &> /dev/null; then
    echo -e "${RED}❌ npm no está instalado${NC}"
    exit 1
fi

NPM_VERSION=$(npm -v)
echo -e "${GREEN}✅ npm instalado: $NPM_VERSION${NC}"

# Verificar Git
if command -v git &> /dev/null; then
    GIT_VERSION=$(git --version)
    echo -e "${GREEN}✅ Git instalado: $GIT_VERSION${NC}"
else
    echo -e "${YELLOW}⚠️  Git no instalado (opcional)${NC}"
fi

echo ""
echo -e "${GREEN}✅ Todos los prerequisitos están listos${NC}"
sleep 2

# ========================================
# INSTALAR BACKEND
# ========================================

show_step "🔧 PASO 2/5: Instalando Backend..."

cd lleevameq-backend

echo "Instalando dependencias del backend..."
npm install --silent

if [ $? -eq 0 ]; then
    echo -e "${GREEN}✅ Backend instalado exitosamente${NC}"
else
    echo -e "${RED}❌ Error instalando backend${NC}"
    exit 1
fi

cd ..

sleep 1

# ========================================
# INSTALAR APP PASAJEROS
# ========================================

show_step "📱 PASO 3/5: Instalando App Pasajeros..."

cd lleevameq-passenger-app

echo "Instalando dependencias de app pasajeros..."
npm install --silent

if [ $? -eq 0 ]; then
    echo -e "${GREEN}✅ App Pasajeros instalada exitosamente${NC}"
else
    echo -e "${RED}❌ Error instalando app pasajeros${NC}"
    exit 1
fi

cd ..

sleep 1

# ========================================
# INSTALAR APP CONDUCTORES
# ========================================

show_step "🚗 PASO 4/5: Instalando App Conductores..."

cd lleevameq-driver-app

echo "Instalando dependencias de app conductores..."
npm install --silent

if [ $? -eq 0 ]; then
    echo -e "${GREEN}✅ App Conductores instalada exitosamente${NC}"
else
    echo -e "${RED}❌ Error instalando app conductores${NC}"
    exit 1
fi

cd ..

sleep 1

# ========================================
# CONFIGURACIÓN FINAL
# ========================================

show_step "⚙️  PASO 5/5: Configuración final..."

# Crear .env si no existe
if [ ! -f "lleevameq-backend/.env" ]; then
    echo "Creando archivo .env..."
    cp lleevameq-backend/.env.example lleevameq-backend/.env
    echo -e "${GREEN}✅ Archivo .env creado${NC}"
else
    echo -e "${YELLOW}ℹ️  Archivo .env ya existe${NC}"
fi

# Dar permisos a scripts
chmod +x lleevameq-backend/*.sh 2>/dev/null
chmod +x *.sh 2>/dev/null

echo -e "${GREEN}✅ Permisos de scripts configurados${NC}"

sleep 1

# ========================================
# RESUMEN FINAL
# ========================================

clear
echo ""
echo "╔══════════════════════════════════════════╗"
echo "║   ✅ INSTALACIÓN COMPLETADA             ║"
echo "╚══════════════════════════════════════════╝"
echo ""
echo -e "${GREEN}🎉 ¡Todo está listo para usar!${NC}"
echo ""
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${CYAN}📊 RESUMEN DE INSTALACIÓN${NC}"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
echo -e "✅ Backend instalado:        ${GREEN}lleevameq-backend/${NC}"
echo -e "✅ App Pasajeros instalada:  ${GREEN}lleevameq-passenger-app/${NC}"
echo -e "✅ App Conductores instalada: ${GREEN}lleevameq-driver-app/${NC}"
echo -e "✅ Configuración lista:      ${GREEN}.env creado${NC}"
echo ""
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${CYAN}🚀 PRÓXIMOS PASOS${NC}"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
echo -e "${YELLOW}1. DEPLOY BACKEND A RAILWAY:${NC}"
echo "   cd lleevameq-backend"
echo "   ./setup-railway-completo.sh"
echo ""
echo -e "${YELLOW}2. ACTUALIZAR URLs EN APPS:${NC}"
echo "   Editar App.tsx en ambas apps (línea 23)"
echo "   Cambiar localhost por tu URL de Railway"
echo ""
echo -e "${YELLOW}3. GENERAR APKs:${NC}"
echo "   # App Pasajeros"
echo "   cd lleevameq-passenger-app/android"
echo "   ./gradlew assembleRelease"
echo ""
echo "   # App Conductores"
echo "   cd lleevameq-driver-app/android"
echo "   ./gradlew assembleRelease"
echo ""
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${CYAN}📖 DOCUMENTACIÓN${NC}"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
echo "Lee estos archivos en orden:"
echo "  1. README.md"
echo "  2. ESTADO_REAL_PROYECTO.md"
echo "  3. MANUAL_COMPLETO_SIN_FALLAR.md"
echo "  4. CHECKLIST_PRODUCCION.md"
echo ""
echo -e "${GREEN}✨ ¡Éxito! El proyecto está listo para trabajar.${NC}"
echo ""
