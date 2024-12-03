done - db accesible from https://console.neo4j.io/?product=aura-db#


Query used
```
CREATE (charlie:Person {name: 'Charlie Sheen'}),
       (martin:Person {name: 'Martin Sheen'}),
       (michael:Person {name: 'Michael Douglas'}),
       (oliver:Person {name: 'Oliver Stone'}),
       (rob:Person {name: 'Rob Reiner'}),
       (wallStreet:Movie {title: 'Wall Street'}),
       (charlie)-[:ACTED_IN {role: 'Bud Fox'}]->(wallStreet),
       (martin)-[:ACTED_IN {role: 'Carl Fox'}]->(wallStreet),
       (michael)-[:ACTED_IN {role: 'Gordon Gekko'}]->(wallStreet),
       (oliver)-[:DIRECTED]->(wallStreet),
       (thePresident:Movie {title: 'The American President'}),
       (martin)-[:ACTED_IN {role: 'A.J. MacInerney'}]->(thePresident),
       (michael)-[:ACTED_IN {role: 'President Andrew Shepherd'}]->(thePresident),
       (rob)-[:DIRECTED]->(thePresident)
```