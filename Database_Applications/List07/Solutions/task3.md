### Commands

- Return movies in which person X acted

```
MATCH (:Person {name: 'Actor Two'})-[:ACTED_IN]->(movie:Movie)
RETURN movie;
```

- Return movies where person X was both actor and director