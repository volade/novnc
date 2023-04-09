#!/bin/bash

for i in {0..3}; do
  port=$((8080 + i))
  exec websockify --web=/usr/share/novnc/ $port localhost:$((5900 + i)) &
done
