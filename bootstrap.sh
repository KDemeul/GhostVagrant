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
	cp config.example.js config.js
	sed -i 's/127.0.0.1/0.0.0.0/g' config.js

	# Install Ghost.
	sudo npm install --production
fi

# Run via an INIT job.
if [ ! -f /etc/init/ghost.conf ]
then
	sudo cp /vagrant/setup/ghost.conf /etc/init/
	sudo service ghost start
fi

# #!/usr/bin/env bash

# apt-get update

# ## SETUP BASHRC
# echo "source /vagrant/setup/.bashrc" >> /home/vagrant/.bashrc

# ## INSTALL NODEJS
# echo "INSTALLING NODEJS"

# apt-get install -y npm
# apt-get install -y nodejs

# ## INSTALL UNZIP
# echo "INSTALLING UNZIP"

# apt-get install -y unzip

# ## INSTALL NODE LEGACY
# echo "INSTALLING NODE LEGACY"

# apt-get install -y nodejs-legacy

# ## INSTAL APACHE2
# #echo "INSTALLING APACHE2"
# #
# #apt-get install -y apache2

# ## INSTALL GHOST
# echo "INSTALLING GHOST"

# curl -L https://ghost.org/zip/ghost-latest.zip -o ghost.zip
# mkdir /var/www/
# unzip -uo ghost.zip -d /var/www/ghost
# cd /var/www/ghost
# npm install --production

# ### CONFIGURE GHOST
# #
# ### RUN GHOST AS A SERVICE
# #echo "RUN GHOST AS A SERVICE"
# #
# #cp /vagrant/setup/ghost.conf /etc/init/ghost.conf
# #chmod 644 /etc/init/ghost.conf
# #service ghost start
# #
# ### CONFIGURE APACHE
# #echo "CONFIGURE APACHE"
# #
# #a2enmod proxy_http
# #cp /vagrant/setup/ghost_apache.conf /etc/apache2/sites-available/ghost.conf
# #chmod 644 /etc/apache2/sites-available/ghost.conf
# #a2dissite default
# #a2ensite ghost
# #service apache reload
# #
# #
# #
