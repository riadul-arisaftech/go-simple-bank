postgres:
	docker run --name postgres15 -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=2654 -d postgres:15.3

createdb: 
	docker exec -it postgres15 createdb --username=root --owner=root simple_bank_db

dropdb: 
	docker exec -it postgres15 dropdb simple_bank_db

migrateCreate:
	migrate create -ext sql -dir db/migration -seq ${name}

migrateup:
	migrate -path db/migration -database "postgresql://root:2654@localhost:5432/simple_bank_db?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migration -database "postgresql://root:2654@localhost:5432/simple_bank_db?sslmode=disable" -verbose down

sqlc:
	sqlc generate

test:
	go test -v -cover ./...

server:
	go run main.go

mock:
	mockgen -package mockdb -destination db/mock/store.go riad.com/simple_bank/db/sqlc Store

.PHONY: postgres createdb dropdb migrateup migratedown sqlc test server mock