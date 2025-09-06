NOMBRE="Isaac"
HORA=$(date +%H)

if [$HORA -ge 6] && [$HORA -lt 12]; then
  echo "Buenos dias $Nombre, la hora actual es: $(date +%H:%M)"
elif [$HORA -ge 12] && [$HORA -lt 18]; then
  echo "Buenos tardes $Nombre, la hora actual es: $(date +%H:%M)"
else
  echo "Buenos noches $Nombre, la hora actual es: $(date +%H:%M)"
fi