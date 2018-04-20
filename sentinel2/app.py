from sdownloader import Sentinel2
import gippy
import sys
import os
from subprocess import Popen

sceneid = sys.argv[1:][0]
l = Sentinel2(download_dir=os.getcwd())
l.download([sceneid], bands=[4, 2, 3])

# Reproject
command = 'for BAND in {4,3,2}; do gdalwarp -t_srs EPSG:3857 ' + sceneid + '/B0$BAND.jp2 ' + sceneid + '/B0$BAND-rep.tif; done'
execute = Popen([command], shell=True)
execute.communicate()

# Scale
command = 'for BAND in {4,3,2}; do gdal_translate -ot Byte -scale ' + sceneid + '/B0$BAND-rep.tif ' + sceneid + '/B0$BAND-scale.tif; done'
execute = Popen([command], shell=True)
execute.communicate()

options = {'COMPRESS': 'DEFLATE', 'PREDICTOR': '2','TILEID': 'YES', 'BLOCKXSIZE': '512', 'BLOCKYSIZE': '512'}
geoimg = gippy.GeoImage.open([ sceneid +'/B04-scale.tif',  sceneid +'/B03-scale.tif',  sceneid +'/B02-scale.tif'])
# geoimg = geoimg.autoscale(1, 255, percent=2.0)
geoimg.set_nodata(0)
geoimg.set_bandnames(['red', 'green', 'blue'])
geoimg.save(filename=sceneid + '.tif', dtype='byte', options=options)