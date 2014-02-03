sudo apt-get update --fix-missing
sudo apt-get install git -y
sudo apt-get install vim -y
sudo apt-get install openjdk-7-jre-headless -y

wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-0.90.7.tar.gz
tar -xf elasticsearch-0.90.7.tar.gz
rm elasticsearch-0.90.7.tar.gz
mv elasticsearch-* elasticsearch

sed -i 's/# cluster.name: elasticsearch/cluster.name: elasticsearch_test/g' elasticsearch/config/elasticsearch.yml
