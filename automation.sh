#!/bin/bash

#Automatizacion de sincronizacion con un repositorio de GitHub
# 1) Actualizacion completa del repositorio para trabajar 
#    con la ultima actualizacion.

echo "Pulling last updates"
git pull origin main

if [[ -n $(git status -s) ]]; then
  echo "Se detectaron cambios locales. Agregando y confirmando..." 
  git add .
  git commit -m "Sincronizacion automatizada $(date +%Y-%m-%d)"
  echo "Pushing changes"
  git push origin main
else
  echo "No se detectaron cambios"
fi
  echo "Sincronizacion completa"