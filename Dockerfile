FROM python:3.9.1-buster

ENV VIRTUAL_ENV "/venv"
RUN python -m venv $VIRTUAL_ENV
ENV PATH "$VIRTUAL_ENV/bin:$PATH"

RUN apt-get -qq update && apt-get -qq upgrade -y
RUN apt-get -qq install -y --no-install-recommends \
    ffmpeg \
    opus-tools \
    bpm-tools

RUN python -m pip install --upgrade pip
RUN python -m pip install wheel

WORKDIR /Fheroku

COPY . .

RUN pip install -r requirements.txt

CMD [ "bash", "x.sh" ]
