#!/bin/bash

for i in {0..3}; do
  port=$((8080 + i))
  if [ $i -eq 3 ]; then
    websockify --web=/usr/share/novnc/ $port desktop.default.svc.cluster.local:$((5900 + i))
  else
    websockify --web=/usr/share/novnc/ $port desktop.default.svc.cluster.local:$((5900 + i)) &
  fi
done
