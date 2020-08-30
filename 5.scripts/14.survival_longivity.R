########### Load  LIBRARIES ############## ########  ##############
for (package in c('ggplot2', 'dplyr', 'survival','survminer','reshape2','Hmisc','lattice','Formula','gridExtra')) {
  if (!require(package, character.only=T, quietly=T)) {
    install.packages(package)
    library(package, character.only=T)
  }
}


########### ##############  ############## ###  ########  ######
############                 DATA SET        #### ##############  
########### ##############  ############## ###  ########  ######
dfcat1 <- read.csv("~/research/scripts/onboarding/onboarding_notebook/category_1.csv", stringsAsFactors=TRUE)
dfcat2 <- read.csv("~/research/scripts/onboarding/onboarding_notebook/category_2.csv", stringsAsFactors=TRUE)
dfcat3 <- read.csv("~/research/scripts/onboarding/onboarding_notebook/category_3.csv", stringsAsFactors=TRUE)


########### ##############  ############## ###  ########  ######

# Fit survival curves CAT1
fit1 <- survfit(Surv(dfcat1$Longivity, dfcat1$Active_bin) ~ dfcat1$Gender, data = dfcat1)
summary(fit1)
# Fit survival curves CAT2
fit2 <- survfit(Surv(dfcat2$Longivity, dfcat2$Active_bin) ~ dfcat2$Gender, data = dfcat2)
summary(fit2)
# Fit survival curves CAT3
fit3 <- survfit(Surv(dfcat3$Longivity, dfcat3$Active_bin) ~ dfcat3$Gender, data = dfcat3)
summary(fit3)




#### Change x axis limits (xlim) #++++++++++++++++++++++++++++++++++++
# One would like to cut axes at a specific time point
surv1 <- ggsurvplot(fit1, 
                    data = dfcat1, 
                    censor.shape="@", 
                    censor.size = 1, 
                    pval = TRUE, 
                    conf.int = FALSE,
                    
                    #risk.table = FALSE, # Add risk table
                    #risk.table.col = "strata", # Change risk table color by groups
                    #risk.table.y.text.col = T, # colour risk table text annotations.
                    #risk.table.y.text = TRUE, # show bars instead of names in text annotations
                    # in legend of risk table
                    
                    xlim = c(0, 1500), 
                    xlab= "Time in Days", 
                    ylab="Probability of Survival",
                    break.time.by = 500,     # break X axis in time intervals by 500.
                    
                    palette = c("#ff0000",  # Red
                                #"#00ff00",  # Green
                                "#0000ff",  # Blue
                                #"#eeeeee",  # White OR #b47129 (Brown) OR Grey (#c9c8c8)
                                "#000000"  # Black
                                #"#f97300",  # Orange OR #f6b500
                                #"#7129b4"   # Purple
                    ), 
                    legend.labs =
                      c("Female",
                        #"Diablo11",
                        #"Essex12",
                        #"Folsom12",
                        #"Grizzly13",
                        "Male",
                        "Neutral"
                      ),  # Change legend labels
                    #ggtheme = theme_light(), # customize plot and risk table with a theme.
                    
                    
                    ### Active_bin Table
                    #ncensor.plot = TRUE,      # plot the number of Active_bin subjects at time t
                    #ncensor.plot.height = 0.25,
                    conf.int.style = "ribbon",  # customize style of confidence intervals
                    surv.median.line = "hv",  # add the median survival pointer.
                    ggtheme = theme_bw() + theme(panel.border = element_blank(), panel.grid.major = element_blank(),
                                                 panel.grid.minor = element_blank(), axis.line = element_line(colour = "black")) # Change ggplot2 theme
)
#######

surv1$table <- surv1$table + theme(axis.line = element_blank())
surv1$plot <- surv1$plot + labs(title = "CAT-I Retention/Abandoning")
print(surv1)
##+++++++++++++++++++++++++ Survival Analysis +++++++++++++++++++++++##

#ggsave("~/research/scripts/onboarding/onboarding_notebook/survival-cat1.pdf")


#############################################################################
#######################      CAT2                 ##########################
#############################################################################
surv2 <- ggsurvplot(fit2, 
                    data = dfcat2, 
                    censor.shape="@", 
                    censor.size = 1, 
                    pval = TRUE, 
                    conf.int = FALSE,
                    
                    risk.table = FALSE, # Add risk table
                    #risk.table.col = "strata", # Change risk table color by groups
                    #risk.table.y.text.col = T, # colour risk table text annotations.
                    #risk.table.y.text = FALSE, # show bars instead of names in text annotations
                    # in legend of risk table
                    
                    xlim = c(0, 1500), 
                    xlab= "Time in Days", 
                    ylab="Probability of Survival",
                    break.time.by = 500,     # break X axis in time intervals by 500.
                    
                    palette = c("#ff0000",  # Red
                                #"#00ff00",  # Green
                                "#0000ff",  # Blue
                                #"#eeeeee",  # White OR #b47129 (Brown) OR Grey (#c9c8c8)
                                "#000000"  # Black
                                #"#f97300",  # Orange OR #f6b500
                                #"#7129b4"   # Purple
                    ), 
                    #ggtheme = theme_light(), # customize plot and risk table with a theme.
                    legend.labs =
                      c("Female",
                        #"Diablo11",
                        #"Essex12",
                        #"Folsom12",
                        #"Grizzly13",
                        "Male",
                        "Neutral"
                      ),  # Change legend labels
                    # ggtheme = theme_light(), # customize plot and risk table with a theme.
                    
                    
                    ### Active_bin Table
                    ncensor.plot = FALSE,      # plot the number of Active_bin subjects at time t
                    #ncensor.plot.height = 0.25,
                    conf.int.style = "ribbon",  # customize style of confidence intervals
                    surv.median.line = "hv",  # add the median survival pointer.
                    ggtheme = theme_bw() + theme(panel.border = element_blank(), panel.grid.major = element_blank(),
                                                 panel.grid.minor = element_blank(), axis.line = element_line(colour = "black"))      # Change ggplot2 theme
)
#######

surv2$table <- surv2$table + theme(axis.line = element_blank())
surv2$plot <- surv2$plot + labs(title = "CAT-II Retention/Abandoning")
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
                    censor.size = 1, 
                    pval = TRUE, 
                    conf.int = FALSE,
                    
                    risk.table = FALSE, # Add risk table
                    #risk.table.col = "strata", # Change risk table color by groups
                    #risk.table.y.text.col = T, # colour risk table text annotations.
                    #risk.table.y.text = FALSE, # show bars instead of names in text annotations
                    # in legend of risk table
                    
                    xlim = c(0, 1500), 
                    xlab= "Time in Days", 
                    ylab="Probability of Survival",
                    break.time.by = 500,     # break X axis in time intervals by 500.
                    
                    palette = c("#ff0000",  # Red
                                #"#00ff00",  # Green
                                "#0000ff",  # Blue
                                #"#eeeeee",  # White OR #b47129 (Brown) OR Grey (#c9c8c8)
                                "#000000"  # Black
                                #"#f97300",  # Orange OR #f6b500
                                #"#7129b4"   # Purple
                    ), 
                    #ggtheme = theme_light(), # customize plot and risk table with a theme.
                    legend.labs =
                      c("Female",
                        "Male",
                        "Neutral"
                      ),  # Change legend labels
    
                    ### Active_bin Table
                    ncensor.plot = FALSE,      # plot the number of Active_bin subjects at time t
                    #ncensor.plot.height = 0.25,
                    conf.int.style = "ribbon",  # customize style of confidence intervals
                    surv.median.line = "hv",  # add the median survival pointer.
                    ggtheme = theme_bw() + theme(panel.border = element_blank(), panel.grid.major = element_blank(),
                                                 panel.grid.minor = element_blank(), axis.line = element_line(colour = "black"))      # Change ggplot2 theme
)
#######

surv3$table <- surv3$table + theme(axis.line = element_blank())
surv3$plot <- surv3$plot + labs(title = "CAT-III Retention/Abandoning")
print(surv3)
####################################################################
#----------------------------------------------------------------------------------------#
#ggsave(filename = "~/research/scripts/onboarding/onboarding_notebook/survival-cat3.pdf")
#----------------------------------------------------------------------------------------#