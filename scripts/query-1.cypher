This Query looks at finding the shortest path between 2 nodes of any kind.
The Query can be simply edited to change what you want to match eg. Person, Party or Constituency

I selected Michael ODonnell of the Communist Party and Seamus Healy of the WUAG party.
I choose them as the parties only contain one person in each.

```cypher
	MATCH (c:Person {name: 'Seamus Healy'}), (v:Person {name: 'Michael ODonnell'}), // I match 2 people by name
	p = shortestPath((c)-[*..15]-(v)) // create p - shortestPath that could have a max of 15 nodes in between the 2 people
	RETURN p
```

In the Result of the Query I see that Michael and Seamus are matched by 5 nodes between them.

Michael ran in Cork North West.

Diarmuid OFlynn also ran in Cork North West.
Diarmuid OFlynn is in the Independents party.
Michael Dillon is also in the Independents party.
Michael Dillon ran in Tipperary.

Seamus Healy also ran in Tipperary.

So, Michael ODonnell and Seamus Healy are connected through 2 Constituencies, 1 party and 2 other people who ran in the 2 constituencies.