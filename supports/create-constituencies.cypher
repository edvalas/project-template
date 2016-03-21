#########################Constituencies##############################################
CREATE (:Constituency {county:'Carlow Kilkenny', population:'145,659', seats:'5'})
CREATE (:Constituency {county:'Cavan Monaghan', population:'120,483', seats:'4'})
CREATE (:Constituency {county:'Clare', population:'111,336', seats:'4'})
CREATE (:Constituency {county:'Cork East', population:'114,365', seats:'4'})
CREATE (:Constituency {county:'Cork North Central', population:'117,170', seats:'4'})
CREATE (:Constituency {county:'Cork North West', population:'86,593', seats:'3'})
CREATE (:Constituency {county:'Cork South Central', population:'117,952', seats:'4'})
CREATE (:Constituency {county:'Cork South West', population:'82,952', seats:'3'})
CREATE (:Constituency {county:'Donegal', population:'152,358', seats:'5'})
CREATE (:Constituency {county:'Dublin Bay North', population:'146,512', seats:'5'})
CREATE (:Constituency {county:'Dublin Bay South', population:'116,396', seats:'4'})
CREATE (:Constituency {county:'Dublin Central', population:'89,030', seats:'3'})
CREATE (:Constituency {county:'Dublin Fingal', population:'141,162', seats:'5'})
CREATE (:Constituency {county:'Dublin Mid–West', population:'110,427', seats:'4'})
CREATE (:Constituency {county:'Dublin North West', population: '90,534', seats:'3'})
CREATE (:Constituency {county:'Dublin Rathdown', population:'87,470', seats:'3'})
CREATE (:Constituency {county:'Dublin South Central', population:'114,660', seats:'4'})
CREATE (:Constituency {county:'Dublin South West', population:'144,908', seats:'5'})
CREATE (:Constituency {county:'Dublin West', population:'113,179', seats:'4'})
CREATE (:Constituency {county:'Dún Laoghaire', population:'118,791', seats:'4'})
CREATE (:Constituency {county:'Galway East', population:'89,564', seats:'3'})
CREATE (:Constituency {county:'Galway West', population:'150,874', seats:'5'})
CREATE (:Constituency {county:'Kerry', population:'145,502', seats:'5'})
CREATE (:Constituency {county:'Kildare North', population:'115,350'	, seats:'4'})
CREATE (:Constituency {county:'Kildare South', population:'115,350', seats:'3'})
CREATE (:Constituency {county:'Laois', population:'87,745', seats:'3'})
CREATE (:Constituency {county:'Limerick City', population:'113,835', seats:'4'})
CREATE (:Constituency {county:'Limerick County', population:'83,834', seats:'3'})
CREATE (:Constituency {county:'Longford Westmeath', population:'116,802', seats:'4'})
CREATE (:Constituency {county:'Louth', population:'143,272', seats:'5'})
CREATE (:Constituency {county:'Mayo', population:'120,332', seats:'4'})
CREATE (:Constituency {county:'Meath East' , population:'86,572', seats:'3'})
CREATE (:Constituency {county:'Meath West', population:'85,550', seats:'3'})
CREATE (:Constituency {county:'Offaly', population:'87,640', seats:'3'})
CREATE (:Constituency {county:'Roscommon Galway', population:'84,586', seats:'3'})
CREATE (:Constituency {county:'SligoLeitrim', population:'119,153', seats:'4'})
CREATE (:Constituency {county:'Tipperary', population:'147,801', seats:'5'})
CREATE (:Constituency {county:'Waterford', population:'113,795', seats:'4'})
CREATE (:Constituency {county:'Wexford', population:'145,320', seats:'5'})
CREATE (:Constituency {county:'Wicklow', population:'141,012', seats:'5'})

##################################Parties########################################

CREATE (:Party {name: 'Fine Gael'}) x
CREATE (:Party {name: 'Labour'}) x
CREATE (:Party {name: 'Fianna Fail'}) x
CREATE (:Party {name: 'Sinn Fein'}) x
CREATE (:Party {name: 'Anti Austerity'}) x
CREATE (:Party {name: 'Renua Ireland'}) x
CREATE (:Party {name: 'Social Democrats'}) x
CREATE (:Party {name: 'WUAG'}) x
CREATE (:Party {name: 'Independents'})

CREATE (:Party {name: 'Green Party'}) x
CREATE (:Party {name: 'Irish Democratic Party'}) x
CREATE (:Party {name: 'Workers Party'}) x
CREATE (:Party {name: 'Direct Democracy'}) x
CREATE (:Party {name: 'Peoples Convention'}) x
CREATE (:Party {name: 'Communist Party'}) x
CREATE (:Party {name: 'Fis Nua'}) x
CREATE (:Party {name: 'Catholic Democrats'}) x

#######################People + IS_IN PARTY + RAN_IN##################################################
----SAMPLE TO CREATE A PERSON AND CREATE A RELATIONSHIP OF IS_IN SOME PARTY + WHERE THEY RAN_IN
	WILL USE THIS AS TEMPLATE FOR THE REST OF CANDIDATES---------------

CREATE (:Person {name: 'Michael ODonnell'}) --- CREATE a Person

Match (n:Person), (p:Party)
where n.name = 'Seamus MacDonagh' and p.name = 'Labour'
OPTIONAL MATCH (c:Constituency {name: 'Meath East'})
CREATE n-[:IS_IN]->p
CREATE n-[:RAN_IN]->c ---- adds both relationships to a person

match (n:Person) where n.name = 'Mike Durkan'
Optional match (n:Person)-[:IS_IN]->(p:Party)
return n,p

----------Check for nodes who are not in a party-----
MATCH (Person) 
WHERE NOT (Person)-[:IS_IN]-()
RETURN Person

##################match person , party , constituency#############################

MATCH (n:Person {name: 'Michael ODonnell'})
OPTIONAL MATCH (p:Party {name: 'Communist Party'})
OPTIONAL MATCH (c:Constituency {name: 'Cork North West'})
RETURN n,p,c

MATCH (p:Party {name: 'Fis Nua'})
OPTIONAL MATCH (n:Person)-[:IS_IN]->(p:Party)
OPTIONAL MATCH (n:Person)-[:RAN_IN]->(c:Constituency)
RETURN n,p,c