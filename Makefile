.PHONY: test

test:
	docker-compose up -d app
	# TODO: fix this
	sleep 5
	docker-compose run test
