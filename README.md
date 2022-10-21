# Monitoring Spring-Cloud-Gateway with Prometheus and Grafana
This is a little proof-of-concept I wrote for monitoring a [Spring Cloud Gateway](https://cloud.spring.io/spring-cloud-gateway/reference/html/) with [Prometheus](https://prometheus.io/) and [Grafana](https://grafana.com/).  

Feel free to copy this or use it as a blueprint to build anything you like. I've used docker-compose to make this a smother experience to demo.  
It is not at all production ready and you should not treat it as such.

## About
The entire thing is really quite simple.
- The Spring Cloud Gateway collects metrics and exposes them under `/actuator/prometheus`
- Prometheus collects to metrics and safes them in its database
- Grafana gets its metrics from Prometheus and displays them in fancy graphs. Or sends alerts. Or does do other stuff.  

![A beautiful diagram](https://raw.githubusercontent.com/MasterEvarior/spring-cloud-gateway-monitoring/master/docs/Diagram.png)

## Trying it yourself
If you want to try it yourself just clone this repo and replicate the steps below.

### Prerequisites
To run this application you need:
- docker
- docker-compose
- JDK 17 or later
- the ability to build this maven project

### Run the application

### Looking at all those pretty graphs

## Experiencing issues?
If you've got any issues feel free to create an issue. I respond if I can.

## Credits
Credit where credit is due
- [Creating the docker-compose file for Grafana and Prometheus](https://medium.com/javarevisited/monitoring-setup-with-docker-compose-part-2-grafana-2cd2d9ff017b)