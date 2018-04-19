# landsat8-processor

Get the latest version of gdal  from `developmentseed/geolambda:full` and process the Landsat 8 images thought docker container. The container also has a configuration to upload in s3.

![https://landsat.usgs.gov/what-are-naming-conventions-landsat-scene-identifiers](https://user-images.githubusercontent.com/1152236/38943680-a1337e74-42f7-11e8-9b52-758fa61d63ab.png)


Example:


```

docker build -t landsat8 .

docker run \
-e SCENEID=LC81670722015046LGN00 \
-e AWS_ACCESS_KEY_ID="xxx" \
-e AWS_SECRET_ACCESS_KEY="xxx" \
-e AWS_DEFAULT_REGION="us-east-1" \
-it landsat8

```

**Manual**

```
docker run \
-e SCENEID=LC81670722015046LGN00 \
-e AWS_ACCESS_KEY_ID="xxx" \
-e AWS_SECRET_ACCESS_KEY="xxx" \
-e AWS_DEFAULT_REGION="us-east-1" \
-it landsat8 /bin/bash


```

**Copy**

```
docker ps
docker cp <idcontainer>:/app/$SCENEID.tif .

```


## output

![image](https://user-images.githubusercontent.com/1152236/39007611-d8095c14-43cb-11e8-8615-b0f1876e41f8.png)

https://bl.ocks.org/Rub21/raw/7864d1abb1c2bea768af003cd84f99aa/index2.html


