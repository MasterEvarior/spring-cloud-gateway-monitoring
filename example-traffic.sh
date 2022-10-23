#!/bin/bash

while true
do
  wget -O/dev/null -q http://localhost:8080/200
  wget -O/dev/null -q http://localhost:8080/200
  wget -O/dev/null -q http://localhost:8080/200
  wget -O/dev/null -q http://localhost:8080/200
  wget -O/dev/null -q http://localhost:8080/200
  sleep 2
  wget -O/dev/null -q http://localhost:8080/200
  wget -O/dev/null -q http://localhost:8080/200
  wget -O/dev/null -q http://localhost:8080/200
  wget -O/dev/null -q http://localhost:8080/200
  sleep 3
  wget -O/dev/null -q http://localhost:8080/404
  wget -O/dev/null -q http://localhost:8080/404
  wget -O/dev/null -q http://localhost:8080/404
  sleep 1
  wget -O/dev/null -q http://localhost:8080/300
  wget -O/dev/null -q http://localhost:8080/300
  sleep 2
  wget -O/dev/null -q http://localhost:8080/500
  sleep 10
done