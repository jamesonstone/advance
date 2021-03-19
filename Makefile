run-local-postgres:
	docker run -p 5432:5432 --name postgres -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=postgres -e POSTGRES_DB=advance --rm -d postgres:12
.PHONY: run-local-postgres

stop-local-postgres:
	docker stop postgres && docker rm -f postgres
.PHONY: stop-local-postgres

apply-postgres:
	kubectl apply -f manifests/postgres.yaml
.PHONY: apply-postgres

delete-postgres:
	kubectl delete -f manifests/postgres.yaml
.PHONY: delete-postgres

build:
	docker build -t jstone28/advance:latest .
.PHONY: build

push:
	docker push jstone28/advance:latest
.PHONY: push

run:
	docker run -p 8000:8000 --rm jstone28/advance
.PHONY: delete-postgres

deploy:
	kubectl apply -f manifests/configmap.yaml
	kubectl apply -f manifests/deployment.yaml
.PHONY: deploy

run-server:
	python manage.py runserver
.PHONY: run-server
