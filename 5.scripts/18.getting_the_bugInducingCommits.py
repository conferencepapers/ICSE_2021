import csv
import pandas as pd
import re
import numpy as np
from datetime import datetime
import os
from pydriller import RepositoryMining, GitRepository
from pydriller.domain.commit import ModificationType
from pprint import pprint


gr = GitRepository("~/openstack/")


"""
 Mapping bug-ID to commit-ID
 bug_dict = {} => contains all the issues wrt their commits. 
 This will later enable us to locate all the bug inducing commits.


 @inproceedings{Spadini2018,
    address = {New York, New York, USA},
    author = {Spadini, Davide and Aniche, Maur\'{i}cio and Bacchelli, Alberto},
    booktitle = {Proceedings of the 2018 26th ACM Joint Meeting on European Software Engineering Conference and Symposium on the Foundations of Software Engineering - ESEC/FSE 2018},
    doi = {10.1145/3236024.3264598},
    isbn = {9781450355735},
    keywords = {2018,acm reference format,and alberto bacchelli,davide spadini,git,gitpython,maur\'{i}cio aniche,mining software repositories,pydriller,python},
    pages = {908--911},
    publisher = {ACM Press},
    title = {{PyDriller: Python framework for mining software repositories}},
    url = {http://dl.acm.org/citation.cfm?doid=3236024.3264598},
    year = {2018}
}
"""

df = pd.read_csv("/Users/armstrong/research/scripts/notebook/extrated_raw_sha.csv", sep=',', encoding='utf-8',
                 quoting=csv.QUOTE_ALL)

with open('likely_bug_inducing_sha.csv', 'w') as csvFile:
    writer = csv.writer(csvFile)

# csvFile.close()


count = 1

for i, row in df.iterrows():
    cand_sha = row["sha"]
    for candidate_commit in RepositoryMining("~/openstack/", single=cand_sha).traverse_commits():
        for modified_files in candidate_commit.modifications:
            print(
                "candidate sha is: {}".format(candidate_commit.hash),
                "Author {}".format(candidate_commit.author.name),
                " modified {}".format(modified_files.filename),
                " with a change type of {}".format(modified_files.change_type.name),
                # " and the DIFF is {}".format(modified_files.diff),
                " With {} added lines".format(modified_files.added)
            )

            diff = modified_files.diff
            parsed_diff = gr.parse_diff(diff)

            print("This is the usual diff:  {}".format(diff))

            buggy_induced_commits = gr.get_commits_last_modified_lines(candidate_commit, modified_files)
            writer.writerow(row)
            print(
                "This is a bug inducing commit : {}".format(buggy_induced_commits),
                "Was Committed on: {}".format(candidate_commit.committer_date),
                "with merged status as: {}".format(candidate_commit.merge)
            )
            pprint("Parsed diff : {}".format(parsed_diff))

            print("||======================== Line {}=============================>>".format(count))
            count += 1