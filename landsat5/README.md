# landsat5-processor

Get the latest version of gdal  from `developmentseed/geolambda:full` and process the Landsat 5 images thought docker container.


![image](https://user-images.githubusercontent.com/1152236/38962328-560ab012-4332-11e8-965a-fdfe6fab5c44.png)

https://landsat.usgs.gov/what-are-band-designations-landsat-satellites

Example:


```

docker build -t landsat5 .

docker run \
-e AWS_ACCESS_KEY_ID="xxx" \
-e AWS_SECRET_ACCESS_KEY="xxx" \
-e AWS_DEFAULT_REGION="us-east-1" \
-it landsat5

```

**Manual**

```
docker run \
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
 

 ![image](https://user-images.githubusercontent.com/1152236/39007634-eaf9a8c4-43cb-11e8-8a42-523f971a6eb3.png)

https://bl.ocks.org/Rub21/raw/7864d1abb1c2bea768af003cd84f99aa/index3.html