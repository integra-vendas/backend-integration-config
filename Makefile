default:
	make update
	make run

update:
	sh integration.sh update

run:
	docker network create backend || true
	sh integration.sh run

show-ip:
	python get-ip-address.py
	sh show-conatiners-ip.sh
