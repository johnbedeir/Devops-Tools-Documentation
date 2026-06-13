FROM python:3.14.6

WORKDIR /usr/src/app

COPY . .

RUN pip install --upgrade pip

RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 8080

RUN useradd --create-home --shell /bin/bash appuser
USER appuser

CMD ["python3", "./main.py"]