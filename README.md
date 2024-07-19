# IO Autostart Service

> [!WARNING]
> Service on master is not yet tested.

The goal is to have IO workers autostart the containers on boot and on failure. The service will fetch the script from master and run the latest version automatically.

## Installation
> [!NOTE]
> Instructions for Ubuntu 22.04. Systemd locations may differ on other linux flavors.
- Place the .service file in /etc/systemd/system/
- Make it executable with `chmod +x /etc/systemd/system/io-autostart.service`
- Reload services `systemctl daemon-reload`
- Enable the service `systemctl enable io-autostart.service`
- Start the service `systemctl start io-autostart.service` or reboot.
