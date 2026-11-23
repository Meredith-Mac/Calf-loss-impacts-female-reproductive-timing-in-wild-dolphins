# MacQueeney, M., McEntee, M.H.F., Foroughirad, V., Jacobs, E., and Mann, J. 2026. Calf loss impacts female reproductive timing in wild dolphins. Behavioral Ecology.

#### Meredith MacQueeney (corresponding author) - mem505@georgetown.edu
#### Molly H.F. McEntee - mhm95@georgetown.edu
#### Vivienne Foroughirad - vforough@tamug.edu
#### Ellen Jacobs - erj22@georgetown.edu
#### Janet Mann - mannj2@georgetown.edu

### Abstract
Offspring mortality is a major cost to females, particularly in species with slow life histories and extensive maternal investment in each offspring. Females may face compounding costs if offspring loss preweaning alters reproductive timing. In this study, we used long-term demographic data on Indo-Pacific bottlenose dolphins (Tursiops aduncus) in Shark Bay, Australia to determine how calf loss impacts subsequent reproduction. We found that the interval from calf death to the mother’s next birth increased with calf age at death, reflecting her cumulative investment. Every month of investment in the calf that died reduced the mother’s likelihood of subsequent reproduction by 6% (Hazards Ratio, HR = 0.94).  We found a strong, time-dependent effect of season; for the first two months after calf loss, females whose calf died during the birthing season were much more likely to conceive (HR = 4.01). After this two-month window, however, the pattern was reversed and females whose calf died during the birthing season are less likely to conceive (HR = 0.13). Additionally, females whose calves successfully weaned were 3.8 times more likely to calve in-season than females whose calves died preweaning. Together, these results reveal two additional costs of calf mortality associated with interruption of successful birth spacing patterns. These costs contextualize variation in birth seasonality and female reproductive success within and between bottlenose dolphin populations. Understanding these costs will improve research on life history tradeoffs, and support more accurate predictions of population stability and growth in delphinids.

#### Data collected by members of the [Shark Bay Dolphin Research Project](https://www.monkeymiadolphins.org/) from 1884-2025 in Shark Bay, Australia (Gathaagudu, Malgana Country).

#### This work is licensed under a [Creative Commons Attribution 4.0 International License][cc-by].

[cc-by]: http://creativecommons.org/licenses/by/4.0/

#### All data curation and analysis was performed using R version 4.5.2

  <br />

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

### Code/software

#### File: calf-loss-code.R

Code to reproduce all models and figures in R.

###
