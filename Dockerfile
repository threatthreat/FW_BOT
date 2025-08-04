FROM python:3.10-slim

RUN apt-get update && apt-get install -y git

COPY requirements.txt /requirements.txt
RUN pip install --upgrade pip && pip install -r /requirements.txt flask

WORKDIR /bot

COPY . .

EXPOSE 8080

CMD ["sh", "./start.sh"]
