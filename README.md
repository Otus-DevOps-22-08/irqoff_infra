# irqoff_infra

## Homework 05

.ssh/config:
```
Host someinternalhost
  Hostname 10.128.0.29
  User appuser
  ProxyJump appuser@84.201.133.XXX
```

```
bastion_IP = 51.250.1.169
someinternalhost_IP = 10.128.0.29
```

## Homework 06
```
testapp_IP = 178.154.204.151
testapp_port = 9292
```

```
yc compute instance create \
  --name reddit-app \
  --hostname reddit-app \
  --memory=4 \
  --create-boot-disk image-folder-id=standard-images,image-family=ubuntu-1604-lts,size=10GB \
  --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 \
  --metadata serial-port-enable=1 \
  --metadata-from-file user-data=user-data.yml
```

## Homework 07
Create [a script](./config-scripts/create-reddit-vm.sh) that create a VM with backed image that I build by Packer.
