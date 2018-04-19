# python app.py $SCENEID

## PRE IMAGES
python app.py LT05_L1TP_151037_20100524_20161016_01_T1
python app.py LT05_L1TP_151038_20100524_20161016_01_T1

gdalwarp -dstnodata 0 -of GTiff \
LT05_L1TP_151037_20100524_20161016_01_T1.tif \
LT05_L1TP_151038_20100524_20161016_01_T1.tif \
landsat5-pak-2010-pre.tif

## POST IMAGES 

python app.py LT05_L1TP_151037_20100812_20161014_01_T1
python app.py LT05_L1TP_151038_20100812_20161014_01_T1

gdalwarp -dstnodata 0 -of GTiff \
LT05_L1TP_151037_20100812_20161014_01_T1.tif \
LT05_L1TP_151038_20100812_20161014_01_T1.tif \
landsat5-pak-2010-post.tif

# upload to s3

aws s3 cp landsat5-pak-2010-pre.tif s3://ds-satellite-projects/historic-risk-explorer/test/
aws s3 cp landsat5-pak-2010-post.tif s3://ds-satellite-projects/historic-risk-explorer/test/
