FROM developmentseed/geolambda:full
RUN yum -y update;
RUN yum install -y nano python-numpy libgdal1h gdal-bin libgdal-dev curl;
RUN pip install gippy
RUN pip install rasterio
RUN pip install wget
RUN curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py"
RUN python get-pip.py
RUN pip install awscli
ADD app.py .
ADD files.txt .
CMD /usr/local/bin/app.sh