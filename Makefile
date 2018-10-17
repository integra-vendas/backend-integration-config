default:
	make update
	make run

remove-all:
	docker stop $(docker ps -a -q)
	docker rm $(docker ps -a -q)

update:
	sh integration.sh update

run:
	sh integration.sh run

show-ip:
	python get-ip-address.py
	sh show-conatiners-ip.sh
