import gippy
import sys
sceneid = sys.argv[1:][0]
options = {'COMPRESS': 'DEFLATE', 'PREDICTOR': '2','TILEID': 'YES', 'BLOCKXSIZE': '512', 'BLOCKYSIZE': '512'}
geoimg = gippy.GeoImage.open([sceneid + '_B4.TIF', sceneid + '_B3.TIF', sceneid + '_B2.TIF'])
geoimg.set_nodata(0)
geoimg.set_bandnames(['red', 'green', 'blue'])
geoimg = geoimg.autoscale(1, 255, percent=30.0)
geoimg.save(filename=sceneid + '.tif', dtype='byte', options=options)
