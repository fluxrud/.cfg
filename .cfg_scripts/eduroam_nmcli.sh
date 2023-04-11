#!/bin/bash

read -p "mail: " mail
read -s -r -p "pass: " pass

echo

nmcli con add \
type wifi \
con-name "eduroam" \
ifname "wlp61s0" \
ssid "eduroam" \
wifi-sec.key-mgmt "wpa-eap" \
802-1x.identity $mail \
802-1x.password $pass \
802-1x.system-ca-certs "yes" \
802-1x.domain-suffix-match "ntnu.no" \
802-1x.eap "peap" \
802-1x.phase2-auth "mschapv2"

nmcli connection up eduroam
