FROM golang:bullseye

WORKDIR /app

ARG GO_VERSION=1.25.0

RUN apt -y --no-install-recommends update && \
    apt -y --no-install-recommends upgrade && \
    apt install -y --no-install-recommends curl upx-ucl gcc-mingw-w64 && \
    curl -fsSL "https://dl.google.com/go/go${GO_VERSION}.linux-amd64.tar.gz" -o /tmp/go.tgz && \
    rm -rf /usr/local/go && \
    tar -C /usr/local -xzf /tmp/go.tgz && \
    rm -f /tmp/go.tgz && \
    rm -rf /var/lib/apt/lists/* && \
    GOTOOLCHAIN=auto go install mvdan.cc/garble@latest

ENV PATH="/usr/local/go/bin:${PATH}:$(go env GOPATH)/bin"
ENV GOTOOLCHAIN=auto

COPY go.mod go.sum ./

RUN go mod download -x

COPY . .

RUN make server

RUN chmod +x /app/docker-entrypoint.sh /app/wait-for-it.sh

ENTRYPOINT ["/app/docker-entrypoint.sh"]
