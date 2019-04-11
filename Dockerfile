FROM napoler/alpine_terry_python
RUN apk add git python3-dev
# RUN apk add g++
# RUN apk add --update --no-cache g++ gcc libxslt-dev lapack-dev  gfortran python python-dev py-pip build-base wget freetype-dev libpng-dev openblas-dev
# RUN ln -s /usr/include/locale.h /usr/include/xlocale.h
# run apk add --no-cache mongodb

# VOLUME /data/db
# EXPOSE 27017 28017

# COPY /myapp/tool/mongo.sh /root


# RUN pip install numpy scipy pandas matplotlib

# ENV JAVA_HOME /opt/jre
# ENV PATH ${PATH}:${JAVA_HOME}/bin

# RUN apk update && apk upgrade && \
#     apk add openjdk8 && \
#     mkdir /tmp/tmprt && \
#     cd /tmp/tmprt && \
#     apk add zip && \
#     unzip -q /usr/lib/jvm/default-jvm/jre/lib/rt.jar && \
#     apk add zip && \
#     zip -q -r /tmp/rt.zip . && \
#     apk del zip && \
#     cd /tmp && \
#     mv rt.zip /usr/lib/jvm/default-jvm/jre/lib/rt.jar && \
#     rm -rf /tmp/tmprt /var/cache/apk/* bin/jjs bin/keytool bin/orbd bin/pack200 bin/policytool \
#           bin/rmid bin/rmiregistry bin/servertool bin/tnameserv bin/unpack200 

# ENV LANG C.UTF-8

# # add a simple script that can auto-detect the appropriate JAVA_HOME value
# # based on whether the JDK or only the JRE is installed
# RUN { \
# 		echo '#!/bin/sh'; \
# 		echo 'set -e'; \
# 		echo; \
# 		echo 'dirname "$(dirname "$(readlink -f "$(which javac || which java)")")"'; \
# 	} > /usr/local/bin/docker-java-home \
# 	&& chmod +x /usr/local/bin/docker-java-home
# ENV JAVA_HOME /usr/lib/jvm/java-1.8-openjdk
# ENV PATH $PATH:/usr/lib/jvm/java-1.8-openjdk/jre/bin:/usr/lib/jvm/java-1.8-openjdk/bin

# ENV JAVA_VERSION 8u201
# ENV JAVA_ALPINE_VERSION 8.201.08-r1

# RUN set -x \
# 	&& apk add --no-cache \
# 		openjdk8="$JAVA_ALPINE_VERSION" \
# 	&& [ "$JAVA_HOME" = "$(docker-java-home)" ]

    



 
#清除之前的缓存
RUN  rm -rf /var/cache/apk/* 

ADD . /myapp
#RUN git clone https://github.com/t-web/alpine_terry_python_flask.git /myapp
WORKDIR /myapp
#安装依赖
# RUN pip3 install -r requirements.txt

RUN  rm -rf /myapp/11* 
EXPOSE 5000
#CMD myapp --port 8000
#CMD ["python3", "app.py"]
RUN export PYTHONPATH=$HOME/myapp/:$PYTHONPATH
#开启debug
RUN export FLASK_APP=app.py
# RUN export FLASK_DEBUG=1 
RUN export FLASK_ENV=development




# ENTRYPOINT [ "/myapp/tool/mongo.sh" ]
# CMD [ "mongod", "--bind_ip", "0.0.0.0" ]


#&& python -m flask run 
CMD ["flask", "run", "--port=8110", "--no-browser", \
    "--allow-root", "--host=0.0.0.0"]


# CMD ["python", "app.py", "--port=8110", "--no-browser", \
#     "--allow-root", "--ip=0.0.0.0", "--NotebookApp.token="]

#python3 -m flask run --host=0.0.0.0