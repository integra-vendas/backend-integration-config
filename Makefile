default:
	sh integration.sh update

run:
	sh integration.sh run

show-ip:
	python get-ip-address.py
	sh show-conatiners-ip.sh
