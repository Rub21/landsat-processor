FROM developmentseed/geolambda:full
RUN yum -y update;
RUN yum install -y nano python-numpy libgdal1h gdal-bin libgdal-dev wget ImageMagick;
RUN curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py"
RUN python get-pip.py
RUN pip install awscli
ENV SCENEIDS LC81670722014347LGN00
WORKDIR /app
COPY app.sh app.sh
CMD ./app.sh
