from sdownloader import Sentinel2
import gippy
import sys
import os
sceneid = sys.argv[1:][0]
l = Sentinel2(download_dir=os.getcwd());
l.download([sceneid], bands=[4,2,3]);
options = {'COMPRESS': 'DEFLATE', 'PREDICTOR': '2','TILEID': 'YES', 'BLOCKXSIZE': '512', 'BLOCKYSIZE': '512'}
geoimg = gippy.GeoImage.open([ sceneid +'/B04.jp2',  sceneid +'/B03.jp2',  sceneid +'/B02.jp2'])
geoimg.set_nodata(0)
geoimg.set_bandnames(['red', 'green', 'blue'])
geoimg = geoimg.autoscale(1, 255, percent=30.0)
geoimg.save(filename=sceneid + '.tif', dtype='byte', options=options)
