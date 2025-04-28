## Install Prometheus
wget https://github.com/prometheus/prometheus/releases/download/v3.3.0/prometheus-3.3.0.linux-amd64.tar.gz
tar xzf prometheus-3.3.0.linux-amd64.tar.gz
sudo mkdir -p /data /etc/prometheus
cd prometheus-3.3.0.linux-amd64
sudo mv prometheus promtool /usr/local/bin/
sudo mv prometheus.yml /etc/prometheus/prometheus.yml
sudo chown -R mikrotik:mikrotik /etc/prometheus/ /data/
cd
## Install Node Exporter
wget https://github.com/prometheus/node_exporter/releases/download/v1.9.1/node_exporter-1.9.1.linux-amd64.tar.gz
tar xzf node_exporter-1.9.1.linux-amd64.tar.gz
mv node_exporter-1.9.1.linux-amd64/node_exporter /usr/local/bin/
rm -rf node_exporter*
cp ./node_exporter.service /etc/systemd/system
sudo systemctl enable node_exporter
sudo systemctl start node_exporter

## Install Snmp Exporter
wget https://github.com/prometheus/snmp_exporter/releases/download/v0.21.0/snmp_exporter-0.21.0.linux-amd64.tar.gz
tar xzf snmp_exporter-0.21.0.linux-amd64.tar.gz
cd snmp_exporter-0.21.0.linux-amd64
sudo cp ./snmp_exporter /usr/local/bin/snmp_exporter
sudo cp ./snmp.yml /usr/local/bin/snmp.yml
cp ./snmp-exporter.service /etc/systemd/system
systemctl daemon-reload
sudo service snmp-exporter start
sudo systemctl enable snmp-exporter
##
cp ./prometheus.service /etc/prometheus
sudo systemctl enable prometheus
sudo systemctl start prometheus
sudo systemctl status prometheus
##
sudo apt-get install -y apt-transport-https software-properties-common wget
sudo mkdir -p /etc/apt/keyrings/
wget -q -O - https://apt.grafana.com/gpg.key | gpg --dearmor | sudo tee /etc/apt/keyrings/grafana.gpg > /dev/null
echo "deb [signed-by=/etc/apt/keyrings/grafana.gpg] https://apt.grafana.com stable main" | sudo tee -a /etc/apt/sources.list.d/grafana.list
echo "deb [signed-by=/etc/apt/keyrings/grafana.gpg] https://apt.grafana.com beta main" | sudo tee -a /etc/apt/sources.list.d/grafana.list
sudo apt-get update
sudo apt-get install grafana -y
systemctl enable grafana-server
systemctl start grafana-server

	  

