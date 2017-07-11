# shadowsocks-init

## CentOS7

disable firewalld
set Shadowsocks as systemd Service 

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/lshen1120/shadowsocks-init/master/centos7-init.sh)" {port} {password}
sh -c "$(curl -fsSL https://raw.githubusercontent.com/lshen1120/shadowsocks-init/master/centos7-init.sh)" 9443 1234567890
```
