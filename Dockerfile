FROM python:3.13-alpine

# Set environment variables to prevent Python from writing .pyc files and buffering stdout/stderr
ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1

# Install requirements for add-on

RUN apk add --no-cache \
    bash \
    gcc \
    musl-dev \
    libffi-dev \
    openssl-dev

# Install required Python libraries
RUN pip install --no-cache-dir \
    paho-mqtt \
    requests

# Copy data for add-on
COPY run.sh /
COPY envoy_to_mqtt_json.py /

RUN chmod +x /run.sh

CMD [ "/run.sh" ]