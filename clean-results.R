## Original script by Charlotte McClintock
## Summer 2018
## Modifications by Stephen Gardner (@Stephen on datafordemocracy.slack.com)
## 2018-08-19 
## Script to clean and factor elections data

# ..................................................................................................

# set up: wd, retrieve data
getwd()
# if need be 
setwd("Louisiana/data")

# set up: libraries
library(dplyr)


# ..................................................................................................

# 1. ALL ELECTED OFFICES 

# read in the data
larc <- read_csv("~/R/Projects/Louisiana/data/la-results-clean.csv")

# coerce to factor class
> larc <- mutate(larc,
					 position = as.factor(position),
					 district = as.factor(district),
					 candidate = as.factor(candidate),
					 parish = as.factor(parish), party = as.factor(party))

# add some potentially interesting useful categories

# level of government
larc <- mutate(larc,
					level=fct_recode(position, 
										  Federal = "U. S. Senator",
										  Federal = "U. S. Representative", 
										  Federal = "Presidential Electors", 
										  State = "Associate Justice", 
										  State = "PSC", 
										  State = "Judge, Court of Appeal", 
										  Local = "District Judge", 
										  Local = "Judge", 
										  Local = "District Attorney", 
										  Local = "Judge, Family Court", 
										  Local = "Assessor", 
										  Local = "Coroner" , 
										  Local = "Parish President" , 
										  Local = "Mayor" , 
										  Local = "Mayor-President" , 
										  Local = "Councilman at Large" , 
										  Local = "Police Juror" , 
										  Local = "Council Member", 
										  Local = "Councilman", 
										  Local = "Member of Parish Council", 
										  Local = "Council Member at Large", 
										  Local = "City Judge", 
										  Local = "City Judge, City Court", 
										  Local = "City Marshal", 
										  Local = "Constable", 
										  Local = "Member of School Board", 
										  Local = "Member(s) of School Board", 
										  Local = "Justice of the Peace", 
										  Local = "Justice(s) of the Peace", 
										  Local = "Constable(s)", 
										  Local = "Chief of Police", 
										  Local = "Marshal", 
										  Local = "Alderman at Large", 
										  Local = "Aldermen at Large", 
										  Local = "Councilmen at Large", 
										  Local = "Council Member(s) at Large", 
										  Local = "Alderman", 
										  Local = "Aldermen", 
										  Local = "Selectman", 
										  Local = "Council Member(s)", 
										  Local = "Council Members", 
										  Local = "Councilmen" ))

> levels(larc$level)

# type of office
> larc <- mutate(larc,
					   type=fct_recode(position,
										   "Law Enforcement" = "Chief of Police", 
										   "Law Enforcement" = "City Marshal", 
										   "Law Enforcement" = "Constable", 
										   "Law Enforcement" = "Constable(s)", 
										   "Law Enforcement" = "Coroner" , 
										   "Law Enforcement" = "Marshal", 
										   "Local Government" = "Alderman at Large", 
										   "Local Government" = "Alderman", 
										   "Local Government" = "Aldermen at Large" ))
										   "Local Government" = "Aldermen", 
										   "Local Government" = "Assessor", 
										   "Local Government" = "Council Member at Large", 
										   "Local Government" = "Council Member", 
										   "Local Government" = "Council Member(s) at Large", 
										   "Local Government" = "Council Member(s)", 
										   "Local Government" = "Council Members", 
										   "Local Government" = "Councilman at Large" , 
										   "Local Government" = "Councilman", 
										   "Local Government" = "Councilmember at Large" , 
										   "Local Government" = "Councilmen at Large", 
										   "Local Government" = "Councilmen", 
										   "Local Government" = "Member of Parish Council", 
										   "Local Government" = "Police Juror" , 
										   "Local Government" = "Selectman", 
										   Education = "Member of School Board", 
										   Education = "Member(s) of School Board",
										   Executive = "Mayor" , 
										   Executive = "Mayor-President" , 
										   Executive = "PSC",
										   Executive = "Parish President" , 
										   Executive = "Presidential Electors",
										   Judicial = "Associate Justice", 
										   Judicial = "City Judge", 
										   Judicial = "City Judge, City Court", 
										   Judicial = "District Attorney", 
										   Judicial = "District Judge", 
										   Judicial = "Judge", 
										   Judicial = "Judge, Court of Appeal", 
										   Judicial = "Judge, Family Court", 
										   Judicial = "Justice of the Peace", 
										   Judicial = "Justice(s) of the Peace",
										   Judicial = "Justice(s) of the Peace", 
										   Legislative = "U. S. Representative", 
										   Legislative = "U. S. Senator")
> levels(larc$type)

# Standardize office names at the level of government
> larc <- mutate(larc,
					genoffice=position,
					genoffice=fct_recode(genoffice,
						 "Alderman" = "Alderman at Large", 
						 "Alderman" = "Aldermen at Large",
						 "Alderman" = "Aldermen", 
						 "Constable" = "Constable(s)", 
						 "Council Member" = "Council Member at Large", 
						 "Council Member" = "Council Member", 
						 "Council Member" = "Council Member(s) at Large", 
						 "Council Member" = "Council Member(s)", 
						 "Council Member" = "Council Members", 
						 "Council Member" = "Councilman at Large" , 
						 "Council Member" = "Councilman", 
						 "Council Member" = "Councilmen at Large", 
						 "Council Member" = "Councilmen", 
						 "Council Member" = "Member of Parish Council", 
						 "Judge" = "Judge, Court of Appeal", 
						 "Judge" = "Judge, Family Court", 
						 "Judge" = "District Judge", 
						 "Judge" =  "City Judge", 
						 "Judge" = "City Judge, City Court",
						 "Justice of the Peace" = "Justice(s) of the Peace",
						 "Marshal" = "City Marshal",
						 "Mayor" = "Mayor-President" , 
						 "Member of School Board" = "Member(s) of School Board"))

# ..................................................................................................

setwd("Louisiana/results analysis")
write.csv(larc, "la-results-clean+coding.csv")