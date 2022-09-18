FROM golang:1.19-alpine

WORKDIR /app

COPY config.yml ./
COPY go.mod ./
COPY go.sum ./

COPY *.go ./

RUN go mod download
RUN go get github.com/gocolly/colly
RUN go get github.com/ghodss/yaml
RUN go get github.com/sirupsen/logrus
RUN go get github.com/prometheus/client_golang/prometheus
RUN go get github.com/prometheus/client_golang/prometheus/promhttp
RUN go get github.com/prometheus/common/version

RUN go mod vendor
RUN go mod tidy

RUN go build -o /crypto-exporter

EXPOSE 9111

CMD [ "/crypto-exporter" ]

