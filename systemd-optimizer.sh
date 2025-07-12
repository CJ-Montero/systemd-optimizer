#!/bin/bash

# Script para desactivar servicios de systemd no esenciales en un entorno doméstico
# Nombre: systemd-optimizer
# Uso: sudo ./systemd-optimizer.sh
# Precaución: Revisa las necesidades de tu sistema antes de ejecutar este script

# Arte ASCII para el título
cat << "EOF"

┌─┐┬ ┬┌─┐┌┬┐┌─┐┌┬┐┌┬┐   ┌─┐┌─┐┌┬┐┬┌┬┐┬┌─┐┌─┐┬─┐
└─┐└┬┘└─┐ │ ├┤ │││ ││───│ │├─┘ │ │││││┌─┘├┤ ├┬┘
└─┘ ┴ └─┘ ┴ └─┘┴ ┴─┴┘   └─┘┴   ┴ ┴┴ ┴┴└─┘└─┘┴└─
                                                                                                                                      

EOF

# Lista de servicios no esenciales que se pueden desactivar
SERVICES=(
    "apport.service"
    "cups-browsed.service"
    "geoclue.service"
    "kerneloops.service"
    "speech-dispatcher.service"
    "rtkit-daemon.service"
    "systemd-rfkill.service"
    "udisks2.service"
    "colord.service"
    "packagekit.service"
    "avahi-daemon.service"
    "bluetooth.service"
    "ModemManager.service"
    "whoopsie.service"
    "cups.service"
    "unattended-upgrades.service"
    "irqbalance.service"
    "thermald.service"
    "fwupd.service"
    "snapd.service"
)

# Verifica si el script se ejecuta con permisos de superusuario
if [ "$EUID" -ne 0 ]; then
    echo "Este script debe ejecutarse como root. Usa 'sudo'."
    exit 1
fi

# Función para desactivar y detener un servicio
disable_service() {
    local service=$1
    # Verifica si el servicio existe en el sistema
    if systemctl list-units --type=service --all | grep -q "$service"; then
        # Verifica si el servicio está habilitado
        if systemctl is-enabled "$service" --quiet; then
            echo "Desactivando $service..."
            systemctl disable "$service" --quiet
            if [ $? -eq 0 ]; then
                echo "$service desactivado correctamente."
            else
                echo "Error al desactivar $service."
            fi
            # Verifica si el servicio está en ejecución y lo detiene
            if systemctl is-active "$service" --quiet; then
                echo "Deteniendo $service..."
                systemctl stop "$service" --quiet
                if [ $? -eq 0 ]; then
                    echo "$service detenido correctamente."
                else
                    echo "Error al detener $service."
                fi
            else
                echo "$service no está en ejecución."
            fi
        else
            echo "$service no está habilitado, no requiere desactivación."
        fi
    else
        echo "$service no está instalado en el sistema."
    fi
}

# Itera sobre la lista de servicios
for service in "${SERVICES[@]}"; do
    disable_service "$service"
done

echo "Operación completada. Revisa el estado de los servicios con 'systemctl list-unit-files --type=service --state=enabled'."
