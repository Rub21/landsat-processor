wget https://s3-us-west-2.amazonaws.com/ds-satellite-projects/historic-risk-explorer/moz-2015/$SCENEID/${SCENEID}_B2.TIF
wget https://s3-us-west-2.amazonaws.com/ds-satellite-projects/historic-risk-explorer/moz-2015/$SCENEID/${SCENEID}_B3.TIF
wget https://s3-us-west-2.amazonaws.com/ds-satellite-projects/historic-risk-explorer/moz-2015/$SCENEID/${SCENEID}_B4.TIF
## Process the imagen
python app.py $SCENEID

# Upload to AWS

