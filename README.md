TESTED and RUNNING ON PRODUCTION ZABBIX 6.0 LTS: working as expected.

To do:
- [ ] Add MACROS for more flexibility

# zabbix-mtr-ping
Zabbix ping remote hosts over mtr

# Install on host with zabbix-agent or zabbix-agent2
```bash
		apt-get install -y mtr
    cd /opt/
    git clone https://github.com/Slach/zabbix-mtr-ping.git
    cp -fv /opt/zabbix-mtr-ping/UserParams.conf /etc/zabbix/zabbix_agentd.d/zabbix_mtr_ping.conf
    chmod +x /opt/zabbix-mtr-ping/zabbix-mtr.sh
    # check ping working
    sudo -H -u zabbix /opt/zabbix-mtr-ping/zabbix_mtr.sh -n -c 3 8.8.8.8

```
If you are using agent-2 it works as well but the path to place the userparameter file is different: `/etc/zabbix/zabbix_agent2.d`

For latest versions of mtr if there is no connection, the output value is 0, if the package is not installed you get -1. In the old xml template you have to adjust triggers to be aware of this, you just need to add an or statement, it is corrected in the yaml template.

# One more thing:
You must increase the timeout in the server and in the agent so the script has enough time to output a result:

## Tuning for /etc/zabbix/zabbix_agentd.conf
```
Timeout=30
ServerActive=<your_zabbix_server>
StartAgents=10
```
## Tuning for /etc/zabbix/zabbix_server.conf
```
Timeout=30
```

## Install Templates

Open Zabbix Menu:
Configuration -> Templates -> Import

Choose Template_Zabbix_MTR_Example.xml or template_mtr_v6.yaml

### Modify Items, Triggers and Graphs for your latency and destination hosts requirements
