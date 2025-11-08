#!/bin/bash

# ===== CONFIGURACIÓN =====
SEARCH_TEXT="Login to Chatwoot"     # texto a buscar (sin espacio final)
REPLACE_TEXT="Ingresar a Cirvos"    # nuevo texto
PATH_TARGET="/app"                  # ruta fija

# ===== SCRIPT =====
echo "🔍 Buscando coincidencias de '$SEARCH_TEXT' en $PATH_TARGET..."
FILES=$(grep -Rl "$SEARCH_TEXT" "$PATH_TARGET")

if [ -z "$FILES" ]; then
  echo "❌ No se encontraron coincidencias para '$SEARCH_TEXT'."
  exit 0
fi

echo "✅ Archivos encontrados:"
echo "$FILES"
echo
read -p "¿Deseas reemplazar '$SEARCH_TEXT' por '$REPLACE_TEXT'? (s/n): " CONFIRM

if [[ "$CONFIRM" =~ ^[sS]$ ]]; then
  echo "🔄 Reemplazando texto..."
  echo "$FILES" | xargs sed -i "s|$SEARCH_TEXT|$REPLACE_TEXT|g"
  echo "✅ Reemplazo completado correctamente."
else
  echo "🚫 Operación cancelada."
fi


# grep -Rl "Login to Chatwoot" /app | xargs sed -i 's|Login to Chatwoot|Ingresar a Cirvos|g'

sed -i 's/class:"flex flex-col"/class:"flex flex-col hidden"/g' /app/public/vite/assets/v3app-D7nrcVmG.js

# Borrar Settings Security
sed -i 's/{name:"Settings Security",label:l("SIDEBAR.SECURITY"),icon:"i-lucide-shield",to:a("security_settings_index")},//g' /app/public/vite/assets/dashboard-n_HDIbaW.js
bash# Borrar Settings Sla

sed -i 's/{name:"Settings Sla",label:l("SIDEBAR.SLA"),icon:"i-lucide-clock-alert",to:a("sla_list")},//g' /app/public/vite/assets/dashboard-n_HDIbaW.js

sed -i 's/{name:"Settings Custom Roles",label:l("SIDEBAR.CUSTOM_ROLES"),icon:"i-lucide-shield-plus",to:a("custom_roles_list")},//g' /app/public/vite/assets/dashboard-n_HDIbaW.js

sed -i 's/{name:"Captain",icon:"i-woot-captain",label:l("SIDEBAR.CAPTAIN"),children:\[{name:"Assistants",label:l("SIDEBAR.CAPTAIN_ASSISTANTS"),to:a("captain_assistants_index")},{name:"Documents",label:l("SIDEBAR.CAPTAIN_DOCUMENTS"),to:a("captain_documents_index")},{name:"Responses",label:l("SIDEBAR.CAPTAIN_RESPONSES"),to:a("captain_responses_index")},{name:"Tools",label:l("SIDEBAR.CAPTAIN_TOOLS"),to:a("captain_tools_index")}\]},//g' /app/public/vite/assets/dashboard-n_HDIbaW.js