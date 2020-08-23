FROM python:3.7.3-stretch

WORKDIR /app

COPY . main.py /app/

COPY requirements.txt /tmp

RUN pip install --upgrade pip &&\
    pip install -r /tmp/requirements.txt \
    && rm /tmp/requirements.txt

EXPOSE 8080

CMD ["gunicorn", "-b", ":8080", "main:APP"]