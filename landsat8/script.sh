python app.py $SCENEID
# Upload to AWS
aws s3 cp $SCENEID.tif s3://ds-satellite-projects/historic-risk-explorer/test/
# Upload to Mapbox
# mapbox upload  devseed.$SCENEID $SCENEID.tif


