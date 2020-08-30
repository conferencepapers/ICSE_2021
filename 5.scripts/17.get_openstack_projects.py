#!/usr/bin/env python
"""
 Do nothing, but document it.

 Lists of all OpenStack projects are available here:
 http://git.openstack.org/cgit/openstack/governance/plain/reference/projects.yaml
"""

import yaml
import requests
import os

"""
DOWNLOAD THE yaml file containing all projects from Governance repo
This url is too long and displays warning msg, I used tinyurl.com to reduce it.
url = 'http://git.openstack.org/cgit/openstack/governance/plain/reference/
       projects.yaml'


"""
url = 'https://tinyurl.com/y6e4ysqa'
r = requests.get(url, allow_redirects=True)
"""
    Save the Yaml file containing all openstack release managed projects
    to the current working directory
"""
open(os.path.join(os.path.dirname(__file__),
                  'data/input/projects.yaml'),
     'wb').write(r.content)

i = 0
for key in yaml.load(open(os.path.join(os.path.dirname(__file__),
                                       'data/input/projects.yaml'), 'r')):
    """
        Open the yaml file and read all the current managed projects,
        as we do the reading, we also create a txt file (if not exist),
        and save the projects in this new txt file.

        Each time we read the yaml file, we want to make sure that the txt file
        contains all the current projects if not, we add the new project in the
        txt file; we compare {if key == project.strip()} the txt file with the
        list of current projects stored in the yaml file.

        Then, we count the total number of projects and display it.

    """
    try:
        i += 1
        print("Project {} ==> {}".format(i, key))
        with open(os.path.join(os.path.dirname(__file__),
                               'data/output/projects.txt'), 'r+') as file:
            for project in file:
                if key == project.strip():
                    break
            else:
                file.write(key + '\n')
    except yaml.YAMLError as exc:
        print(exc)
print("We have a total number of {} projects ordered alphabetically".format(i))
