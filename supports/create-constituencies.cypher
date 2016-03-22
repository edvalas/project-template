#########################  Constituencies  ##############################################

					Queries to create Constituencies

CREATE (:Constituency {name:'Carlow Kilkenny', population:'145,659', seats:'5'})
CREATE (:Constituency {name:'Cavan Monaghan', population:'120,483', seats:'4'})
CREATE (:Constituency {name:'Clare', population:'111,336', seats:'4'})
CREATE (:Constituency {name:'Cork East', population:'114,365', seats:'4'})
CREATE (:Constituency {name:'Cork North Central', population:'117,170', seats:'4'})
CREATE (:Constituency {name:'Cork North West', population:'86,593', seats:'3'})
CREATE (:Constituency {name:'Cork South Central', population:'117,952', seats:'4'})
CREATE (:Constituency {name:'Cork South West', population:'82,952', seats:'3'})
CREATE (:Constituency {name:'Donegal', population:'152,358', seats:'5'})
CREATE (:Constituency {name:'Dublin Bay North', population:'146,512', seats:'5'})
CREATE (:Constituency {name:'Dublin Bay South', population:'116,396', seats:'4'})
CREATE (:Constituency {name:'Dublin Central', population:'89,030', seats:'3'})
CREATE (:Constituency {name:'Dublin Fingal', population:'141,162', seats:'5'})
CREATE (:Constituency {name:'Dublin Mid–West', population:'110,427', seats:'4'})
CREATE (:Constituency {name:'Dublin North West', population: '90,534', seats:'3'})
CREATE (:Constituency {name:'Dublin Rathdown', population:'87,470', seats:'3'})
CREATE (:Constituency {name:'Dublin South Central', population:'114,660', seats:'4'})
CREATE (:Constituency {name:'Dublin South West', population:'144,908', seats:'5'})
CREATE (:Constituency {name:'Dublin West', population:'113,179', seats:'4'})
CREATE (:Constituency {name:'Dún Laoghaire', population:'118,791', seats:'4'})
CREATE (:Constituency {name:'Galway East', population:'89,564', seats:'3'})
CREATE (:Constituency {name:'Galway West', population:'150,874', seats:'5'})
CREATE (:Constituency {name:'Kerry', population:'145,502', seats:'5'})
CREATE (:Constituency {name:'Kildare North', population:'115,350'	, seats:'4'})
CREATE (:Constituency {name:'Kildare South', population:'115,350', seats:'3'})
CREATE (:Constituency {name:'Laois', population:'87,745', seats:'3'})
CREATE (:Constituency {name:'Limerick City', population:'113,835', seats:'4'})
CREATE (:Constituency {name:'Limerick County', population:'83,834', seats:'3'})
CREATE (:Constituency {name:'Longford Westmeath', population:'116,802', seats:'4'})
CREATE (:Constituency {name:'Louth', population:'143,272', seats:'5'})
CREATE (:Constituency {name:'Mayo', population:'120,332', seats:'4'})
CREATE (:Constituency {name:'Meath East' , population:'86,572', seats:'3'})
CREATE (:Constituency {name:'Meath West', population:'85,550', seats:'3'})
CREATE (:Constituency {name:'Offaly', population:'87,640', seats:'3'})
CREATE (:Constituency {name:'Roscommon Galway', population:'84,586', seats:'3'})
CREATE (:Constituency {name:'SligoLeitrim', population:'119,153', seats:'4'})
CREATE (:Constituency {name:'Tipperary', population:'147,801', seats:'5'})
CREATE (:Constituency {name:'Waterford', population:'113,795', seats:'4'})
CREATE (:Constituency {name:'Wexford', population:'145,320', seats:'5'})
CREATE (:Constituency {name:'Wicklow', population:'141,012', seats:'5'})

##################################  Parties  ########################################

					Queries to create Parties

CREATE (:Party {name: 'Fine Gael'}) 
CREATE (:Party {name: 'Labour'}) 
CREATE (:Party {name: 'Fianna Fail'}) 
CREATE (:Party {name: 'Sinn Fein'}) 
CREATE (:Party {name: 'Anti Austerity'}) 
CREATE (:Party {name: 'Renua Ireland'}) 
CREATE (:Party {name: 'Social Democrats'}) 
CREATE (:Party {name: 'WUAG'}) 
CREATE (:Party {name: 'Independents'}) 

CREATE (:Party {name: 'Green Party'}) 
CREATE (:Party {name: 'Irish Democratic Party'}) 
CREATE (:Party {name: 'Workers Party'}) 
CREATE (:Party {name: 'Direct Democracy'}) 
CREATE (:Party {name: 'Peoples Convention'}) 
CREATE (:Party {name: 'Communist Party'}) 
CREATE (:Party {name: 'Fis Nua'}) 
CREATE (:Party {name: 'Catholic Democrats'}) 

#######################  People + IS_IN PARTY + RAN_IN  ##################################################

----SAMPLE TO CREATE A PERSON AND CREATE A RELATIONSHIP OF IS_IN SOME PARTY + WHERE THEY RAN_IN
	WILL USE THIS AS TEMPLATE FOR THE REST OF CANDIDATES---------------

CREATE (:Person {name: 'Michael ODonnell'}) --- CREATE a Person

Match (n:Person), (p:Party)
where n.name = 'Seamus MacDonagh' and p.name = 'Independents'
OPTIONAL MATCH (c:Constituency {name: 'Meath East'})
CREATE n-[:IS_IN]->p
CREATE n-[:RAN_IN]->c ---- matches a person,party and constituency, adds both relationships to a person :IS_IN + :RAN_IN

match (n:Person) where n.name = 'Mike Durkan'
Optional match (n:Person)-[:IS_IN]->(p:Party)
return n,p   ---- matches a person and shows the party the person is in

----------Check for nodes who are not in a party---------

MATCH (Person) 
WHERE NOT (Person)-[:IS_IN]-()
RETURN Person ---- error checking query to see if there are people outstanding who are not in a party

##################  match person , party , constituency  #############################

MATCH (n:Person {name: 'Michael ODonnell'})
OPTIONAL MATCH (p:Party {name: 'Communist Party'})
OPTIONAL MATCH (c:Constituency {name: 'Cork North West'})
RETURN n,p,c  ---- matches person,party,constituency and displays them

MATCH (p:Party {name: 'Fis Nua'})
OPTIONAL MATCH (n:Person)-[:IS_IN]->(p:Party)
OPTIONAL MATCH (n:Person)-[:RAN_IN]->(c:Constituency)
RETURN n,p,c ---- matches a party and shows people who are in it and what constituencies they ran in