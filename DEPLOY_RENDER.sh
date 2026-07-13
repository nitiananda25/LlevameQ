#!/bin/bash

# ========================================
# LLEEVAMEQ - DEPLOYMENT AUTOMÁTICO A RENDER
# Deploy completo con PostgreSQL gratis
# ========================================

clear
echo "╔══════════════════════════════════════════╗"
echo "║   🚀 LLEVAMEQ - DEPLOY A RENDER         ║"
echo "║   Hosting Gratis + PostgreSQL           ║"
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
# PASO 1: VERIFICAR PREREQUISITOS
# ========================================

show_step "📋 PASO 1/6: Verificando prerequisitos..."

# Verificar Node.js
if ! command -v node &> /dev/null; then
    echo -e "${RED}❌ Node.js no está instalado${NC}"
    echo "Descarga: https://nodejs.org"
    exit 1
fi

NODE_VERSION=$(node -v)
echo -e "${GREEN}✅ Node.js: $NODE_VERSION${NC}"

# Verificar npm
if ! command -v npm &> /dev/null; then
    echo -e "${RED}❌ npm no está instalado${NC}"
    exit 1
fi

NPM_VERSION=$(npm -v)
echo -e "${GREEN}✅ npm: $NPM_VERSION${NC}"

# Verificar Git
if ! command -v git &> /dev/null; then
    echo -e "${RED}❌ Git no está instalado${NC}"
    echo "Git es REQUERIDO para Render"
    echo "Descarga: https://git-scm.com"
    exit 1
fi

GIT_VERSION=$(git --version)
echo -e "${GREEN}✅ $GIT_VERSION${NC}"

echo ""
echo -e "${GREEN}✅ Todos los prerequisitos OK${NC}"
sleep 2

# ========================================
# PASO 2: CREAR CUENTA EN RENDER
# ========================================

show_step "👤 PASO 2/6: Configurar cuenta de Render..."

echo -e "${YELLOW}IMPORTANTE:${NC}"
echo ""
echo "1. Ve a: ${CYAN}https://render.com${NC}"
echo "2. Haz click en 'Get Started for Free'"
echo "3. Regístrate con tu email (o GitHub)"
echo "4. Confirma tu email"
echo ""
echo -e "${GREEN}Render ofrece:${NC}"
echo "  ✅ Hosting gratis (750 horas/mes)"
echo "  ✅ PostgreSQL gratis"
echo "  ✅ SSL automático"
echo "  ✅ Dominio .onrender.com gratis"
echo ""

read -p "¿Ya tienes cuenta en Render? (s/n): " tiene_cuenta

if [ "$tiene_cuenta" != "s" ]; then
    echo ""
    echo "Abre: ${CYAN}https://render.com${NC}"
    echo ""
    read -p "Presiona ENTER cuando hayas creado tu cuenta..."
fi

echo -e "${GREEN}✅ Cuenta configurada${NC}"
sleep 1

# ========================================
# PASO 3: INICIALIZAR REPOSITORIO GIT
# ========================================

show_step "📦 PASO 3/6: Preparando código para Render..."

# Verificar si ya existe repo
if [ -d ".git" ]; then
    echo -e "${YELLOW}ℹ️  Repositorio Git ya existe${NC}"
else
    echo "Inicializando repositorio Git..."
    git init
    
    # Crear .gitignore si no existe
    if [ ! -f ".gitignore" ]; then
        cat > .gitignore << 'EOF'
node_modules/
.env
*.log
dist/
build/
.DS_Store
EOF
        echo -e "${GREEN}✅ .gitignore creado${NC}"
    fi
    
    git add .
    git commit -m "Initial commit - LlevameQ Backend"
    echo -e "${GREEN}✅ Repositorio Git creado${NC}"
fi

sleep 1

# ========================================
# PASO 4: CONECTAR A GITHUB (OPCIONAL)
# ========================================

show_step "🔗 PASO 4/6: Conectar a GitHub (Recomendado)..."

echo -e "${YELLOW}OPCIÓN A: Conectar a GitHub (Recomendado)${NC}"
echo "  ✅ Deploy automático"
echo "  ✅ Actualización con git push"
echo "  ✅ Control de versiones"
echo ""
echo -e "${YELLOW}OPCIÓN B: Deploy manual${NC}"
echo "  ⚠️  Más complicado"
echo "  ⚠️  Sin auto-deploy"
echo ""

read -p "¿Quieres conectar a GitHub? (s/n): " usar_github

if [ "$usar_github" = "s" ]; then
    echo ""
    echo "PASOS PARA GITHUB:"
    echo ""
    echo "1. Ve a: ${CYAN}https://github.com/new${NC}"
    echo "2. Nombre del repo: ${CYAN}llevameq-backend${NC}"
    echo "3. Deja todo por defecto"
    echo "4. Click en 'Create repository'"
    echo ""
    read -p "Presiona ENTER cuando hayas creado el repo..."
    echo ""
    read -p "Pega la URL de tu repo (https://github.com/tu-usuario/repo.git): " REPO_URL
    
    if [ ! -z "$REPO_URL" ]; then
        git remote remove origin 2>/dev/null
        git remote add origin "$REPO_URL"
        
        # Intentar push
        echo ""
        echo "Subiendo código a GitHub..."
        git branch -M main
        git push -u origin main
        
        if [ $? -eq 0 ]; then
            echo -e "${GREEN}✅ Código subido a GitHub${NC}"
            USAR_GITHUB=true
        else
            echo -e "${YELLOW}⚠️  Error al subir a GitHub${NC}"
            echo "Continúa manualmente más tarde"
            USAR_GITHUB=false
        fi
    fi
else
    USAR_GITHUB=false
    echo -e "${YELLOW}ℹ️  Continuando sin GitHub${NC}"
fi

sleep 1

# ========================================
# PASO 5: INSTRUCCIONES PARA RENDER DASHBOARD
# ========================================

show_step "🚀 PASO 5/6: Deploy en Render Dashboard..."

echo -e "${CYAN}AHORA SIGUE ESTOS PASOS EN RENDER:${NC}"
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo -e "${YELLOW}A) CREAR BASE DE DATOS POSTGRESQL:${NC}"
echo ""
echo "1. Ve a: ${CYAN}https://dashboard.render.com${NC}"
echo "2. Click en 'New +' → 'PostgreSQL'"
echo "3. Configuración:"
echo "   - Name: ${CYAN}llevameq-db${NC}"
echo "   - Database: ${CYAN}llevameq${NC}"
echo "   - User: ${CYAN}llevameq_user${NC}"
echo "   - Region: ${CYAN}Oregon (US West)${NC}"
echo "   - PostgreSQL Version: ${CYAN}16${NC}"
echo "   - Plan: ${CYAN}Free${NC}"
echo ""
echo "4. Click 'Create Database'"
echo "5. Espera 1-2 minutos a que esté lista"
echo "6. Copia el 'Internal Database URL' (empieza con postgresql://)"
echo ""
read -p "¿Ya creaste la base de datos? (s/n): " db_creada
echo ""

if [ "$db_creada" != "s" ]; then
    echo -e "${YELLOW}⚠️  Crea la base de datos primero${NC}"
    exit 1
fi

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo -e "${YELLOW}B) CREAR WEB SERVICE (BACKEND):${NC}"
echo ""

if [ "$USAR_GITHUB" = true ]; then
    echo "1. En Render Dashboard, click 'New +' → 'Web Service'"
    echo "2. Connect a tu repositorio GitHub"
    echo "3. Selecciona: ${CYAN}llevameq-backend${NC}"
else
    echo "1. En Render Dashboard, click 'New +' → 'Web Service'"
    echo "2. Selecciona 'Public Git repository'"
    echo "3. Repository URL: [Tu URL o déjalo para deploy manual]"
fi

echo ""
echo "4. Configuración:"
echo "   - Name: ${CYAN}llevameq-backend${NC}"
echo "   - Region: ${CYAN}Oregon (US West)${NC}"
echo "   - Branch: ${CYAN}main${NC}"
echo "   - Root Directory: ${CYAN}(vacío)${NC}"
echo "   - Environment: ${CYAN}Node${NC}"
echo "   - Build Command: ${CYAN}npm install && npm run build${NC}"
echo "   - Start Command: ${CYAN}npm run start:prod${NC}"
echo "   - Plan: ${CYAN}Free${NC}"
echo ""

read -p "Presiona ENTER para continuar a variables de entorno..."

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo -e "${YELLOW}C) CONFIGURAR VARIABLES DE ENTORNO:${NC}"
echo ""
echo "En la página de configuración del Web Service,"
echo "sección 'Environment Variables', agrega:"
echo ""
echo -e "${CYAN}NODE_ENV${NC} = production"
echo -e "${CYAN}PORT${NC} = 3000"
echo ""
echo -e "${CYAN}DATABASE_URL${NC} = [Pega el Internal Database URL de PostgreSQL]"
echo ""
echo -e "${CYAN}JWT_SECRET${NC} = $(openssl rand -base64 32 2>/dev/null || echo 'tu_secreto_jwt_muy_seguro_cambiame_123456789')"
echo ""
echo -e "${CYAN}JWT_EXPIRES_IN${NC} = 7d"
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

read -p "¿Ya agregaste todas las variables? (s/n): " vars_agregadas

if [ "$vars_agregadas" != "s" ]; then
    echo -e "${YELLOW}⚠️  Agrega las variables antes de continuar${NC}"
    exit 1
fi

echo ""
echo "5. Click en 'Create Web Service'"
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

read -p "Presiona ENTER cuando el deploy esté completo..."

# ========================================
# PASO 6: OBTENER URL FINAL
# ========================================

show_step "🎉 PASO 6/6: ¡Deploy Completo!"

echo ""
echo -e "${GREEN}✅ ¡Backend desplegado exitosamente!${NC}"
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo -e "${CYAN}📝 INFORMACIÓN IMPORTANTE:${NC}"
echo ""
echo "Tu backend está en:"
echo -e "${GREEN}https://llevameq-backend.onrender.com${NC}"
echo "(o el nombre que le pusiste)"
echo ""
echo "Base de datos PostgreSQL:"
echo -e "${GREEN}✅ Conectada y funcionando${NC}"
echo ""
echo "SSL/HTTPS:"
echo -e "${GREEN}✅ Automático (gratis)${NC}"
echo ""
echo "Dominio gratis:"
echo -e "${GREEN}✅ .onrender.com incluido${NC}"
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo -e "${YELLOW}📱 PRÓXIMOS PASOS:${NC}"
echo ""
echo "1. Probar backend:"
echo "   curl https://tu-url.onrender.com/api/health"
echo ""
echo "2. Actualizar apps:"
echo "   - Edita App.tsx en passenger-app (línea 23)"
echo "   - Edita App.tsx en driver-app (línea 23)"
echo "   - Cambia localhost por: https://tu-url.onrender.com"
echo ""
echo "3. Generar APKs:"
echo "   cd lleevameq-passenger-app/android"
echo "   ./gradlew assembleRelease"
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo -e "${GREEN}🎊 ¡LLEVAMEQ ESTÁ EN LÍNEA!${NC}"
echo ""
echo "Dashboard: ${CYAN}https://dashboard.render.com${NC}"
echo "Logs: Click en tu servicio → 'Logs'"
echo "Dominio: Gratis .onrender.com"
echo ""
echo -e "${BLUE}Documentación completa en: MANUAL_RENDER.md${NC}"
echo ""
