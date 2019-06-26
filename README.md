# sinq-amorsim
Deep simulation of the AMOR instrument at PSI

## Setup

The `docker-compose` takes care to create the intruments topic (at the moment `AMOR` and `ESTIA`, but it's trivial to extend).
Unfortunately it does not take care of setting the correct compaction policy for the cmopacted cache. It is necessary to access to the container and execute the following command:

```bash
kafka-configs.sh --zookeeper zookeeper:2181 --entity-type topics --entity-name <instrument>_nicosCacheCompacted --alter --add-config cleanup.policy=compact
```

where `<instrument>` can be AMOR or ESTIA (or both)
