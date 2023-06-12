#!/usr/bin/env bash
EXTERNAL_IP=$(curl ifconfig.me)
docker-compose run --rm openvpn ovpn_genconfig -u udp://$EXTERNAL_IP
docker-compose run --rm openvpn ovpn_initpki nopass
for ((i=1; i < 10; i++))
do
docker-compose run --rm openvpn easyrsa build-client-full client-$i nopass
docker-compose run --rm openvpn ovpn_getclient client-$i > client-$i.openvpn
done
