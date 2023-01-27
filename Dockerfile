FROM python:3.8

COPY src /app/src
COPY requirements.txt /app/requirements.txt
COPY data /app/data

WORKDIR /app

RUN pip install -r requirements.txt

CMD ["python", "src/main.py"]
