## SETUP GHOST
if [ ! -f /var/log/firsttime ]
then
	touch /var/log/firsttime
	sudo apt-get update

	# Get the latest version of Node.
	sudo apt-get -y install python-software-properties python g++ make
	sudo add-apt-repository ppa:chris-lea/node.js
	sudo apt-get update
	sudo apt-get -y install nodejs

	# Get Ghost and unzip it.
	sudo mkdir /var/www
	sudo mkdir /var/www/ghost
	cd /var/www/ghost
	sudo apt-get install unzip
	wget https://en.ghost.org/zip/ghost-latest.zip
	unzip ghost-latest.zip

	# Create your running config and bind server socket to all IPs.
	# cp config.example.js config.js
	# sed -i 's/127.0.0.1/0.0.0.0/g' config.js

	# Install Ghost.
	sudo npm install --production

	# Install forever & make ghost run forever
	sudo npm install forever -g
	cd /var/www/ghost
	NODE_ENV=production forever start index.js
fi

## SETUP SHELL
echo "source /vagrant/setup/.bashrc" >> /home/vagrant/.bashrc
