# landsat8-processor

Get the latest version of gdal  from `developmentseed/geolambda:full` and process the Landsat 8 images thought docker container. The container also has a configuration to upload in s3.

![https://landsat.usgs.gov/what-are-naming-conventions-landsat-scene-identifiers](https://user-images.githubusercontent.com/1152236/38943680-a1337e74-42f7-11e8-9b52-758fa61d63ab.png)


Example:


```

docker build -t ls8-procesor .
docker run -e SCENEID=LC81670722015046LGN00 -it ls8-procesor
#docker run  -e SCENEID=LC81670722015046LGN00 -it ls8-procesor /bin/bash
#docker run  -e SCENEID=LC81670722014347LGN00 -it ls8-procesor /bin/bash


```