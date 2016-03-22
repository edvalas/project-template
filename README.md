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

My second Query looks at finding the top 5 Constituencies which had the most people run in them.
From Neo4J docs I was looking at 'Start' Reading Clause to search and also have referenced a blog at References below.

My third Query looks at finding all of the people and their parties who ran in the Constituencies Galway West and Galway East.

#### Shortest Path between 2 people.
This query retreives the Shortest Path between 2 people
```cypher
	MATCH (c:Person {name: 'Seamus Healy'}), (v:Person {name: 'Michael ODonnell'}), // I match 2 people by name
	p = shortestPath((c)-[*..15]-(v)) // create p - shortestPath that could have a max of 15 nodes in between the 2 people
	RETURN p
```

#### Top 5 Constituencies with most people who ran in them.
This query shows top 5 Constituencies which most people running in them.
```cypher
	start n=node(*) // I want to start at n node
	WHERE (n:Constituency) // of type Constituency
	return n, length(n--()) as ranin // count the number of relationships n has, works as Constituencies only have [:RAN_IN] relationship
	order by ranin desc // order by the number of relationships 'ranin' descending limit to 5
	limit 5
```

#### All people who ran in county Galway
This query shows all the people and their parties who ran in the Constituencies Galway East and West
```cypher
	match (c:Constituency) where c.name = 'Galway West' // matches Constituency Galway West
	Optional match (n:Person)-[:RAN_IN]->(c:Constituency) // match all the people who ran in Galway West
	Optional match (n:Person)-[:IS_IN]->(p:Party) // match the peoples parties
	Optional match (v:Constituency) where v.name = 'Galway East' // matches Constituency Galway East
	Optional match (m:Person)-[:RAN_IN]->(v:Constituency) // match all the people who ran in Galway East
	Optional match (m:Person)-[:IS_IN]->(o:Party) // match the peoples parties
	return c,n,p,v,m,o
```

## References
1. [Neo4J website](http://neo4j.com/), the website of the Neo4j database and docs for creating, deleting matching nodes and some built in functions.
2. [Finding a node with most relationships] (https://groups.google.com/forum/#!topic/neo4j/lPo7F3o9ijE) , [Neo4J Start Reading Clause] (http://neo4j.com/docs/stable/query-start.html)