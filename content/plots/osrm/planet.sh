#!/bin/bash

echo ">>> Starting planet build"
echo "sleep for 30 sec. to let memory tracker catch up"
sleep 30

echo ">>> extract"
time sudo docker run --rm -t -v "/mnt/data1/planet:/data" osrm/osrm-backend osrm-extract -p /opt/car.lua /data/planet-211018.osm.pbf

echo ">>> partition"
time sudo docker run --rm -t -v "/mnt/data1/planet:/data" osrm/osrm-backend osrm-partition /data/planet-211018.osm.pbf

echo ">>> customize"
time sudo docker run --rm -t -v "/mnt/data1/planet:/data" osrm/osrm-backend osrm-customize /data/planet-211018.osm.pbf

echo ">>> contract"
time sudo docker run --rm -t -v "/mnt/data1/planet:/data" osrm/osrm-backend osrm-contract /data/planet-211018.osrm

echo ">>> DONE"
