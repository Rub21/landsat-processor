wget https://s3-us-west-2.amazonaws.com/ds-satellite-projects/historic-risk-explorer/moz-2015/$SCENEID/${SCENEID}_B2.TIF
wget https://s3-us-west-2.amazonaws.com/ds-satellite-projects/historic-risk-explorer/moz-2015/$SCENEID/${SCENEID}_B3.TIF
wget https://s3-us-west-2.amazonaws.com/ds-satellite-projects/historic-risk-explorer/moz-2015/$SCENEID/${SCENEID}_B4.TIF

#re-project
for BAND in {4,3,2}; do gdalwarp -t_srs EPSG:3857 ${SCENEID}_B$BAND.TIF $BAND-projected.tif; done
convert -combine {4,3,2}-projected.tif RGB.tif
convert -sigmoidal-contrast 50x16% RGB.tif RGB-corrected.tif
convert -depth 8 RGB-corrected.tif RGB-corrected-8bit.tif
listgeo -tfw 4-projected.tif
mv 4-projected.tfw RGB-corrected-8bit.tfw
gdal_edit.py -a_srs EPSG:3857 RGB-corrected-8bit.tif mv RGB-corrected-8bit.tif Panama-projected.tif
gdal_translate -of GTiff -a_nodata 0 Panama-projected.tif $SCENEID.tif