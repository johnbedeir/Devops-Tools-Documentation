FROM python:3-onbuild
COPY . /usr/src/app
RUN useradd --create-home --shell /bin/bash appuser && \
    chown -R appuser:appuser /usr/src/app
USER appuser
CMD ["python", "api.py"]