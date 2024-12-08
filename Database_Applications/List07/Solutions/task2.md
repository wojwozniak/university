### Commands that I ran

- Create 2 movies and 2 actors
```cypher
CREATE (movie1:Movie {title: "Movie 1"})
CREATE (movie2:Movie {title: "Movie 2"})
CREATE (actor1: Person {name: "Actor One"})
CREATE (actor2: Person {name: "Actor Two"})
```

- Add two new properties to 1 movie
```cypher
MATCH (movie2:Movie {title: "Movie 2"})
    SET movie2.property1 = "value1", movie2.property2 = "value2"
```

- Add two `acted_in` relations to existing nodes

```cypher
MATCH (actor1:Person {name: 'Actor One'}), 
      (actor2:Person {name: 'Actor Two'}),
      (movie1:Movie {title: 'Movie 1'}),
      (movie2:Movie {title: 'Movie 2'})
CREATE (actor1)-[:ACTED_IN]->(movie1),
       (actor2)-[:ACTED_IN]->(movie2);
```

- Update one movie property

```cypher
MATCH (movie:Movie {title: 'Movie 2'})
    SET movie.title = 'Movie 3';
```


- Remove one `acted_in` relation

```cypher
MATCH (actor:Person {name: 'Actor One'})-[rel:ACTED_IN]->(movie:Movie {title: 'Movie 1'})
    DELETE rel;
```