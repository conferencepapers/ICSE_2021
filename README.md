# Structure of our replication package ICSE_2021

```
.
├── 1.codebook
│   ├── 0.Codebook_with_Examples.pdf
│   ├── 1.day1-2_observation.pdf
│   ├── 2.technical_activities_onboarding.pdf
│   ├── 3.onboarding_emerging_codes_irr.pdf
│   └── 4.think_aloud_protocol.pdf
├── 2.irr-iterations
│   ├── 1.qualitative-codes-08-May-initial-classified-codes.csv
│   ├── 2.irr_onboarding.csv
│   ├── 3.irr_first-iteration_with_kappa_51_pct.csv
│   ├── 4.irr_second-iteration_with_kappa_55_pct.csv
│   ├── 5.irr_third-iteration_with_kappa_62.6_pct.csv
│   └── 6.irr_fourth-iteration_with_kappa_100_pct.csv
├── 3.affinity_digrams_iterations
│   ├── 1.affinity_first_iteration.pdf
│   ├── 2.affinity_2nd_and_3rd_iteration.pdf
│   └── 3.affinity_final_iteration.pdf
├── 4.dataset
│   ├── 1.Affiliation12.csv
│   ├── 2.commit_proportion12.csv
│   ├── 3.commit_proportion23.csv
│   ├── 4.company_commits.csv
│   ├── 6.Effort12.csv
│   ├── 7.Efforts.csv
│   ├── 8.SZZ.csv
│   ├── 9.Technical_diversity.csv
│   └── 10.top10_analysis.csv
├── 5.scripts
│   ├── 11.onboarding.html
│   ├── 12.Statistical_testing.html
│   ├── 13.survival_analysis.R
│   ├── 14.survival_longivity.R
│   ├── 15.bug_inducing_commits.py
│   ├── 16.generate_openstack_gitmodules.py
│   ├── 17.get_openstack_projects.py
│   ├── 18.getting_the_bugInducingCommits.py
│   ├── 19.irr.R
│   ├── 20.multiplot.py
│   └── 21.radar.py
├── CD_commits.pdf
├── LICENSE
├── README.md
├── Replication_Package.zip
├── Table1_Metrics.pdf
└── seating_arrangement.pdf
```
![alt text](https://github.com/foundjem/conferencepapers/ICSE_2021/blob/master/timeline.pdf?raw=true)


## Qualitative Study
### STEP 1.
  The '1.codebook': folder contains the codebook (0.), the transcribed texts (1.), the technical detail
  activities(2.), and the codes that emerges as both raters did the qualitative coding (3.) for both day-1/2 of the observational study at Berlin.
The codebook (0.) is the final result of a series of negotiated
  agreement with all the coders in this research. The commonly agreed
  themes appears as subheadings. However, we will upload the final version soon.
  
  
### STEP 2.
  - The '2.irr-iterations': Contains the structure of our
 qualitative code, derived from the negotiated agreement  after the authors have agreed on the common themes  to use in the codebook, and the four iterations to obtain our reported
 IRR.
 
 ####  1.qualitative-codes-08-May-initial-classified-codes:
 - The column "A" ; Codes,  they will use an indication either E or A or nothing else.
- The Codes represent the themes that both authors 1/2 found independently, and if both authors agree on a code under a particular category that appears on the top, such as training material, etc .
 
 #### 2.irr_onboarding.csv :
 We organized our codes under three categories such as H1, H2,  and H3. Then, the various section from the codebook from where we labeled a/the particular text  are indicated as TESTIMONY1, ..., OVERVIEW2r2. Then the score or 0|1 indicate that both author either have perfect agreement on that code; in that case [1|1] is used, of [1\0], [0\1]; if only one author agrees, or [0|0] if none agreement, then we calculate the IRR using our script found in "5.scripts/irr.R". Then we repeate the process until we reach 100\% of IRR
 
### STEP 3. 
  The '3.affinity_diagram_iterations' file contains the affinity diagrams we used in this study, including all the number of iterations we did at each round of the three
 iterations. 
 - "1.affinity_first_iteration.pdf": shows how we grouped the "low-level" themes that are extracted from the text into high-level code that can represent one or more concepts. We do this activity for the rest of the codes/themes/text until we cover all our commonly agreed themes/codes.
 
 -  Next, "2.affinity_2nd_and_3rd_iteration.pdf" shows  the second and third rounds of iteration that we did re-arranging the low-level and high-level code  and building more higher-level themes by abstracting common themes. Finally, "3.affinity_final_iteration.pdf" we reach three main themes that we used in the paper to categorize onboarding experience.
 
## Quantitative Study
- We provide the dataset  "4.dataset" that we  used in analyzing the new contributors activities at OpenStack.
### STEP 4. 
-0 In each file, we compute different metric and compare the different studied categories (Cat-1, Cat-2, and Cat-3). The event column is the particular release cycle that we are looking at.

### STEP 5. 
We run our scripts on the datasets to analyze the activities on interests. We have two Jupyter python notebooks that we downloaded as HTML files (11.onboarding.html -- measured activities  and 12.Statistical_testing.html -- the statistical tests) for simplicity.

- both the survival analysis curves were done in R ("13.survival_analysis.R" and "14.survival_longivity.R")



## External Resources

### URL that we consulted to extract useful information for this study

###  links to resources at OpenStack onboarding
-------
```
@ONLINE{osf-ref,
author = {OpenStack-Foundation},
title = {Links to the OpenStack Foundation ecosystem documentations (release managed projects and services)},
month = "August",
year = {2020},
```
## Various OpenStack resources and links


- [OpenStack Foundation] (https://www.openstack.org) 
- [How to contribute to OpenStack, new contributors] https://wiki.openstack.org/wiki/How_To_Contribute#Contributors_License_Agreement,
- [OpenStack governance and Contributors' policies] https://wiki.openstack.org/wiki/GovernmentCLA,
- [Documentation on project teams] https://docs.openstack.org/project-team-guide/introduction.html,
- [The OpenStack onboarding Institute] https://wiki.openstack.org/wiki/OpenStack_Upstream_Institute_Occasions,
- [Onboarding training materials] https://etherpad.openstack.org/p/upstream-training-exercises,
- [Communication medium] https://docs.openstack.org/project-team-guide/open-community.html#project-irc-channels, 
- [The OpenStack Queen Release] https://releases.openstack.org/queens/index.html, 
- [Various OpenStack project teams] http://git.openstack.org/cgit/openstack/governance/tree/reference/projects.yaml,
- [SECO-level issues tracker] https://storyboard.openstack.org/#!/page/about,
- [Project-level issues tracker] https://launchpad.net/openstack,
- [OpenStack git repository] https://review.opendev.org/#/dashboard/self,
- [Making firat contacts with OpenStack] https://wiki.openstack.org/wiki/First_Contact_SIG},


```
### last update = {2020-08-28}
```
}
