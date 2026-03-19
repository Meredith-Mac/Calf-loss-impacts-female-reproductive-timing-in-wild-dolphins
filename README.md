# Calf loss impacts female reproductive timing in wild dolphins.

### Files and variables

#### File: DeathBirthIntervals.csv

**Description:** Intervals from index calf death to next birth (event) or censorship.

##### Variables

* IndexCalfID = individual calf ID for the index calf (the one opening the interval, who died)
* MotherID = individual mother ID
* NextCalfID = individual calf ID for the subsequent calf (the one closing the interval). "NA" if no subsequent reproductive event.
* CalfAgeDeathMon = index calf age at death in months
* Season = index calf death date "in season", 1, when it occurred September-January; "out of season", 0, when it occurred from February-August
* MomAgeBirthYrs = mother age at the birth of the index calf in years
* EventCensored = mothers who had a subsequent calf following the death of the index calf are "event", 1; mothers who did not have a subsequent reproductive event are "censored", 0
* TimeToEvent = Interval from index calf death to subsequent calf birth, or to censorship in months 
* CalfAgeDeathCategories = index calf age at death category. a.Calf.under.2mo = "newborn", b.Calf.2mo.to.1y = "young-of-year", c.Calf.1y.to.2y = "yearling" 

#### File: CalfSurvivalOutcomes.csv

**Description:** Reproductive histories females with completed intervals where index calf survival status is known (weaned or died preweaning)

##### Variables

* IndexCalfID = individual calf ID for the index calf (the one opening the interval)
* MotherID = individual mother ID 
* NextCalfID = individual calf ID for the subsequent calf (the one closing the interval)
* MomAgeBirthYrs = mother age at the birth of the subsequent calf in years
* IndexOutcome = survival outcome of the index calf (weaned or died preweaning)
* Season = subsequent calf birth date "in season", 1, when it occurred September-January; "out of season", 0, when it occurred from February-August

  <br />

## Code/software

#### File: calf-loss-code.R

Code to reproduce all models and figures in R.

###
