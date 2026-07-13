#!/bin/bash

# ========================================
# VERIFICAR ESTRUCTURA DE CARPETAS
# LlevameQ - Validar que todo esté en su lugar
# ========================================

clear
echo "╔══════════════════════════════════════════╗"
echo "║   📁 VERIFICACIÓN DE ESTRUCTURA        ║"
echo "║   LlevameQ - Validar carpetas           ║"
echo "╚══════════════════════════════════════════╝"
echo ""

# Colores
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m'

ERRORS=0
WARNINGS=0

# ========================================
# VERIFICAR UBICACIÓN ACTUAL
# ========================================

echo -e "${BLUE}📍 Verificando ubicación actual...${NC}"
echo ""

CURRENT_DIR=$(pwd)
CURRENT_NAME=$(basename "$CURRENT_DIR")

echo "Ubicación actual: $CURRENT_DIR"
echo "Carpeta actual: $CURRENT_NAME"
echo ""

if [ "$CURRENT_NAME" != "lleevameq" ] && [ "$CURRENT_NAME" != "outputs" ]; then
    echo -e "${YELLOW}⚠️  No estás en la carpeta 'lleevameq'${NC}"
    echo "   Esto puede estar bien si estás en la carpeta padre"
    WARNINGS=$((WARNINGS + 1))
else
    echo -e "${GREEN}✅ Ubicación correcta${NC}"
fi

echo ""

# ========================================
# VERIFICAR ESTRUCTURA DE BACKEND
# ========================================

echo -e "${BLUE}🔍 Verificando Backend...${NC}"
echo ""

if [ -d "lleevameq-backend" ]; then
    echo -e "${GREEN}✅ Carpeta lleevameq-backend/ existe${NC}"
    
    # Verificar src/
    if [ -d "lleevameq-backend/src" ]; then
        echo -e "${GREEN}  ✅ src/ existe${NC}"
    else
        echo -e "${RED}  ❌ src/ NO existe${NC}"
        ERRORS=$((ERRORS + 1))
    fi
    
    # Verificar package.json
    if [ -f "lleevameq-backend/package.json" ]; then
        echo -e "${GREEN}  ✅ package.json existe${NC}"
    else
        echo -e "${RED}  ❌ package.json NO existe${NC}"
        ERRORS=$((ERRORS + 1))
    fi
    
    # Verificar script principal
    if [ -f "lleevameq-backend/setup-railway-completo.sh" ]; then
        echo -e "${GREEN}  ✅ setup-railway-completo.sh existe${NC}"
    else
        echo -e "${YELLOW}  ⚠️  setup-railway-completo.sh NO existe${NC}"
        WARNINGS=$((WARNINGS + 1))
    fi
    
else
    echo -e "${RED}❌ Carpeta lleevameq-backend/ NO existe${NC}"
    ERRORS=$((ERRORS + 1))
fi

echo ""

# ========================================
# VERIFICAR APP PASAJEROS
# ========================================

echo -e "${BLUE}🔍 Verificando App Pasajeros...${NC}"
echo ""

if [ -d "lleevameq-passenger-app" ]; then
    echo -e "${GREEN}✅ Carpeta lleevameq-passenger-app/ existe${NC}"
    
    # Verificar App.tsx
    if [ -f "lleevameq-passenger-app/App.tsx" ]; then
        echo -e "${GREEN}  ✅ App.tsx existe${NC}"
    else
        echo -e "${RED}  ❌ App.tsx NO existe${NC}"
        ERRORS=$((ERRORS + 1))
    fi
    
    # Verificar assets/
    if [ -d "lleevameq-passenger-app/assets" ]; then
        echo -e "${GREEN}  ✅ assets/ existe${NC}"
        
        # Verificar logo
        if [ -f "lleevameq-passenger-app/assets/logo-llevameq.png" ]; then
            echo -e "${GREEN}    ✅ logo-llevameq.png existe${NC}"
        else
            echo -e "${YELLOW}    ⚠️  logo-llevameq.png NO existe${NC}"
            WARNINGS=$((WARNINGS + 1))
        fi
    else
        echo -e "${YELLOW}  ⚠️  assets/ NO existe${NC}"
        WARNINGS=$((WARNINGS + 1))
    fi
    
    # Verificar android/
    if [ -d "lleevameq-passenger-app/android" ]; then
        echo -e "${GREEN}  ✅ android/ existe${NC}"
        
        # Verificar gradlew
        if [ -f "lleevameq-passenger-app/android/gradlew" ]; then
            echo -e "${GREEN}    ✅ gradlew existe${NC}"
        else
            echo -e "${RED}    ❌ gradlew NO existe${NC}"
            ERRORS=$((ERRORS + 1))
        fi
    else
        echo -e "${RED}  ❌ android/ NO existe${NC}"
        ERRORS=$((ERRORS + 1))
    fi
    
    # Verificar SplashScreen.tsx
    if [ -f "lleevameq-passenger-app/SplashScreen.tsx" ]; then
        echo -e "${GREEN}  ✅ SplashScreen.tsx existe${NC}"
    else
        echo -e "${YELLOW}  ⚠️  SplashScreen.tsx NO existe${NC}"
        WARNINGS=$((WARNINGS + 1))
    fi
    
    # Verificar colors.js
    if [ -f "lleevameq-passenger-app/colors.js" ]; then
        echo -e "${GREEN}  ✅ colors.js existe${NC}"
    else
        echo -e "${YELLOW}  ⚠️  colors.js NO existe${NC}"
        WARNINGS=$((WARNINGS + 1))
    fi
    
else
    echo -e "${RED}❌ Carpeta lleevameq-passenger-app/ NO existe${NC}"
    ERRORS=$((ERRORS + 1))
fi

echo ""

# ========================================
# VERIFICAR APP CONDUCTORES
# ========================================

echo -e "${BLUE}🔍 Verificando App Conductores...${NC}"
echo ""

if [ -d "lleevameq-driver-app" ]; then
    echo -e "${GREEN}✅ Carpeta lleevameq-driver-app/ existe${NC}"
    
    # Verificar App.tsx
    if [ -f "lleevameq-driver-app/App.tsx" ]; then
        echo -e "${GREEN}  ✅ App.tsx existe${NC}"
    else
        echo -e "${RED}  ❌ App.tsx NO existe${NC}"
        ERRORS=$((ERRORS + 1))
    fi
    
    # Verificar assets/
    if [ -d "lleevameq-driver-app/assets" ]; then
        echo -e "${GREEN}  ✅ assets/ existe${NC}"
        
        # Verificar logo
        if [ -f "lleevameq-driver-app/assets/logo-llevameq.png" ]; then
            echo -e "${GREEN}    ✅ logo-llevameq.png existe${NC}"
        else
            echo -e "${YELLOW}    ⚠️  logo-llevameq.png NO existe${NC}"
            WARNINGS=$((WARNINGS + 1))
        fi
    else
        echo -e "${YELLOW}  ⚠️  assets/ NO existe${NC}"
        WARNINGS=$((WARNINGS + 1))
    fi
    
    # Verificar android/
    if [ -d "lleevameq-driver-app/android" ]; then
        echo -e "${GREEN}  ✅ android/ existe${NC}"
        
        # Verificar gradlew
        if [ -f "lleevameq-driver-app/android/gradlew" ]; then
            echo -e "${GREEN}    ✅ gradlew existe${NC}"
        else
            echo -e "${RED}    ❌ gradlew NO existe${NC}"
            ERRORS=$((ERRORS + 1))
        fi
    else
        echo -e "${RED}  ❌ android/ NO existe${NC}"
        ERRORS=$((ERRORS + 1))
    fi
    
    # Verificar SplashScreen.tsx
    if [ -f "lleevameq-driver-app/SplashScreen.tsx" ]; then
        echo -e "${GREEN}  ✅ SplashScreen.tsx existe${NC}"
    else
        echo -e "${YELLOW}  ⚠️  SplashScreen.tsx NO existe${NC}"
        WARNINGS=$((WARNINGS + 1))
    fi
    
    # Verificar colors.js
    if [ -f "lleevameq-driver-app/colors.js" ]; then
        echo -e "${GREEN}  ✅ colors.js existe${NC}"
    else
        echo -e "${YELLOW}  ⚠️  colors.js NO existe${NC}"
        WARNINGS=$((WARNINGS + 1))
    fi
    
else
    echo -e "${RED}❌ Carpeta lleevameq-driver-app/ NO existe${NC}"
    ERRORS=$((ERRORS + 1))
fi

echo ""

# ========================================
# VERIFICAR DOCUMENTACIÓN
# ========================================

echo -e "${BLUE}🔍 Verificando Documentación...${NC}"
echo ""

DOCS_COUNT=0

# Contar archivos .md
if ls *.md &> /dev/null; then
    DOCS_COUNT=$(ls *.md 2>/dev/null | wc -l)
    echo -e "${GREEN}✅ Archivos .md encontrados: $DOCS_COUNT${NC}"
else
    echo -e "${YELLOW}⚠️  No se encontraron archivos .md en esta carpeta${NC}"
    WARNINGS=$((WARNINGS + 1))
fi

# Verificar archivos clave
KEY_DOCS=(
    "MANUAL_COMPLETO_SIN_FALLAR.md"
    "ESTRUCTURA_CARPETAS.md"
    "LOGO_GUIA_RAPIDA.md"
)

for doc in "${KEY_DOCS[@]}"; do
    if [ -f "$doc" ]; then
        echo -e "${GREEN}  ✅ $doc${NC}"
    else
        echo -e "${YELLOW}  ⚠️  $doc no encontrado${NC}"
    fi
done

echo ""

# ========================================
# VERIFICAR LOGO
# ========================================

echo -e "${BLUE}🔍 Verificando Logo...${NC}"
echo ""

if [ -f "logo-llevameq.png" ]; then
    SIZE=$(du -h logo-llevameq.png | cut -f1)
    echo -e "${GREEN}✅ logo-llevameq.png existe (${SIZE})${NC}"
else
    echo -e "${YELLOW}⚠️  logo-llevameq.png NO existe en raíz${NC}"
    WARNINGS=$((WARNINGS + 1))
fi

echo ""

# ========================================
# VERIFICAR SCRIPTS
# ========================================

echo -e "${BLUE}🔍 Verificando Scripts...${NC}"
echo ""

SCRIPTS=(
    "deploy-todo.sh"
    "verificar.sh"
    "integrar-logo.sh"
)

for script in "${SCRIPTS[@]}"; do
    if [ -f "$script" ]; then
        if [ -x "$script" ]; then
            echo -e "${GREEN}  ✅ $script (ejecutable)${NC}"
        else
            echo -e "${YELLOW}  ⚠️  $script (no ejecutable)${NC}"
            WARNINGS=$((WARNINGS + 1))
        fi
    else
        echo -e "${YELLOW}  ⚠️  $script no encontrado${NC}"
    fi
done

echo ""

# ========================================
# RESUMEN
# ========================================

echo ""
echo "╔══════════════════════════════════════════╗"
echo "║   📊 RESUMEN DE VERIFICACIÓN           ║"
echo "╚══════════════════════════════════════════╝"
echo ""

if [ $ERRORS -eq 0 ] && [ $WARNINGS -eq 0 ]; then
    echo -e "${GREEN}✅ TODO PERFECTO${NC}"
    echo ""
    echo "La estructura está completa y correcta."
    echo "Puedes proceder con el deployment."
    echo ""
    
elif [ $ERRORS -eq 0 ]; then
    echo -e "${YELLOW}⚠️  ESTRUCTURA FUNCIONAL CON ADVERTENCIAS${NC}"
    echo ""
    echo "Errores críticos: 0"
    echo "Advertencias: $WARNINGS"
    echo ""
    echo "La estructura funciona pero algunos archivos opcionales faltan."
    echo "Puedes proceder, pero revisa las advertencias."
    echo ""
    
else
    echo -e "${RED}❌ ESTRUCTURA INCOMPLETA${NC}"
    echo ""
    echo "Errores críticos: $ERRORS"
    echo "Advertencias: $WARNINGS"
    echo ""
    echo "Faltan archivos/carpetas esenciales."
    echo "Revisa los errores arriba antes de continuar."
    echo ""
fi

# ========================================
# RECOMENDACIONES
# ========================================

if [ $ERRORS -gt 0 ] || [ $WARNINGS -gt 0 ]; then
    echo -e "${BLUE}💡 RECOMENDACIONES:${NC}"
    echo ""
    
    if [ ! -d "lleevameq-backend" ] || [ ! -d "lleevameq-passenger-app" ] || [ ! -d "lleevameq-driver-app" ]; then
        echo "1. Asegúrate de haber descargado todas las carpetas"
        echo "2. Estructura correcta: lleevameq/"
        echo "   ├─ lleevameq-backend/"
        echo "   ├─ lleevameq-passenger-app/"
        echo "   └─ lleevameq-driver-app/"
        echo ""
    fi
    
    if [ $WARNINGS -gt 0 ]; then
        echo "Para copiar archivos faltantes:"
        echo "  ./integrar-logo.sh      # Integrar logo"
        echo ""
    fi
    
    echo "Lee la guía completa:"
    echo "  cat ESTRUCTURA_CARPETAS.md"
    echo ""
fi

# ========================================
# PRÓXIMOS PASOS
# ========================================

if [ $ERRORS -eq 0 ]; then
    echo -e "${GREEN}📋 PRÓXIMOS PASOS:${NC}"
    echo ""
    echo "1. cd lleevameq-backend"
    echo "2. ./setup-railway-completo.sh"
    echo "3. Copiar URL del backend"
    echo "4. Editar App.tsx en ambas apps"
    echo "5. Generar APKs"
    echo ""
fi

exit $ERRORS
