## SETUP GHOST
if [ ! -f /var/log/firsttime ]
then
	touch /var/log/firsttime
	sudo apt-get update

	# Install the required package
	apt-get install -y git
	apt-get install -y unzip
	curl -sL https://deb.nodesource.com/setup | sudo bash -
	apt-get install -y nodejs
	apt-get install -y build-essential

	# Get Ghost and unzip it.
	mkdir /var/www
	mkdir /var/www/ghost
	cd /var/www/ghost
	wget https://en.ghost.org/zip/ghost-latest.zip
	unzip ghost-latest.zip
	rm ghost-latest.zip

	# Create config and ?????????? WHAT IS SED ???????? 
	cp config.example.js config.js
	sed -i 's/127.0.0.1/0.0.0.0/g' config.js

	# Install Ghost.
	npm install --production
fi

## SETUP SHELL
echo "source /vagrant/setup/.bashrc" >> /home/vagrant/.bashrc
