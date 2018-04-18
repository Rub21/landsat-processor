wget https://s3-us-west-2.amazonaws.com/ds-satellite-projects/historic-risk-explorer/moz-2015/$SCENEIDS/${SCENEIDS}_B2.TIF
wget https://s3-us-west-2.amazonaws.com/ds-satellite-projects/historic-risk-explorer/moz-2015/$SCENEIDS/${SCENEIDS}_B3.TIF
wget https://s3-us-west-2.amazonaws.com/ds-satellite-projects/historic-risk-explorer/moz-2015/$SCENEIDS/${SCENEIDS}_B4.TIF

#re-project
for BAND in {4,3,2}; do gdalwarp -t_srs EPSG:3857 ${SCENEIDS}_B$BAND.TIF $BAND-projected.tif; done
convert -combine {4,3,2}-projected.tif RGB.tif
convert -sigmoidal-contrast 50x16% RGB.tif RGB-corrected.tif
convert -depth 8 RGB-corrected.tif RGB-corrected-8bit.tif
gdal_translate -of GTiff -a_nodata 0 RGB-corrected-8bit.tif $SCENEIDS.tif