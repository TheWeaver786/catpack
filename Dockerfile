FROM python:3.9
WORKDIR /app/

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


COPY requirements.txt .

RUN pip3 install -r requirements.txt

COPY . .


ENV PATH="/home/userbot/bin:$PATH"

CMD ["python3","-m","userbot"]
