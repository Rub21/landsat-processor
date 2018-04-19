aws s3 sync s3://ds-satellite-projects/historic-risk-explorer/pak-2010/ .
for d in */ ; do
    echo "$d"
    python app.py ${d///}
done


# python app.py LT05_L1TP_151037_20100524_20161016_01_T1
# python app.py LT05_L1TP_151038_20100524_20161016_01_T1

# gdalwarp -dstnodata 0 -of GTiff \
# LT05_L1TP_151037_20100524_20161016_01_T1/LT05_L1TP_151037_20100524_20161016_01_T1.tif \
# LT05_L1TP_151038_20100524_20161016_01_T1/LT05_L1TP_151038_20100524_20161016_01_T1.tif \
# landsat5-hazards-pak-2010-pre.tif


# python app.py LT05_L1TP_151037_20100812_20161014_01_T1
# python app.py LT05_L1TP_151038_20100812_20161014_01_T1


# gdalwarp -dstnodata 0 -of GTiff \
# LT05_L1TP_151037_20100812_20161014_01_T1/LT05_L1TP_151037_20100812_20161014_01_T1.tif \
# LT05_L1TP_151038_20100812_20161014_01_T1/LT05_L1TP_151038_20100812_20161014_01_T1.tif \
# landsat5-hazards-pak-2010-post.tif


# upload to s3