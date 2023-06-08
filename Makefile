dest := /usr/local/bin

install:
	echo "Copying ansible-parallel scripts to $(dest)"
	sudo cp ansible-parallel teams-msg telegram-msg $(dest)/
	echo "Ensuring executable permissions"
	sudo chmod +x $(dest)/ansible-parallel
	sudo chmod +x $(dest)/teams-msg
	sudo chmod +x $(dest)/telegram-msg
