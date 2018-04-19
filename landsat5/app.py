from landsat5 import Landsat5
import gippy
import sys
import os
sceneid = sys.argv[1:][0]
l = Landsat5(download_dir=os.getcwd())
l.download([sceneid], bands=[3, 2, 1])
sceneidFolder = sceneid + '/' + sceneid
options = {'COMPRESS': 'DEFLATE', 'PREDICTOR': '2', 'TILEID': 'YES', 'BLOCKXSIZE': '512', 'BLOCKYSIZE': '512'}
geoimg = gippy.GeoImage.open([sceneidFolder + '_B3.TIF', sceneidFolder + '_B2.TIF', sceneidFolder + '_B1.TIF'])
geoimg.set_nodata(0)
geoimg.set_bandnames(['red', 'green', 'blue'])
geoimg = geoimg.autoscale(1, 255, percent=30.0)
geoimg.save(filename=sceneid + '.tif', dtype='byte', options=options)
