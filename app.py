import gippy
import wget

with open('files.txt') as f:
    content = f.read().splitlines();
    for url in content:
    	print 'Downloading... ' + url + '\n';
    	wget.download(url)

options = {'COMPRESS': 'DEFLATE', 'PREDICTOR': '2', 'TILEID': 'YES', 'BLOCKXSIZE': '512', 'BLOCKYSIZE': '512'}
geoimg = gippy.GeoImage.open(['LC81670722014347LGN00_B4.TIF', 'LC81670722014347LGN00_B3.TIF', 'LC81670722014347LGN00_B2.TIF'])
geoimg.set_nodata(0)
geoimg.set_bandnames(['red', 'green', 'blue'])
geoimg = geoimg.autoscale(1, 255, percent=2.0)
geoimg.save(filename='LC81670722014347LGN00.tif', dtype='byte', options=options)