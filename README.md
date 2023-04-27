# **Introduction**

Bash script that will validate if the engineers did a proper commit message during their work. 

## Rules

1. Each commit message with the Jira ticket that the work is associated with. For example: "PODA-32 Fix a flaky test".
2. Additionally, the engineering management team has a board (MGMT) it uses to track management tasks.
3. Exepctions to this naming are PR is merged or reverted.

## Usage

1. Give execute permission for the script:
```
chmod +x ./commit-validation.sh
```
2. Run the script with provided 2 arguments <from_version> <to_version>.
```
./commit-validation.sh v1.0.0 v1.6.0
```
3. And you will see the result either commit is correct (TRUE) or incorrect (FALSE) with the following output:
```
dd44cb9 FALSE Davo
71a46d0 FALSE Davo
56d11f1 FALSE Davo
69294da FALSE Davo
7dd131e FALSE Lin
2d2a4b0 FALSE Davo
c94bad5 TRUE Lin
0d01dc0 FALSE Lin
7bee63d FALSE Davo
a3baa4d TRUE Davo
40c4194 FALSE Davo
b70b00d FALSE Davo
70053dd FALSE Davo
a2e477c FALSE Davo
6b78c46 FALSE Davo
51e97d5 TRUE Davo
800b7c2 FALSE Davo
d1233e5 TRUE Davo
```