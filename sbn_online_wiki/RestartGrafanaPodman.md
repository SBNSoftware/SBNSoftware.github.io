---
layout: page
title: Instructions for restarting the Grafana monitoring system.
hero_height: is-small
---

### Introduction

Grafana is a powerful, open-source analytics and monitoring platform used for visualizing system and application metrics. It operates within a Podman container environment, a daemon-less, Linux-native tool designed to develop, manage, and run containers. In this setup, the Grafana container is managed by the `grafana` user's SystemD service.

### Restart Instructions

1. **Access the Grafana Server**
   - SSH into the Grafana server as the user `grafana`.

2. **Stop the Grafana Container**
   - Execute the following command to stop the Grafana container:
     ```bash
     systemctl --user --no-pager stop grafana.service; systemctl --user --no-pager reset-failed grafana.service
     ```

3. **Start the Grafana Container**
   - Start the Grafana container and check its status with the following command:
     ```bash
     systemctl --user --no-pager start grafana.service; systemctl --user --no-pager status grafana.service
     ```
   - A successful status should appear as "active (exited)".

4. **Troubleshoot if Necessary**
   - If the reported status is not "active (exited)", check logs for errors:
     ```bash
     journalctl --user --no-pager -u grafana.service --since '1 day ago'
     ```

### Example Status Output

```bash
[grafana@grafana-host.example.com logs]$ systemctl --user --no-pager status grafana.service
● grafana.service - Grafana Service Stack
   Loaded: loaded (/home/nfs/grafana/.config/systemd/user/grafana.service; enabled; preset: disabled)
   Active: active (exited) since Thu 2024-11-07 11:25:57 CST; 41min ago
   Process: 1319110 ExecStart=/home/nfs/grafana/grafana-podman/grafana-service-ctrl.sh start (code=exited, status=0/SUCCESS)
   Main PID: 1319110 (code=exited, status=0/SUCCESS)
   Tasks: 64 (limit: 297397)
   Memory: 64.4M
   CPU: 3.288s
   CGroup: /user.slice/user-15111.slice/user@15111.service/app.slice/grafana.service
           ├─1319541 rootlessport
           ├─1319547 rootlessport-child
           ├─1319560 /usr/bin/conmon --api-version 1 -c 8d0d591203fea354a26a52b54d85a11a7c64719c36f7d27d5ff703e551460080 -u 8d0d591203fea354a26a52b54d85a11a7c64719c36f7d27d5ff703e551460080 -r /…
           ├─1319796 rootlessport
           ├─1319820 rootlessport-child
           ├─1319831 /usr/bin/conmon --api-version 1 -c 8630ecc31122c61c0f1259f158fd17fc82d209290c9d798ede3d2524621f2290 -u 8630ecc31122c61c0f1259f158fd17fc82d209290c9d798ede3d2524621f2290 -r /…
           ├─1319992 rootlessport
           ├─1320016 rootlessport-child
           ├─1320029 /usr/bin/conmon --api-version 1 -c 2a01a018ffc62e858d35b2faf8bfd66c5e4c858dde4b192d423e1c334b9e3e2f -u 2a01a018ffc62e858d35b2faf8bfd66c5e4c858dde4b192d423e1c334b9e3e2f -r /…
           ├─1320196 rootlessport
           ├─1320220 rootlessport-child
           └─1320233 /usr/bin/conmon --api-version 1 -c 1316b287affa0aa6f8b35d583fcdc8a30f147f3ff4b7d5ba4645d368cc0081b1 -u 1316b287affa0aa6f8b35d583fcdc8a30f147f3ff4b7d5ba4645d368cc0081b1 -r /…

Nov 07 11:25:56 grafana-host.example.com podman[1319914]: 2024-11-07 11:25:56.712591134 -0600 CST m=+0.233395234 container init 2a01a018ffc62e858d35b2faf8bfd66c5e4c858dde4b192d423e1c334b9e3e2f (imag…
Nov 07 11:25:56 grafana-host.example.com podman[1319914]: 2024-11-07 11:25:56.716768157 -0600 CST m=+0.237572257 container start 2a01a018ffc62e858d35b2faf8bfd66c5e4c858dde4b192d423e1c334b9e3e2f (ima…
Nov 07 11:25:56 grafana-host.example.com grafana-service-ctrl.sh[1319914]: 2a01a018ffc62e858d35b2faf8bfd66c5e4c858dde4b192d423e1c334b9e3e2f
Nov 07 11:25:56 grafana-host.example.com podman[1320095]: 2024-11-07 11:25:56.897164726 -0600 CST m=+0.075058683 container create 1316b287affa0aa6f8b35d583fcdc8a30f147f3ff4b7d5ba4645d368cc0081b1 (im…
Nov 07 11:25:56 grafana-host.example.com podman[1320095]: 2024-11-07 11:25:56.857748296 -0600 CST m=+0.035642259 image pull 249f59e1dec7f7eacbeba4bb9215b8000e4bdbb672af523b3dacc89915b0…:1.24.0-alpine
Nov 07 11:25:57 grafana-host.example.com podman[1320095]: 2024-11-07 11:25:57.154115638 -0600 CST m=+0.332009601 container init 1316b287affa0aa6f8b35d583fcdc8a30f147f3ff4b7d5ba4645d368cc0081b1 (imag…
Nov 07 11:25:57 grafana-host.example.com podman[1320095]: 2024-11-07 11:25:57.1772537 -0600 CST m=+0.355147655 container start 1316b287affa0aa6f8b35d583fcdc8a30f147f3ff4b7d5ba4645d368cc0081b1 (image…
Nov 07 11:25:57 grafana-host.example.com grafana-service-ctrl.sh[1320095]: 1316b287affa0aa6f8b35d583fcdc8a30f147f3ff4b7d5ba4645d368cc0081b1
Nov 07 11:25:57 grafana-host.example.com grafana-service-ctrl.sh[1319110]: Container stack started successfully.
Nov 07 11:25:57 grafana-host.example.com systemd[2382]: Finished Grafana Service Stack.
Hint: Some lines were ellipsized, use -l to show in full.
```
