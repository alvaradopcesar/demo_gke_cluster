FROM golang:1.13.1-alpine3.10
RUN apk add git 
WORKDIR /go/src/app/

COPY . .

ENV GO111MODULE=on
RUN go mod download
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo main.go

FROM alpine:latest
RUN apk --no-cache add ca-certificates tzdata
ENV TZ America/Lima
ENV HOSTNAME=HOSTNAME_NO_DEFINIDO
RUN mkdir template_excel
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
COPY --from=0 /go/src/app/main .
EXPOSE 80
ENTRYPOINT ["/main"] 