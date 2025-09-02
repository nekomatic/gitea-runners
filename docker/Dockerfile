FROM gitea/runner-images:ubuntu-latest-slim
LABEL authors="nekomatic"
LABEL org.label-schema.schema-version="1.0"
LABEL org.label-schema.name="docker-job-runner"
LABEL org.label-schema.description="CI job executor for native Docker image builds with Buildx"
LABEL org.label-schema.version="1.0.0"
LABEL org.label-schema.build-date="2025-09-01"

ENV DEBIAN_FRONTEND=noninteractive

COPY install-docker.sh /tmp/install-docker.sh
RUN bash /tmp/install-docker.sh && rm /tmp/install-docker.sh
