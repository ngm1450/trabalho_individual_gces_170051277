FROM python:3.8

WORKDIR /py_gces

COPY src /py_gces/src
COPY data /py_gces/data
COPY tests /py_gces/tests

ENV PYTHONPATH="${PYTHONPATH}:/py_gces"

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

CMD ["python", "src/main.py"]
