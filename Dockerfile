
FROM python:3.6-slim AS builder

WORKDIR /app


COPY requirements.txt $WORKDIR


RUN pip install --upgrade pip -r requirements.txt --no-cache-dir


FROM python:3.6-slim

WORKDIR /app


COPY --from=builder /usr/local /usr/local


COPY . $WORKDIR


RUN chmod +x /app/entrypoint.sh


EXPOSE 8000


ENTRYPOINT ["sh", "/app/entrypoint.sh"]