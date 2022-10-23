# Monitoring Spring Cloud Gateway with Prometheus and Grafana
This is a little proof-of-concept I wrote for monitoring a [Spring Cloud Gateway](https://cloud.spring.io/spring-cloud-gateway/reference/html/) with [Prometheus](https://prometheus.io/) and [Grafana](https://grafana.com/).  

Feel free to copy this or use it as a blueprint to build anything you like. I've used docker-compose to make this a smother experience to demo.  
**It is not at all production ready and you should not treat it as such.**

## About
The entire thing is really quite simple.
- The Spring Cloud Gateway collects metrics and exposes them under `/actuator/prometheus`
- Prometheus collects to metrics and safes them in its database
- Grafana gets its metrics from Prometheus and displays them in fancy graphs. Or sends alerts. Or does do other stuff.

![A beautiful diagram](https://raw.githubusercontent.com/MasterEvarior/spring-cloud-gateway-monitoring/master/docs/diagram.png)

### Custom metrics
All the custom metrics are collected in [this class](https://github.com/MasterEvarior/spring-cloud-gateway-monitoring/blob/master/src/main/java/dev/giannin/springcloudgatewaymonitoring/filter/PrometheusGlobalFilter.java).
They are really nothing fancy and just count up everytime a request is made or an response is received. In fact the default metrics already implement this function but I thought it is a good example anyway. So I did it again.   
![A stupid meme](https://raw.githubusercontent.com/MasterEvarior/spring-cloud-gateway-monitoring/master/docs/again.jpeg)

## Trying it yourself
If you want to try it yourself just clone this repo and replicate the steps below.

### Prerequisites
To run this application you need:
- docker
- docker-compose
- JDK 17 or later
- the ability to build this maven project

### Run the application
Build the maven project  
```shell
mvn clean package
```

Run docker-compose 
```shell
docker-compose up
```

If you execute `docker ps` you should now see three containers running (some things will differ though)
```shell
CONTAINER ID   IMAGE                         COMMAND                  CREATED        STATUS       PORTS                                       NAMES
76c2da3da29c   prom/prometheus:latest        "/bin/prometheus --w…"   2 hours ago    Up 2 hours   0.0.0.0:9090->9090/tcp, :::9090->9090/tcp   spring-cloud-gateway-monitoring-prometheus-1
37bb0b105e27   grafana/grafana:latest        "/run.sh"                2 hours ago    Up 2 hours   0.0.0.0:3000->3000/tcp, :::3000->3000/tcp   spring-cloud-gateway-monitoring-grafana-1
90db75229a20   spring-cloud-gateway:latest   "java -jar /app.jar"     43 hours ago   Up 2 hours   0.0.0.0:8080->8080/tcp, :::8080->8080/tcp   spring-cloud-gateway-monitoring-spring-cloud-gateway-1
```
Also if you open http://localhost:9090/targets?search= you should see that Prometheus can connect to your gateway and receive its metrics.  
![Prometheus screenshot](https://raw.githubusercontent.com/MasterEvarior/spring-cloud-gateway-monitoring/master/docs/prometheus.png)

If you want to 'simulate' traffic, run the `example-traffic` script. It is just a glorified while-loop, but it does the job.
```shell
bash ./example-traffic
```

### Looking at all those pretty graphs
To see all the data in Grafana you have to log in and create some dashboards first.

Go to http://localhost:3000 and log in with the user `admin` and the password `admin`. In the sidebar you can import dashboards. [See here for a tutorial.](https://rudimartinsen.com/2020/08/06/grafana-importing-dashboards/)   
**Be sure to choose 'Prometheus' as a datasource for all your dashboards.**

A good one for Spring Boot is [this one](https://grafana.com/grafana/dashboards/12900-springboot-apm-dashboard/) with the id `12900` by prakarsh.

It should look something like this:  
![An image with a lot of graphs](https://raw.githubusercontent.com/MasterEvarior/spring-cloud-gateway-monitoring/master/docs/grafana.png)

## Experiencing issues?
If you've got any issues feel free to create an issue. I respond if I can.  

## Credits
Credit where credit is due
- [Creating the docker-compose file for Grafana and Prometheus](https://medium.com/javarevisited/monitoring-setup-with-docker-compose-part-2-grafana-2cd2d9ff017b)
- [Spring Boot dashboard for Grafana](https://grafana.com/grafana/dashboards/12900-springboot-apm-dashboard/)