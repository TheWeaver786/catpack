FROM ubuntu:18.04
RUN apt update && apt upgrade -y
RUN apt install --no-install-recommends -y curl git libffi-dev libjpeg-dev libwebp-dev python3-lxml python3-psycopg2 libpq-dev libcurl4-openssl-dev libxml2-dev libxslt1-dev python3-pip python3-sqlalchemy openssl wget python3 python3-dev libreadline-dev libyaml-dev gcc zlib1g ffmpeg libssl-dev libgconf-2-4 libxi6 unzip libopus0 libopus-dev python3-venv libmagickwand-dev pv tree mediainfo

#clonning repo 
RUN git clone https://github.com/TheWeaver786/catuserbot.git /root/userbot
#working directory 
WORKDIR /root/userbot


# Install requirements
RUN pip install --upgrade pip setuptools wheel
RUN pip3 install -U -r requirements.txt

ENV PATH="/home/userbot/bin:$PATH"

CMD ["python3","-m","userbot"]
