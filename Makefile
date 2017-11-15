.PHONY: clash-image
clash-image: 
	docker build -f clash.docker -t clash .
