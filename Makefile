.PHONY: test docs

test:
	go test -v -count=1 ./...

docs:
	cd ./cmd/makedocs && go run main.go

ci:
	go get -t -v ./...
	go tool vet .
	go test -v -race ./...
	gometalinter.v2 --skip=testdata --vendor ./...