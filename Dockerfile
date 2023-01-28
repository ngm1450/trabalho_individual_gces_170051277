FROM python:3.8

WORKDIR /py_gces

COPY pyproject.toml poetry.lock /py_gces/

RUN pip install poetry
RUN poetry config virtualenvs.create false
RUN poetry install --no-dev

COPY src /py_gces/src
COPY data /py_gces/data
COPY tests /py_gces/tests

ENV PYTHONPATH="${PYTHONPATH}:/py_gces"

#COPY requirements.txt .
#RUN pip install --no-cache-dir -r requirements.txt

CMD ["python", "src/main.py"]
