```
                                 __                                    __                                __      __                __                               
                                /  |                                  /  |                              /  |    /  |              /  |                              
  _______  __    __   _______  _$$ |_     ______   _____  ____    ____$$ |          ______    ______   _$$ |_   $$/  _____  ____  $$/  ________   ______    ______  
 /       |/  |  /  | /       |/ $$   |   /      \ /     \/    \  /    $$ | ______  /      \  /      \ / $$   |  /  |/     \/    \ /  |/        | /      \  /      \ 
/$$$$$$$/ $$ |  $$ |/$$$$$$$/ $$$$$$/   /$$$$$$  |$$$$$$ $$$$  |/$$$$$$$ |/      |/$$$$$$  |/$$$$$$  |$$$$$$/   $$ |$$$$$$ $$$$  |$$ |$$$$$$$$/ /$$$$$$  |/$$$$$$  |
$$      \ $$ |  $$ |$$      \   $$ | __ $$    $$ |$$ | $$ | $$ |$$ |  $$ |$$$$$$/ $$ |  $$ |$$ |  $$ |  $$ | __ $$ |$$ | $$ | $$ |$$ |  /  $$/  $$    $$ |$$ |  $$/ 
 $$$$$$  |$$ \__$$ | $$$$$$  |  $$ |/  |$$$$$$$$/ $$ | $$ | $$ |$$ \__$$ |        $$ \__$$ |$$ |__$$ |  $$ |/  |$$ |$$ | $$ | $$ |$$ | /$$$$/__ $$$$$$$$/ $$ |      
/     $$/ $$    $$ |/     $$/   $$  $$/ $$       |$$ | $$ | $$ |$$    $$ |        $$    $$/ $$    $$/   $$  $$/ $$ |$$ | $$ | $$ |$$ |/$$      |$$       |$$ |      
$$$$$$$/   $$$$$$$ |$$$$$$$/     $$$$/   $$$$$$$/ $$/  $$/  $$/  $$$$$$$/          $$$$$$/  $$$$$$$/     $$$$/  $$/ $$/  $$/  $$/ $$/ $$$$$$$$/  $$$$$$$/ $$/       
          /  \__$$ |                                                                        $$ |                                                                    
          $$    $$/                                                                         $$ |                                                                    
           $$$$$$/                                                                          $$/                                                                     



```


## English

### Overview
`systemd-optimizer.sh` is a Bash script designed to disable non-essential **systemd** services in a typical home environment, optimizing system resource usage. The script targets services that are often unnecessary for common desktop tasks such as web browsing, office applications, or media playback, while ensuring that critical system functionality remains unaffected.

### Services Disabled by the Script
The script disables the following **systemd** services, which are generally safe to disable in a home environment if their associated functionalities are not required:

| **Service**                  | **Description**                              | **When to Keep Enabled**                     |
|-------------------------------|----------------------------------------------|-----------------------------------------------|
| `apport.service`              | Collects and processes crash reports (Ubuntu-specific) | If you want to send crash reports to Canonical |
| `cups-browsed.service`        | Automatically discovers network printers      | If you rely on automatic printer discovery     |
| `geoclue.service`             | Provides geolocation services                | If you use location-based apps (e.g., maps)   |
| `kerneloops.service`          | Collects and reports kernel crash data       | If you want to contribute kernel crash reports |
| `speech-dispatcher.service`   | Provides speech synthesis for accessibility  | If you rely on screen readers or accessibility tools |
| `rtkit-daemon.service`        | Manages real-time priorities for audio       | If you use professional audio applications     |
| `systemd-rfkill.service`      | Manages radio device blocking (Wi-Fi, Bluetooth) | If you frequently toggle Wi-Fi/Bluetooth states |
| `udisks2.service`             | Manages removable storage devices            | If you use USB drives or SD cards regularly   |
| `colord.service`              | Manages color profiles for displays/printers | If you do professional graphic design         |
| `packagekit.service`          | Manages software packages in the background  | If you use graphical package managers (e.g., GNOME Software) |
| `avahi-daemon.service`        | Network service discovery (mDNS/DNS-SD)      | If you share files or use network printers     |
| `bluetooth.service`           | Manages Bluetooth connections               | If you use Bluetooth devices                  |
| `ModemManager.service`        | Manages mobile broadband connections         | If you use mobile broadband modems            |
| `whoopsie.service`            | Sends crash reports to Canonical (Ubuntu-specific) | If you want to contribute crash reports |
| `cups.service`                | Manages printing services                   | If you use a printer                          |
| `unattended-upgrades.service` | Automatic security updates (Ubuntu-specific) | If you prefer automated security updates       |
| `irqbalance.service`          | Distributes hardware interrupts (multi-CPU)  | If you have a multi-CPU system with performance issues |
| `thermald.service`            | Manages thermal zones and cooling           | If you use a laptop or system prone to overheating |
| `fwupd.service`               | Manages firmware updates                    | If you need to keep firmware updated          |
| `snapd.service`               | Manages Snap packages                       | If you use Snap applications (e.g., Spotify, VS Code) |

### Usage
1. **Download the Script**:
   - Clone this repository or download `systemd-optimizer.sh`.
   - Ensure the script is executable:
     ```bash
     chmod +x systemd-optimizer.sh
     ```

2. **Run the Script**:
   - Execute the script with superuser privileges:
     ```bash
     sudo ./systemd-optimizer.sh
     ```
   - The script will display an ASCII art header and provide feedback on the status of each service (disabled, stopped, or not enabled).

3. **Verify Results**:
   - Check enabled services:
     ```bash
     systemctl list-unit-files --type=service --state=enabled
     ```
   - Check the status of a specific service:
     ```bash
     systemctl status <service-name>
     ```

### Precautions
- **Review Your Needs**: Before running the script, ensure you do not rely on the listed services. For example, disabling `cups.service` will affect printing, and disabling `snapd.service` will impact Snap-based applications.
- **Backup Your System**: Create a system backup or restore point before executing the script to avoid issues if a critical service is disabled.
- **Reverting Changes**: To re-enable a service:
  ```bash
  sudo systemctl enable <service-name>
  sudo systemctl start <service-name>
  ```
- **Distribution Compatibility**: The script is designed for distributions using **systemd** (e.g., Ubuntu, Arch Linux, Fedora). Some services (e.g., `whoopsie.service`) are Ubuntu-specific and may not be present on other distributions.
- **Testing**: Run the script in a test environment or verify services manually with `systemctl status` before applying it to a critical system.

### Additional Resources
For more information on managing **systemd** services, refer to:
- [DigitalOcean: Manage Systemd Services with systemctl](https://www.digitalocean.com/community/tutorials/how-to-use-systemctl-to-manage-systemd-services-and-units)
- [ArchWiki: Systemd](https://wiki.archlinux.org/title/Systemd)

---

## Español

### Resumen
`systemd-optimizer.sh` es un script en Bash diseñado para desactivar servicios **systemd** no esenciales en un entorno doméstico típico, optimizando el uso de recursos del sistema. El script se enfoca en servicios que suelen ser innecesarios para tareas comunes de escritorio, como navegar por internet, usar aplicaciones de oficina o reproducir multimedia, asegurando que las funcionalidades críticas del sistema no se vean afectadas.

### Servicios desactivados por el script
El script desactiva los siguientes servicios **systemd**, que generalmente son seguros para desactivar en un entorno doméstico si no se requieren sus funcionalidades asociadas:

| **Servicio**                  | **Descripción**                              | **Cuándo mantenerlo activado**                |
|-------------------------------|----------------------------------------------|-----------------------------------------------|
| `apport.service`              | Recopila y procesa informes de fallos (específico de Ubuntu) | Si deseas enviar informes de fallos a Canonical |
| `cups-browsed.service`        | Detecta automáticamente impresoras en red    | Si dependes de la detección automática de impresoras |
| `geoclue.service`             | Proporciona servicios de geolocalización     | Si usas aplicaciones basadas en ubicación (ej., mapas) |
| `kerneloops.service`          | Recopila y reporta datos de fallos del kernel | Si deseas contribuir con informes de fallos del kernel |
| `speech-dispatcher.service`   | Proporciona síntesis de voz para accesibilidad | Si dependes de lectores de pantalla o herramientas de accesibilidad |
| `rtkit-daemon.service`        | Gestiona prioridades en tiempo real para audio | Si usas aplicaciones de audio profesionales    |
| `systemd-rfkill.service`      | Gestiona el bloqueo de dispositivos de radio (Wi-Fi, Bluetooth) | Si cambias frecuentemente el estado de Wi-Fi/Bluetooth |
| `udisks2.service`             | Gestiona dispositivos de almacenamiento extraíbles | Si usas discos USB o tarjetas SD regularmente |
| `colord.service`              | Gestiona perfiles de color para pantallas/impresoras | Si realizas diseño gráfico profesional        |
| `packagekit.service`          | Gestiona paquetes de software en segundo plano | Si usas gestores de paquetes gráficos (ej., GNOME Software) |
| `avahi-daemon.service`        | Descubrimiento de servicios en red (mDNS/DNS-SD) | Si compartes archivos o usas impresoras en red |
| `bluetooth.service`           | Gestiona conexiones Bluetooth                | Si usas dispositivos Bluetooth                |
| `ModemManager.service`        | Gestiona conexiones de banda ancha móvil     | Si usas módems de banda ancha móvil           |
| `whoopsie.service`            | Envía informes de fallos a Canonical (específico de Ubuntu) | Si deseas contribuir con informes de fallos |
| `cups.service`                | Gestiona servicios de impresión              | Si usas una impresora                        |
| `unattended-upgrades.service` | Actualizaciones automáticas de seguridad (específico de Ubuntu) | Si prefieres actualizaciones de seguridad automáticas |
| `irqbalance.service`          | Distribuye interrupciones en sistemas multi-CPU | Si tienes un sistema multi-CPU con problemas de rendimiento |
| `thermald.service`            | Gestiona zonas térmicas y enfriamiento       | Si usas un portátil o sistema propenso a sobrecalentarse |
| `fwupd.service`               | Gestiona actualizaciones de firmware         | Si necesitas mantener el firmware actualizado |
| `snapd.service`               | Gestiona paquetes Snap                      | Si usas aplicaciones Snap (ej., Spotify, VS Code) |

### Uso
1. **Descargar el script**:
   - Clona este repositorio o descarga `systemd-optimizer.sh`.
   - Asegúrate de que el script sea ejecutable:
     ```bash
     chmod +x systemd-optimizer.sh
     ```

2. **Ejecutar el script**:
   - Ejecuta el script con privilegios de superusuario:
     ```bash
     sudo ./systemd-optimizer.sh
     ```
   - El script mostrará un arte ASCII y proporcionará retroalimentación sobre el estado de cada servicio (desactivado, detenido o no habilitado).

3. **Verificar resultados**:
   - Revisa los servicios habilitados:
     ```bash
     systemctl list-unit-files --type=service --state=enabled
     ```
   - Verifica el estado de un servicio específico:
     ```bash
     systemctl status <nombre-del-servicio>
     ```

### Precauciones
- **Revisar tus necesidades**: Antes de ejecutar el script, asegúrate de que no dependes de los servicios listados. Por ejemplo, desactivar `cups.service` afectará la impresión, y desactivar `snapd.service` impactará las aplicaciones basadas en Snap.
- **Copia de seguridad**: Crea una copia de seguridad del sistema o un punto de restauración antes de ejecutar el script para evitar problemas si se desactiva un servicio crítico.
- **Revertir cambios**: Para reactivar un servicio:
  ```bash
  sudo systemctl enable <nombre-del-servicio>
  sudo systemctl start <nombre-del-servicio>
  ```
- **Compatibilidad con distribuciones**: El script está diseñado para distribuciones que usan **systemd** (ej., Ubuntu, Arch Linux, Fedora). Algunos servicios (ej., `whoopsie.service`) son específicos de Ubuntu y pueden no estar presentes en otras distribuciones.
- **Pruebas**: Ejecuta el script en un entorno de prueba o verifica los servicios manualmente con `systemctl status` antes de aplicarlo en un sistema crítico.

### Recursos adicionales
Para más información sobre la gestión de servicios **systemd**, consulta:
- [DigitalOcean: Gestionar servicios systemd con systemctl](https://www.digitalocean.com/community/tutorials/how-to-use-systemctl-to-manage-systemd-services-and-units)
- [ArchWiki: Systemd](https://wiki.archlinux.org/title/Systemd)
