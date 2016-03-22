# Irish Constituencies Neo4j Database
###### Ed Lasauskas, G00311516

## Introduction
This is a project for Graph Theory module based on Irish Constituencies done in Neo4J graph based database.

## Database
I have created the database in Neo4J using various cypher scripts. All of the scripts that I used to create nodes,
matching and displaying queries and one query to check is there are odd nodes without relationships can all be
found in the supports folder in the create-constituencies.cypher file.

The database contains nodes of type: 

		Constituency - The county or a part of the county which people ran in like Wicklow, Galway West/East.
		Contains Name of the constituency, population and number of seats in that constituency.
		
		Person - Is a political candidate node. Contains name of the candidate.
		
		Party - Political party which has candidates representing the party. Contains name of the party.

The database contains 2 types of relationships:

		1. [:IS_IN] - relationship describing a person [:IS_IN] some party.
		
		2. [:RAN_IN] - relationship describing a person [:RAN_IN] some constituency.

## Queries
Summarise your three queries here.
Then explain them one by one in the following sections.

#### Query one title
This query retreives the Bacon number of an actor...
```cypher
MATCH
	(Bacon)
RETURN
	Bacon;
```

#### Query two title
This query retreives the Bacon number of an actor...
```cypher
MATCH
	(Bacon)
RETURN
	Bacon;
```

#### Query three title
This query retreives the Bacon number of an actor...
```cypher
MATCH
	(Bacon)
RETURN
	Bacon;
```

## References

Used docs of Cypher Query language for matching, creating and deleting queries.

1. [Neo4J website](http://neo4j.com/), the website of the Neo4j database.