FROM pure/python:3.7-cuda10.2-base

ENV WORKERNAME="nuxhash-docker"
ENV REGION="eu"
ENV OPTOUT=False
ENV API_ORGANIZATION=""
ENV API_KEY=""
ENV API_SECRET=""

RUN apt-get update -y && apt-get install --no-install-recommends --no-install-suggests -y curl git ocl-icd-libopencl1

COPY . /nuxhash
# RUN python3 -m pip install git+https://github.com/Gibbus2/nuxhash
RUN python3 -m pip install /nuxhash

WORKDIR /root/.config/

CMD [ "nuxhashd", "--show-mining" ]