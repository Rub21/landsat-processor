FROM developmentseed/geolambda:full
RUN yum -y update;
RUN yum install -y nano python-numpy libgdal1h gdal-bin libgdal-dev curl;
RUN pip install gippy
RUN pip install git+git://github.com/sat-utils/sat-download.git@master
RUN curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py"
RUN python get-pip.py
RUN pip install awscli
WORKDIR /app
ADD app.py app.py
ADD script.sh script.sh
ADD download.py download.py
CMD ["bash", "script.sh"]

