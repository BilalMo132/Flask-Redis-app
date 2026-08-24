# stage 1: build stage
#FROM python:3.10-slim AS build

#WORKDIR /app

#RUN apt-get update && apt-get install -y \
#     gcc \
#     python3-dev \
#     libmariadb-dev \
#     pkg-config

# RUN python3 -m venv /opt/venv
# ENV PATH="/opt/venv/bin:$PATH"

# COPY requirements.txt .
# RUN pip3 install -r requirements.txt

# WORKDIR /redis_client

# # stage 2: production stage

# FROM python:3.10-slim

# WORKDIR /app
# RUN apt-get update && apt-get install -y \
#     libmariadb3 \
#     && rm -rf /var/lib/apt/lists/*
# COPY --from=build /opt/venv /opt/venv
# COPY --from=build /app /app

# ENV PATH="/opt/venv/bin:$PATH"

# EXPOSE 5000

# CMD ["python3", "count.py", "redis-app.py"]

FROM python:3.10-slim

WORKDIR /redis-app

# copy requirements.txt and install dependencies

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
# copy the application code
COPY . .

EXPOSE 5000

CMD ["python", "redis-app.py"]
