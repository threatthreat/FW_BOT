FROM python:3.8-slim-buster

RUN apt update && apt install -y git

COPY requirements.txt /requirements.txt
RUN pip install --upgrade pip && pip install -r /requirements.txt flask

RUN mkdir /fwdbot
WORKDIR /fwdbot

COPY . .

EXPOSE 8080

CMD ["sh", "./start.sh"]
