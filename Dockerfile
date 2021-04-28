FROM golang:1.16-alpine as build
WORKDIR /go/src/github.com/carloslimasis/go-docker/
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o full_cycle_rocks .

FROM scratch
COPY --from=build /go/src/github.com/carloslimasis/go-docker/full_cycle_rocks /full_cycle_rocks
ENTRYPOINT ["./full_cycle_rocks"]  