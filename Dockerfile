FROM python:3.13-slim-bookworm
WORKDIR /catty-reminders-app
COPY requirements.txt .
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt
RUN adduser --disabled-password --gecos '' appuser
COPY . .
RUN chown -R appuser:appuser /catty-reminders-app
USER appuser
EXPOSE 8181
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8181"]
