FROM debian:testing

ENV MATTERMOST_VERSION=5.33.3
RUN set -eux \
  ; apt-get update \
  ; apt-get upgrade -y \
  ; DEBIAN_FRONTEND=noninteractive \
    apt-get install -y --no-install-recommends \
        locales tzdata sudo ca-certificates \
        curl \
  ; apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/lists/* \
  ; curl -sSL https://releases.mattermost.com/${MATTERMOST_VERSION}/mattermost-${MATTERMOST_VERSION}-linux-amd64.tar.gz \
    | tar -zxf - -C /opt

WORKDIR /opt/mattermost
CMD [ "/opt/mattermost/bin/mattermost" ]

