# Net Rústico - Script de Configuración de Red en Linux

## Descripción

Script en Bash que permite gestionar la conexión de red en un sistema Linux de forma interactiva utilizando comandos básicos como `ip`.

## Objetivo

El script permite:

- Mostrar interfaces de red disponibles  
- Cambiar el estado de una interfaz (up/down)  
- Configurar red mediante DHCP  
- Configurar red de forma estática  
- Escanear redes inalámbricas  
- Conectarse a redes WiFi con contraseña  

## Requisitos

- Sistema operativo Linux  
- Permisos de superusuario (`sudo`)  

Herramientas necesarias:

- `ip`  
- `dhclient`  
- `iw`  
- `wpa_supplicant`  

## Uso

Dar permisos de ejecución:

```bash
chmod +x net_rustico.sh

Ejecutar el script:

./net_rustico.sh
Funcionalidades

Mostrar interfaces: lista las interfaces disponibles y su estado

Cambiar estado: permite activar o desactivar una interfaz

DHCP: obtiene automáticamente una dirección IP

Configuración estática: asigna IP y gateway manualmente

WiFi: escanea redes y permite conectarse mediante SSID y contraseña

Limitaciones

La configuración no es persistente

No incluye validación de errores

Puede interferir con configuraciones previas

Requiere herramientas externas para WiFi

Notas técnicas

Se utiliza ip para configuración de red

dhclient para DHCP

iw para escaneo de redes

wpa_supplicant para conexión WiFi

Autor

Juan Elías Antonio Ramírez
