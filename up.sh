#!/bin/bash
ip rule | grep rt_openvpn | cut -f2- | xargs -i sh -c "ip rule del {}"
ip rule add from `ifconfig tun0 | grep -w inet | awk '{print $2}'`/32 table rt_openvpn 
ip route flush table rt_openvpn
ip route add 0/0 dev tun0 table rt_openvpn

