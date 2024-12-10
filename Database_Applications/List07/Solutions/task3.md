### Commands

- Return movies in which person X acted

```cypher
MATCH (:Person {name: 'Actor Two'})-[:ACTED_IN]->(movie:Movie)
RETURN movie;
```

- Return movies where person X was both actor and director

```cypher
// First create data so we get actual output
MATCH (actor:Person {name: 'Actor Two'}), 
      (movie:Movie {title: 'Movie 3'})
CREATE (actor)-[:DIRECTED]->(movie);

// Query to return what's asked
MATCH (person:Person {name: 'Actor Two'})
MATCH (person)-[:ACTED_IN]->(movie:Movie)
MATCH (person)-[:DIRECTED]->(movie)
RETURN movie;
```
- Return actors who didn't play in any movie

```cypher
MATCH (actor:Person)
WHERE NOT (actor)-[:ACTED_IN]->(:Movie)
RETURN actor;
```
- Return actors who played in more than 2 movies

```cypher
// Data
MATCH (actor:Person {name: 'Martin Sheen'}), 
      (movie:Movie {title: 'Movie 3'})
CREATE (actor)-[:ACTED_IN]->(movie);

// Query
MATCH (actor:Person)-[:ACTED_IN]->(movie:Movie)
WITH actor, COUNT(movie) AS movieCount
WHERE movieCount > 2
RETURN actor, movieCount;
```

- Return movies with larger number of actors

```cypher
MATCH (actor:Person)-[:ACTED_IN]->(movie:Movie)
WITH movie, COUNT(actor) AS actorCount
WHERE actorCount > 2
RETURN movie.title AS movieTitle, actorCount
ORDER BY actorCount DESC;
```