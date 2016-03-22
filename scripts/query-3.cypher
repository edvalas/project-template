This Query finds all of the people and the parties they are in  who ran in the county Galway consisting of West and East parts. 
I choose this Query as it would be interesting to see how many people ran in county Galway and calculate a % of total people.

```cypher
	match (c:Constituency) where c.name = 'Galway West' // matches Constituency Galway West
	Optional match (n:Person)-[:RAN_IN]->(c:Constituency) // match all the people who ran in Galway West
	Optional match (n:Person)-[:IS_IN]->(p:Party) // match the peoples parties
	Optional match (v:Constituency) where v.name = 'Galway East' // matches Constituency Galway East
	Optional match (m:Person)-[:RAN_IN]->(v:Constituency) // match all the people who ran in Galway East
	Optional match (m:Person)-[:IS_IN]->(o:Party) // match the peoples parties
	return c,n,p,v,m,o
```

From running this query I get a result of 28 people in total and 10 Parties who ran in county of Galway.
There is 550 people in my database and county Galway had 28 running in it which is 5.01% of the whole country.