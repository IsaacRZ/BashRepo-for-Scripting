#!/bin/bash

# 1) Sincronizar repositorio para tener la ultima version del codigo
echo "Verificando estado repositorio y actualizando a la ultima version disponible"
git pull origin main

if [[ -n $(git status --porcelain) ]]; then
  echo "❌ Error: Cambios sin confirmar. Realizar un commit o stashea los cambios"
  exit 1 #Detenie el script en caso
fi

# 2) Checkear cambios sin confirmar 
#Def. Variables (Nombres y rutas)
DIRECTORIO_DESPLIEGUE="produccion"
SCRIPT_ORIGEN="$1"

#Condicional si el numero de parametros es igual a 0
if [ $# -eq 0 ]; then
  echo "❌ Parametros o argumentos faltantes."
  echo "Us"

# 3) Crear copia de "despliegue" si no existe
echo "📂 Verificando directorio de despliegue"
mkdir -p "$DIRECTORIO_DESPLIEGUE"

# 4) cp archivo "bienvenido.sh" al directorio
echo "Desplegando el script a $DIRECTORIO_DESPLIEGUE... 📨"
cp "$SCRIPT_ORIGEN" "$DIRECTORIO_DESPLIEGUE" 

# 5) Validar que la copia se haya realizado correctamente
if [ $? -eq 0 ]; then
  echo "Despliegue exitoso ✅"
else
  echo "❌ El despliegue tuvo una falla. Revisar permisos o rutas"
  exit 1
fi 

echo "El archivo '$SCRIPT_ORIGEN' a sido copiado exitosamente '$DIRECTORIO_DESPLIEGUE'✅"
echo "Se puede ejecutar el archivo usando '$DIRECTORIO_DESPLIEGUE/$SCRIPT_ORIGEN'"
