# gslw_tp1
## Script to detect users and add new user.

- Après avoir créé le script bash (newscript.sh), nous devons créer un service daemon.

## Créer un service avec le script

> ETAPES:

- Créez le service.

  - `sudo nano /etc/systemd/system/daemon.service`

- Ecrivez les codes suivants dans le daemon.service
  - Modifiez l'utilisateur et l'ExecStart avec votre propre nom d'utilisateur et chemin.

```
[Unit]
Description=usb daemon service
After=network.target
StartLimitIntervalSec=0

[Service]
Type=simple
Restart=always
RestartSec=1
User=zahrah
ExecStart=/home/zahrah/Documents/gslw_tp1/newscript.sh

[Install]
WantedBy=multi-user.target
```

- Enregistrez et quittez le nano.

-  Tapez les commandes suivantes pour exécuter le service.


  - `systemctl start daemon`  
  - `systemctl enable daemon`
  - `systemctl status daemon.service`


- Pour arrêter et supprimer le service:

  - `systemctl stop daemon.service` 
  - `sudo systemctl disable daemon.service`
  - `sudo rm daemon.service`
