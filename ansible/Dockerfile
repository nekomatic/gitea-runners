FROM gitea/runner-images:ubuntu-latest-slim
LABEL authors="nekomatic"
LABEL org.label-schema.schema-version="1.0"
LABEL org.label-schema.name="gitea-job-runner"
LABEL org.label-schema.description="Gitea CI job executor with Ansible, Bitwarden CLI, and Python runtime"
LABEL org.label-schema.version="1.0.0"
LABEL org.label-schema.build-date="2025-08-31"

ENV DEBIAN_FRONTEND=noninteractive
ENV PYTHONUNBUFFERED=1

COPY install-ansible.sh /tmp/install-ansible.sh
RUN bash /tmp/install-ansible.sh && rm /tmp/install-ansible.sh

ARG BW_VERSION=2025.8.2
ARG TARGETARCH

ENV TARGETARCH=${TARGETARCH}

COPY install-bitwarden-components.sh /tmp/install-bitwarden-components.sh
RUN bash /tmp/install-bitwarden-components.sh && rm /tmp/install-bitwarden-components.sh
