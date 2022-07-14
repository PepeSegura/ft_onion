IMG=ft_onion/42valgrind:0.0.3
NAME=ft_onion_Server
NAME2=ft_onion_Client

run:
	docker run -it \
		--name $(NAME) \
		-p 80:80 \
		-p 4242:22 \
		-d $(IMG) \

client:
	docker run -it \
		--name $(NAME2) \
		-d $(IMG) \

stop:
	docker rm -f $(NAME)

re: stop run
	@true

enter:
	docker exec -it $(NAME) \
		bash \

enter_c:
	docker exec -it $(NAME2) \
		bash \

build:
	docker build -t $(IMG) .

push:
	docker push $(IMG)
