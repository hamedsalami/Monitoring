**What is Grafana?**

Grafana is an open-source platform for data visualization, monitoring, and analysis. 
It allows you to create and display interactive, customizable dashboards with real-time monitoring and analytics capabilities.
Grafana supports a wide range of data sources, including time-series databases and relational databases.

With Grafana, you can easily create visualizations and alerts based on your data, as well as collaborate with other team members
through sharing and annotations. It also provides advanced features like plugins, annotations, and panels, which allow you to
extend the platform’s capabilities and create custom visualizations and integrations.

Grafana is widely used in industries such as IT, finance, healthcare, and more, for monitoring and analyzing various metrics, logs, 
and sensor data. It is known for its user-friendly interface, ease of use, and powerful features, making it a popular 
choice for data visualization and monitoring.

Grafana Dashboard for Mikrotik: 14420 , 14857

**To install Grafana from grafana-installation.sh**

sudo adduser mikrotik

sudo adduser mikrotik sudo

su mikrotik

cd

git clone grafana-installation.sh

chmod +x grafana-installation.sh

./grafana-installation.sh

**To Permit Share :**

nano /etc/grafana/grafana.ini

allow_embedding = true

Anonymous Auth -> enabled=yes

systemctl restart grafana-server

**Change loading Image in share embedded**

 chmod 777 /usr/share/grafana/public/img/grafana_icon.svg

 chmod 777 /usr/share/grafana/public/img/

 change the grafana_icon.svg
