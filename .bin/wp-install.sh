# initialize a wordpress site with lando
lando init \
  --source remote \
  --remote-url https://wordpress.org/latest.tar.gz \
  --recipe wordpress \
  --webroot . \
  --name sitename

# copy wordpress directory to the root and remove the old wordpress directory
cp -r ./wordpress/* ./
rm -r wordpress

# Start lando
sleep 2s
lando start && \
sleep 2s

# initialize a db - this adds config to your wp-config.php file
lando wp config create \
  --dbname=wordpress \
  --dbuser=wordpress \
  --dbpass=wordpress \
  --dbhost=database \
  --path=.

# install base wp site
lando wp core install \
  --url=https://sitename.lndo.site/ \
  --title="sitename" \
  --admin_user=admin \
  --admin_password=password \
  --admin_email=admin@sitename.lndo.site \
  --path=.