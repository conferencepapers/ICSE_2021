for (package in c('ggplot2', 'dplyr', 'survival','survminer','ranger','ggfortify','reshape2','Hmisc','lattice','Formula','gridExtra')) {
  if (!require(package, character.only=T, quietly=T)) {
    install.packages(package)
    library(package, character.only=T)
  }
}
########### ##############  ############## ###  ########  ######
############                 DATA SET        #### ##############  
########### ##############  ############## ###  ########  ######
########### ##############  ############## ###  ########  ###### ########  ######
dfcat1 <- read.csv("~/research/scripts/onboarding/dataset_onboarding/category_1.csv", stringsAsFactors=TRUE)
dfcat2 <- read.csv("~/research/scripts/onboarding/dataset_onboarding/category_2.csv", stringsAsFactors=TRUE)
dfcat3 <- read.csv("~/research/scripts/onboarding/dataset_onboarding/category_3.csv", stringsAsFactors=TRUE)

########### ##############  ############## ###  ########  ######



# Fit survival curves CAT1
fit1 <- survfit(Surv(dfcat1$Time2Commit, dfcat1$Censored) ~ dfcat1$Gender, data = dfcat1)
summary(fit1)
# Fit survival curves CAT2
fit2 <- survfit(Surv(dfcat2$Time2Commit, dfcat2$Censored) ~ dfcat2$Gender, data = dfcat2)
summary(fit2)
# Fit survival curves CAT3
fit3 <- survfit(Surv(dfcat3$Time2Commit, dfcat3$Censored) ~ dfcat3$Gender, data = dfcat3)
summary(fit3)



#### Change x axis limits (xlim) #++++++++++++++++++++++++++++++++++++
# One would like to cut axes at a specific time point
surv1 <- ggsurvplot(fit1, 
           data = dfcat1, 
           censor.shape="@", 
           censor.size = 2, 
           pval = TRUE, pval.coord = c(250, 0.75),
           #conf.int = TRUE,
           
           risk.table = FALSE, # Add risk table
           risk.table.col = "strata", # Change risk table color by groups
           risk.table.y.text.col = T, # colour risk table text annotations.
           risk.table.y.text = TRUE, # show bars instead of names in text annotations
           # in legend of risk table
           
           xlim = c(0, 600), 
           xlab= "Time in Days", 
           ylab="Probability of Survival",
           font.x = c(16, "plain", "black"), 
           font.y = c(16, "plain", "black"), 
           font.tickslab = c(14, "plain", "black"),
           font.legend = c(12, "plain", "black"),
           legend.title = "",
           #legend = c(0.25, 0.5),
           
           break.time.by = 100,     # break X axis in time intervals by 500.
           
           palette = c("#ff0000",  # Red
                       #"#00ff00",  # Green
                       "#0000ff",  # Blue
                       #"#eeeeee",  # White OR #b47129 (Brown) OR Grey (#c9c8c8)
                       "#000000"  # Black
                       #"#f97300",  # Orange OR #f6b500
                       #"#7129b4"   # Purple
                      ), 
           legend.labs =
             c("F",
               "M",
               "N"
             ),  # Change legend labels
           #ggtheme = theme_light(), # customize plot and risk table with a theme.
           
           
### Censored Table
          ncensor.plot = FALSE,      # plot the number of censored subjects at time t
          #ncensor.plot.height = 0.25,
          #conf.int.style = "step",  # customize style of confidence intervals
          surv.median.line = "hv",  # add the median survival pointer.
ggtheme = theme_bw() + theme(panel.border = element_blank(), panel.grid.major = element_blank(),
                             panel.grid.minor = element_blank(), axis.line = element_line(colour = "black")) # Change ggplot2 theme
)
#######

surv1$table <- surv1$table + theme(axis.line = element_blank())
surv1$plot <- surv1$plot + labs(title = "CAT-I Towards First Commit")
print(surv1)
##+++++++++++++++++++++++++ Survival Analysis +++++++++++++++++++++++##

#ggsave("~/research/scripts/onboarding/onboarding_notebook/survival-cat1.pdf")


#############################################################################
#######################      CAT2                 ##########################
#############################################################################
surv2 <- ggsurvplot(fit2, 
                  data = dfcat2, 
                  censor.shape="@", 
                  censor.size = 2, 
                  pval = TRUE, pval.coord = c(200, 0.75),
                  conf.int = FALSE,
                  
                  risk.table = FALSE, # Add risk table
                  #risk.table.col = "strata", # Change risk table color by groups
                  #risk.table.y.text.col = T, # colour risk table text annotations.
                  #risk.table.y.text = FALSE, # show bars instead of names in text annotations
                  # in legend of risk table
                  
                  xlim = c(0, 600), 
                  xlab= "Time in Days", 
                  ylab="Probability of Survival",
                  font.x = c(16, "plain", "black"), 
                  font.y = c(16, "plain", "black"), 
                  font.tickslab = c(14, "plain", "black"),
                  font.legend = c(12, "plain", "black"),
                  legend.title = "",
                  #legend = c(0.25, 0.5),
                  
                  break.time.by = 100,     # break X axis in time intervals by 500.
                  
                  palette = c("#ff0000",  # Red
                              "#0000ff",  # Blue
                              "#000000"  # Black
                  ), 
                  #ggtheme = theme_light(), # customize plot and risk table with a theme.
                  legend.labs =
                    c("F",
                      "M",
                      "N"
                    ),  # Change legend labels
                  ### Censored Table
                  ncensor.plot = FALSE,      # plot the number of censored subjects at time t
                  #ncensor.plot.height = 0.25,
                  #conf.int.style = "step",  # customize style of confidence intervals
                  surv.median.line = "hv",  # add the median survival pointer.
                  ggtheme = theme_bw() + theme(panel.border = element_blank(), panel.grid.major = element_blank(),
                                               panel.grid.minor = element_blank(), axis.line = element_line(colour = "black"))      # Change ggplot2 theme
)
#######

surv2$table <- surv2$table + theme(axis.line = element_blank())
surv2$plot <- surv2$plot + labs(title = "CAT-II Towards First Commit")
print(surv2)
####################################################################
#----------------------------------------------------------------------------------------#
#ggsave(filename = "~/research/scripts/onboarding/onboarding_notebook/survival-cat2.pdf")
#----------------------------------------------------------------------------------------#




#############################################################################
#########  CAT 3
#############################################################################

surv3 <- ggsurvplot(fit3, 
                    data = dfcat3, 
                    censor.shape="@", 
                    censor.size = 2, 
                    pval = TRUE, pval.coord = c(200, 0.75),
                    conf.int = FALSE,
                    
                    risk.table = FALSE, # Add risk table
                    #risk.table.col = "strata", # Change risk table color by groups
                    #risk.table.y.text.col = T, # colour risk table text annotations.
                    #risk.table.y.text = FALSE, # show bars instead of names in text annotations
                    # in legend of risk table
                    
                    xlim = c(0, 600), 
                    xlab= "Time in Days", 
                    ylab="Probability of Survival",
                    font.x = c(16, "plain", "black"), 
                    font.y = c(16, "plain", "black"), 
                    font.tickslab = c(14, "plain", "black"),
                    font.legend = c(12, "plain", "black"),
                    legend.title = "",
                    #legend = c(0.25, 0.5),
                    
                    break.time.by = 100,     # break X axis in time intervals by 500.
                    
                    palette = c("#ff0000",  # Red
                                "#0000ff",  # Blue
                                "#000000"  # Black
                    ), 
                    #ggtheme = theme_light(), # customize plot and risk table with a theme.
                    legend.labs =
                      c("F",
                        "M",
                        "N"
                      ),  # Change legend labels
                    # ggtheme = theme_light(), # customize plot and risk table with a theme.
                    
                    
                    ### Censored Table
                    ncensor.plot = FALSE,      # plot the number of censored subjects at time t
                    #ncensor.plot.height = 0.25,
                    #conf.int.style = "step",  # customize style of confidence intervals
                    surv.median.line = "hv",  # add the median survival pointer.
                    ggtheme = theme_bw() + theme(panel.border = element_blank(), panel.grid.major = element_blank(),
                                                 panel.grid.minor = element_blank(), axis.line = element_line(colour = "black"))      # Change ggplot2 theme
)
#######

surv3$table <- surv3$table + theme(axis.line = element_blank())
surv3$plot <- surv3$plot + labs(title = "CAT-III Towards First Commit")
print(surv3)
####################################################################
#----------------------------------------------------------------------------------------#
#ggsave(filename = "~/research/scripts/onboarding/onboarding_notebook/survival-cat3.pdf")
#----------------------------------------------------------------------------------------#