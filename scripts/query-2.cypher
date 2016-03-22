This Query finds the top 5 Constituencies which have the most people running in them.
I choose this Query as it would be interesting to see which Constituencies have the most people running in them.

```cypher
	start n=node(*) // I want to start at n node
	WHERE (n:Constituency) // of type Constituency
	return n, length(n--()) as ranin // count the number of relationships n has, works as Constituencies only have [:RAN_IN] relationship
	order by ranin desc // order by the number of relationships 'ranin' descending limit to 5
	limit 5
```

In the result of the Query I see the following top 5

Dublin South West people: 21
Dublin Bay North people: 19
Galway West people: 19
Sligo Leitrim people: 19
Longford Westmeath people: 19