# sinq-amorsim
Deep simulation of the AMOR instrument at PSI

## Setup

The `docker-compose` takes care to create the Kafka topics for the simulation.
Further topics can be added in
```
kafka:
  environment:
    KAFKA_CREATE_TOPICS:
```

(see https://hub.docker.com/r/wurstmeister/kafka for extra options)


## Running the simulation

```
docker-compose up
```

The containers can be started independently:

```
docker-compose run <container>
```

where container can be

- file-writer
- forwarder
- amor-epics
- amor-hm

Under the hood `docker-compose` will start ~zookeeper~ and ~kafka~.

### Working under OSX

The port `5065` used by EPICS can be already used in OSX. In this case one can forward to a different port, ~e.g.~:

```
amor-epics:
  ...
  ports:
    - "5064:5064/tcp"
    - "5064:5064/udp"
    - "5080:5065/tcp"
```

## Known bugs

Due to Kafka startup delays the *forwarder* and the *filewriter* could fail at startup. Please inspect that all the containers are running
```
docker ps
```

If one of the containers (or both) are missing restart it with
```
docker start <container name or id>
```
where container name can be found in the list of stopped containers
```
docker ps -f "status=exited"
```


