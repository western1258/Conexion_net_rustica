#!/usr/bin/env bash

mostrar_interfaces() {
    echo "Interfaces:"
    ip -brief address
}

cambiar_estado() {
    read -p "Interfaz: " iface
    read -p "Estado (up/down): " estado

    sudo ip link set "$iface" "$estado"
}

dhcp() {
    read -p "Interfaz: " iface

    sudo ip link set "$iface" up
    sudo dhclient "$iface"

    echo "DHCP aplicado en $iface"
}

estatica() {
    read -p "Interfaz: " iface
    read -p "IP (ej: 192.168.1.10/24): " ipaddr
    read -p "Gateway: " gw

    sudo ip link set "$iface" up
    sudo ip addr flush dev "$iface"
    sudo ip addr add "$ipaddr" dev "$iface"
    sudo ip route add default via "$gw"

    echo "Configuración estática aplicada"
}

wifi() {
    read -p "Interfaz WiFi: " iface

    echo "Redes disponibles:"
    sudo iw dev "$iface" scan | grep SSID

    read -p "SSID: " ssid
    read -p "Password: " pass

    cat <<EOF > /tmp/wifi.conf
network={
    ssid="$ssid"
    psk="$pass"
}
EOF

    sudo ip link set "$iface" up
    sudo wpa_supplicant -B -i "$iface" -c /tmp/wifi.conf
    sudo dhclient "$iface"

    echo "Conectado a $ssid"
}


while true; do
    echo "====== NET RUSTICO ======"
    echo "1) Ver interfaces"
    echo "2) Up/Down interfaz"
    echo "3) DHCP"
    echo "4) Estática"
    echo "5) WiFi"
    echo "6) Salir"
    echo "========================="

    read -p "Opción: " op

    case $op in
        1) mostrar_interfaces ;;
        2) cambiar_estado ;;
        3) dhcp ;;
        4) estatica ;;
        5) wifi ;;
        6) exit ;;
        *) echo "No válido" ;;
    esac
done
