# Sentinel2 - processor

Get the latest version of gdal  from `developmentseed/geolambda:full` 

#### Bands

![image](https://user-images.githubusercontent.com/1152236/39015627-916d4a3c-43e3-11e8-9c8e-1e6774ffb8e8.png)

https://en.wikipedia.org/wiki/Sentinel-2

```
docker build -t sentinel2  .

docker run \
-e SCENEID="S2A_tile_20160123_60KWF_0" \
-e AWS_ACCESS_KEY_ID="xxx" \
-e AWS_SECRET_ACCESS_KEY="xxx" \
-e AWS_DEFAULT_REGION="us-east-1" \
-it sentinel2
```


**Manual**

```
docker run \
-e SCENEID="S2A_tile_20160123_60KWF_0" \
-e AWS_ACCESS_KEY_ID="xxx" \
-e AWS_SECRET_ACCESS_KEY="xxx" \
-e AWS_DEFAULT_REGION="us-east-1" \
-it sentinel2 /bin/bash
```

**Copy**

```
docker ps
docker cp <idcontainer>:/app/$SCENEID.tif .

```