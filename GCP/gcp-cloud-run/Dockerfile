FROM python:3.9

WORKDIR /usr/src/app

COPY . .

RUN pip install --upgrade pip

RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 8080

CMD ["python3", "./main.py"]