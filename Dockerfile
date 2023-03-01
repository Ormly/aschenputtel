FROM python:3.10-slim

ENV PROJECT_DIR /usr/local/bin/src/aschenputtel
WORKDIR ${PROJECT_DIR}

RUN pip install --upgrade pip && pip install pipenv
COPY Pipfile Pipfile.lock ${PROJECT_DIR}/
RUN pipenv install --system --deploy --ignore-pipfile

COPY . .
CMD pipenv run start
