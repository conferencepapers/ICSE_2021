# [Structure of our replication package ICSE_2021](#structure-of-our-replication-package-icse_2021)

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
│   ├── 10.top10_analysis.csv
│   ├── 11.corporate_diversity.csv
│   ├── 2.commit_proportion12.csv
│   ├── 3.commit_proportion23.csv
│   ├── 4.company_commits.csv
│   ├── 6.Effort12.csv
│   ├── 7.Efforts.csv
│   ├── 8.SZZ.csv
│   └── 9.Technical_diversity.csv
├── 5.scripts
│   ├── 0.requirements.txt
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
├── Extended_Abstract.pdf
├── ICSE21_Onboarding.pdf
├── LICENSE
├── README.md
├── REQUIREMENTS.txt
├── Table1_Metrics.pdf
├── seating_arrangement.pdf
└── timeline.pdf
```

# [Files Description](#file-description)
- [Extended_Abstract.pdf](#extended-abstract)
The submited extended Abstract pointing to the replication package.
- [ICSE21_Onboarding.pdf](#publish-paper)
Our accepted paper fr this study at ICSE 2021
## [Open Data](#open-data)
The purpose of this repository is to make avialbale our study materials, how researcher can benefit from our rich and unique set of data relating to software ecosystem onboarding. We do not provid any software that users should install in theor system. More especially, we make our dataset publicly available.

In the Quantitative study (we used the ___Table1_Metrics.pdf___ table to answer our ***RQ1*** (Diversity: we define diversity in broader sense of gender, technical amd coorporate diversity. ***RQ2*** (Productivity: we measure Density, Time ti first commit, retention, and patch acceptance rate). Finally in ***RQ3***, we measure Quality: Effort and SZZ), we use the radar chart below to compare these metrics in RQ1,2 and 3 between Cat-2 vs. Cat-3.

  [Radar Chart](#radar-chart)
  
![radar](https://user-images.githubusercontent.com/66274242/106213440-b08fbd00-619a-11eb-8046-890c0e658229.png)


## Coorporate Diversity
Among the comoanies that contribute source code to OpenStack, we computed how many companies contribute 50% or more of the total commits to the codebase, as shown in ___CD_commits.pdf___.


# [Data Collection And Analysis](#data-collection-and-analysis)

__Our study uses mixed-method research to analyze the onboarding in a complex software ecosystem__ therefore, we first use a qualitative method; observational study of **72** new contributors to _OpenStack_. In this study, we recorded the entire two-days event and transcribed the data.  Researchers can reference the seating arrangement, how mentors and new contributors (mentees) were configured. Moreover, we used a think-aloud protocol to collect a rich set of qualitative data from participants.
![Seating Arrangement](https://user-images.githubusercontent.com/66274242/106158339-9ed5f780-6151-11eb-95bf-5327acd3a160.png)

Then, we apply qualitative technique on the transcribed data to build an affinity diagram, which contains emerging themes and findings in the observational study. We provide an open access to the data/files in this study below. 


__Next__, we use the internal database at OpenStack (not available to the general public for confidentiality purposes). We use this dataset to select all contributors who have done the onboarding training and filtered out those cases that did not meet our study's requirement in Cat-3 (for example, a new contributor should have no prior experience with any previous event within/out OpenStack). Based on this filtering, we obtain a total of 427 new contributors in Cat-3. This 427 number motivated us to select an equal amount of contributors in the other categories (Cat-1 and Cat-2).


**Then** we use a professional in-house tool: ``pip install stackalytics`` to extract contributors' activities in all the OpenStack repositories such as Gerrit, Launchpad, Storyboard, etc. Based on our defined metrics, such as time-to-first commit, the number of commits, including buggy one and non-buggy commits, we later used these activities to calculate each contributor's SZZ metric. 



## [Qualitative Study](#qualitative-section)

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
 
## [Quantitative Study](#qusntitative-section)

## [Mining Software Repositories](#mining-software-reposotories)
We mined the following OpenStack's repositories, based on the stratefied random sampliung with did on the selected 1281 new contributors among all three categories; Cat-1, Cat-2, and Cat-3.

<p align="center">
  <img src="https://user-images.githubusercontent.com/66274242/110357167-fc8b1880-8008-11eb-802b-2df7c6b7df1f.png" ?raw=true" alt="MSR -- OpenStack repos" width="700" height="400" />
</p>


## [Timeline](#timeline)
Our quantitative study has three different categories spanning two different timelines; before and after OpenStack introduces onboarding.

![Our Research Timeline](https://user-images.githubusercontent.com/66274242/106151489-667eeb00-614a-11eb-98ec-9d16cb711cdf.png)


- We provide the dataset  "4.dataset" that we  used in analyzing the new contributors activities at OpenStack.
### STEP 4. 
-0 In each file, we compute different metric and compare the different studied categories (Cat-1, Cat-2, and Cat-3). The event column is the particular release cycle that we are looking at.

### STEP 5. 
We run our scripts on the datasets to analyze the activities of interests. We have two Jupyter python notebooks that we converted to HTML files (11.onboarding.html -- measured activities  and 12.Statistical_testing.html -- the statistical tests) for simplicity.

- both the survival analysis curves were done in ***R*** ("*13.survival_analysis.R*" and "*14.survival_longivity.R*")


# [INSTALL](#install)
To use our replication package, we recommend users to install python 3.8.5 or higher version and R 4.3.3+
Once installed, users can install the python dependencies using:
```
pip install -r REQUIREMENTS.txt

```
For the R package the survival analysis file (_*13.survival_analysis.R*_) automatically installs all R dependencies that we used.

# [Usage](#usage)

## [Dataset](#dataset)
All our datasets in the quantitative study has ***427*** entry per category (Cat-1, Cat-2, and Cat-3) making a total of 1281 new contributors.
For each metric in [Table1_Metrics.pdf] we measure a particular phenonmena such as Affiliation of contributors in each category that were hired by OpenStack sponsoring companies. For example, in the case of company affiliation, we use the __*Affiliation.csv*__ dataset, which has the following columns and selected rows:

<img width="1212" alt="affiliation" src="https://user-images.githubusercontent.com/66274242/106171370-7523cd00-615f-11eb-9be9-faf097e75678.png">

#### ___Datasets___

We use double blind on the datasets to represent each contributor with their gender and activities such as their __*Category*__ (Cat-1), __*Event*__ (release cycle that we capture the activity i.e. Cactus, Diablo, etc.,) __*Gender*__: Male, Female, non-binary (neutral), __*Commit*__ that each contributors made, the __*Effort*__ that contributors make to get their patchset aceepted. If contributors are affiliated to companies or not, Activive contributing or not. When contributors are censored for the Survival analysis, and Longivity in month to compute the retention rate, etc.

- Similarly, we use different metrics in other datasets to answer our research questions. However, in all cases, our scripts uses these datasets on different categories of contributors. 

#### ___Scripts___
Make sure all the relative path to the dataset in all the scripts are correctly place on your system, where the user can access them with full permission.

##### Python Files

__*Users*__ need to install jupyterlab/notebook on their system to use the __*11.onboarding.html*__ and __*12.Statistical_testing.html*__, then convert these light weight version of the notebooks into ___.ipynb___ to run each cell. Alternatively, users can copy the cells of each ___.html___ files to a python file and run

```
$ python onboarding.py
```
Similarly to the other python files.

##### R Files
__*Users*__  can use any R IDE such as [RStudio](https://rstudio.com/) to compile and run the R codes found in __*13.survival_analysis.R*__, ___14.survival_longivity.R___, and ___19.iir.R___

Users can use the command line to run the R scripts, for example,
```
$ Rscript  13.survival_analysis.R 
```

## [OpenStack resources](#openstack-resources)

- [Stackalytics](https://wiki.openstack.org/wiki/Stackalytics)
- [OpenStack Foundation](https://www.openstack.org) 
- [How to contribute to OpenStack, new contributors](https://wiki.openstack.org/wiki/How_To_Contribute#Contributors_License_Agreement)
- [OpenStack governance and Contributors' policies](https://wiki.openstack.org/wiki/GovernmentCLA)
- [Documentation on project teams](https://docs.openstack.org/project-team-guide/introduction.html)
- [The OpenStack onboarding Institute](https://wiki.openstack.org/wiki/OpenStack_Upstream_Institute_Occasions)
- [Onboarding training materials](https://etherpad.openstack.org/p/upstream-training-exercises)
- [Communication medium](https://docs.openstack.org/project-team-guide/open-community.html#project-irc-channels)
- [The OpenStack Queen Release](https://releases.openstack.org/queens/index.html) 
- [Various OpenStack project teams](http://git.openstack.org/cgit/openstack/governance/tree/reference/projects.yaml)
- [SECO-level issues tracker](https://storyboard.openstack.org/#!/page/about)
- [Project-level issues tracker](https://launchpad.net/openstack)
- [OpenStack git repository](https://review.opendev.org/#/dashboard/self)
- [Making firat contacts with OpenStack](https://wiki.openstack.org/wiki/First_Contact_SIG)

```
### last update = {2020-08-28}
```
}
