# landsat8-processor

Get the latest version of gdal  from `developmentseed/geolambda:full` and process the Landsat 8 images thought docker container. The container also has a configuration to upload in s3.

![image](https://user-images.githubusercontent.com/1152236/38962328-560ab012-4332-11e8-965a-fdfe6fab5c44.png)

https://landsat.usgs.gov/what-are-band-designations-landsat-satellites

Example:


```

docker build -t ls8-procesor .
docker run -e SCENEID=LC81670722015046LGN00 -it ls8-procesor
#docker run  -e SCENEID=LC81670722015046LGN00 -it ls8-procesor /bin/bash
#docker run  -e SCENEID=LC81670722014347LGN00 -it ls8-procesor /bin/bash


```