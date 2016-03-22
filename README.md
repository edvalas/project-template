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

		
Some Cypher code used to create the database:

```cypher
	CREATE (:Constituency {name:'Carlow Kilkenny', population:'145,659', seats:'5'}) // creates a constituency with name, population and seats
	
	CREATE (:Party {name: 'Fine Gael'}) // creates a party with a name
	
	CREATE (:Person {name: 'Michael ODonnell'}) // creates a person with a name
	
	Match (n:Person), (p:Party) // we want to match a person and a party
	WHERE n.name = 'Seamus MacDonagh' and p.name = 'Independents' //where names of both equal something
	OPTIONAL MATCH (c:Constituency {name: 'Meath East'}) // match a constituency as well
	CREATE n-[:IS_IN]->p // create relationship person is in a party
	CREATE n-[:RAN_IN]->c // create relationship person ran in some constituency
```

## Queries
My first Query looks at Shortest Path between 2 of any kind of nodes. In the example I used 2 people from 2 different parties.
But the Query can easily be changed to find Shortest Path between any other nodes.


#### Shortest Path between 2 people.
This query retreives the Shortest Path between 2 people
```cypher
	MATCH (c:Person {name: 'Seamus Healy'}), (v:Person {name: 'Michael ODonnell'}), // I match 2 people by name
	p = shortestPath((c)-[*..15]-(v)) // create p - shortestPath that could have a max of 15 nodes in between the 2 people
	RETURN p
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
1. [Neo4J website](http://neo4j.com/), the website of the Neo4j database and docs for creating, deleting matching nodes and some built in functions.