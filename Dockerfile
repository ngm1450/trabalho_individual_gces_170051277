FROM python:3.8

ENV PYTHONPATH="${PYTHONPATH}:/py_gces"

WORKDIR /py_gces

COPY pyproject.toml poetry.lock /py_gces/
COPY src /py_gces/src
COPY data /py_gces/data
COPY tests /py_gces/tests

RUN pip install poetry
RUN poetry config virtualenvs.create false
RUN poetry install --only main

#COPY requirements.txt .
#RUN pip install --no-cache-dir -r requirements.txt

CMD ["python", "src/main.py"]
