FROM python:3.9

RUN echo deb http://http.us.debian.org/debian/ testing non-free contrib main > /etc/apt/sources.list && \
    apt -qq update
RUN apt -qq install -y --no-install-recommends \
    curl \
    git \
    gcc \
    g++ \
    build-essential \
    gnupg2 \
    unzip \
    wget \
    ffmpeg \
    jq


RUN git clone -b qovery https://github.com/TheWeaver786/catuserbot.git /app/userbot
#working directory 
WORKDIR /app/userbot

# Install requirements
RUN pip3 install -U -r requirements.txt


ENV PATH="/home/userbot/bin:$PATH"

CMD ["python3","-m","userbot"]
