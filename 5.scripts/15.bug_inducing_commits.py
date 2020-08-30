
import re
import pickle
import numpy as np
import pandas as pd
from json import dumps, loads, JSONEncoder, JSONDecoder

from pydriller import RepositoryMining, GitRepository
from pydriller.domain.commit import ModificationType
from pprint import pprint

gr = GitRepository("~/openstack")
"""
 Mapping bug-ID to commit-ID
 bug_dict = {} => contains all the issues wrt their commits. 
 This will later enable us to locate all the bug inducing commits.
"""
bug_dict = {}

for commit in RepositoryMining("~/openstack").traverse_commits():
    # print(commit.hash)
    # print(commit.msg)

    commit_id = commit.hash
    message = commit.msg
    bugs = re.findall(
        r'[A-za-z]*[\-][Bb][Uu][Gg][\:][\s]?[#]?[\d]{6,7}', message)  # => 41150 bugs
    bugs += re.findall(
        r'[Ff][Ii][Xx]?[A-Za-z]*?:?[\s]?[\#]?[0-9]{6,7}', message)
    bugs += re.findall(
        r'[A-za-z]*[Ll][Pp]?[\:]?[\s]?[\#][0-9]{6,7}', message)
    # bugs => 41220
    for bug_id in bugs:
        # bug_id = re.findall(r'[\d]{6,7}', bug_number)
        # print(bug_id)
        if bug_id in bug_dict:
            commit_set = bug_dict[bug_id]
            commit_set.add(commit_id)
        else:
            commit_set = set()
            commit_set.add(commit_id)
            bug_dict[bug_id] = commit_set

        # if commit.hash in bug_dict.values():
        #     for modified_files in commit.modifications:
        #         print(
        #             "Author {}".format(commit.author.name),
        #             " modified {}".format(modified_files.filename),
        #             " with a change type of {}".format(modified_files.change_type.name),
        #             " and the DIFF {}".format(modified_files.diff)
        #         )

# keys = np.array(bug_dict.keys())
vals = np.array(list(bug_dict.values()))
# count = 0
for i in vals:
    # print("How many element in the list? \n", len(i))
    if len(i) == 1:
        for candidate_commit in RepositoryMining("~/openstack", single=i).traverse_commits():
            print("cand sha is: ", candidate_commit.hash)
            print("cand msg is: ", candidate_commit.msg)

            for modified_files in candidate_commit.modifications:
                print("Modified this file : ", modification_file.filename)
                diff = modified_files.diff
                parsed_diff = gr.parse_diff(diff)
                print("This is the usual diff:  {}".format(diff))
                buggy_induced_commits = gr.get_commits_last_modified_lines(
                    candidate_commit, modified_files)
                print("This is a bug inducing commit :  ",
                      buggy_induced_commits)
                pprint("Parsed diff {} :".format(parsed_diff))
                # "This is this diff of the file :  {}".format(parsed_diff)
    else:
        for x in i:
            for cand_commit in RepositoryMining("~/openstack/", single=x).traverse_commits():
                print("cand sha is: {}".format(cand_commit.hash))
                print("cand msg is: {}".format(cand_commit.msg))

                for modified_files in cand_commit.modifications:
                    print("Modified this file : {} ".format(
                        modified_files.filename))
                    diff = modified_files.diff
                    parsed_diff = gr.parse_diff(diff)
                    print("This is the usual diff : {}".format(diff))
                    bug_induced_commits = gr.get_commits_last_modified_lines(
                        cand_commit, modified_files)
                    print("This is a bug inducing commit: ",
                          bug_induced_commits)
                    pprint("Parsed diff {} :".format(parsed_diff))

    # print("We are now print index {} of dictionary value {} ".format(count, i))
    # count += 1
# for value in bug_dict.values():
#     print("commit sha is: ", value)
#     for candidate_commit in RepositoryMining("~/openstack", single=value).traverse_commits():
#         print("cand sha is: ", candidate_commit)
#

# # FINDING ALL THE BUG INDUCING COMMITS
# for candidate_commit in bug_dict.values():
#     # print(candidate_commit)
#
#
#     t = gr.getcommit(candidate_commit)
#     buggy_commits = gr.get_commits_last_modified_lines(buggy_commit)
#     print("THis is a buggy commit:  ", buggy_commits)  # result: (abc, def)
