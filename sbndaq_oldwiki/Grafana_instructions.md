---
layout: page
title: Grafana instructions
---



Instructions for restarting the Grafana monitoring system.
=======================================================================================================================================

Note: Grafana is running on icarus-db02 in a singularity container.

1.  ssh <artdaq@icarus-db02.fnal.gov>
2.  start or reattach to the grafana screen session with \"screen -R\".
3.  in the grafana screen session cd into the \"/data/grafana\"
    directory.
4.  start grafana with \"./grafana-ctrl.sh\".
5.  detach from the grafana session with \"Ctrl+A followed by D\"
