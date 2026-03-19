library(coxme)
library(survminer)
library(glmmTMB)
library(DHARMa)


DeathBirthIntervals <- read.csv("DeathBirthIntervals.csv")

CalfSurvivalOutcomes <- read.csv("CalfSurvivalOutcomes.csv")

# modelling---------------------------------------------------------------------

# Effect of calf age at death, mother age, and season on mother’s death-birth interval 
calf.loss <- coxme(formula = Surv(TimeToEvent, EventCensored) ~ CalfAgeDeathMon + MomAgeBirthYrs + Season + (1|MotherID), data = DeathBirthIntervals)

print(calf.loss)

# check proportional hazards assumption (assumption fails for season)
prophaztest <- cox.zph(calf.loss)

print(prophaztest)

# visualize effect of season over time
seasonhazplot <- plot(prophaztest[3], lwd = 2) +
  abline(0, 0, col = 1, lty = 3, lwd = 2) +
  abline(
    h = calf.loss$coef[3],
    col = 3,
    lwd = 2,
    lty = 2
  )

# reformat data to add time-varying covariate (tgroup) representing the corresponding time period for separate step-function coefficient
loss.split <- survSplit(Surv(TimeToEvent, EventCensored) ~ ., 
                        data= DeathBirthIntervals, cut=c(14),
                        episode= "tgroup", id="Index.ID")   

# SELECTED MODEL
# model with each time-period stratum separately for the season variable
calf.loss.season.split <- coxme(Surv(TimeToEvent, EventCensored) ~ CalfAgeDeathMon + MomAgeBirthYrs + Season*strata(tgroup) + (1|MotherID), data = loss.split)

print(calf.loss.season.split)

# check proportional hazards assumption for the new model (all non-significant)
loss.split.prop.haz <- cox.zph(calf.loss.season.split)

print(loss.split.prop.haz)

# Effect of calf loss on seasonality of subsequent birth
SeasonModel <- glmmTMB(Season ~ IndexOutcome + MomAgeBirthYrs + (1|MotherID),
                       ziformula=~0,
                       family = binomial,
                       data = CalfSurvivalOutcomes)


summary(SeasonModel)

testDispersion(SeasonModel)

simulationOutput <- simulateResiduals(fittedModel = SeasonModel, plot = F)

plot(simulationOutput)

# data visualization------------------------------------------------------------
# Kaplan-Meier plot for effect of calf age at death

AgePlot <- ggsurvplot(
  surv_fit(Surv(TimeToEvent, EventCensored) ~ CalfAgeDeathCategories,
           data = DeathBirthIntervals),
  fun = "event",
  linewidth = 1.5,
  censor.size = 6,
  axes.offset = TRUE,
  ggtheme = ggplot2::theme_classic(),
  palette = c("hue"), 
  break.time.by = 12,
  xlab = "Time (months)",
  ylab = "Completion probability",
  font.main = c(12, "plain", "black"),
  font.x = c(12, "plain", "black"),
  font.y = c(12, "plain", "black"),
  font.tickslab = c(10, "plain", "black"),
  legend = c(0.8, 0.3),
  legend.title = "Calf age at death:",
  legend.labs = c("newborn", "young-of-year", "yearling"),
  font.legend = c(12, "plain", "black")
)

print(AgePlot)

PlotAge <- AgePlot$plot

# # Kaplan-Meier plot for effect of season

SeasonPlot <- ggsurvplot(
  surv_fit(Surv(TimeToEvent, EventCensored) ~ Season,
           data = DeathBirthIntervals),
  fun = "event",
  linewidth = 1.5,
  censor.size = 6,
  axes.offset = TRUE,
  ggtheme = ggplot2::theme_classic(),
  palette = "hue",
  break.time.by = 12,
  xlab = "Time (months)",
  ylab = "Completion probability",
  font.main = c(12, "plain", "black"),
  font.x = c(12, "plain", "black"),
  font.y = c(12, "plain", "black"),
  font.tickslab = c(10, "plain", "black"),
  legend = c(0.8, 0.3),
  legend.title = "Calf death timing:",
  legend.labs = c("out of season", "in season"),
  font.legend = c(12, "plain", "black")
)

print(SeasonPlot)

PlotSeason <- SeasonPlot$plot 

# save plots--------------------------------------------------------------------

# save age plot
ggsave(
  "AgePlot.jpeg",
  PlotAge,
  width = (129),
  height = (75),
  units = c("mm"),
  device = "jpeg",
  dpi = 1200
)

# save season plot
ggsave(
  "SeasonPlot.jpeg",
  PlotSeason,
  width = (129),
  height = (75),
  units = c("mm"),
  device = "jpeg",
  dpi = 1200
)


