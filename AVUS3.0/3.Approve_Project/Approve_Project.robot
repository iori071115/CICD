*** Settings ***
Resource          ../All.txt

*** Test Cases ***
Approve_Project
    [Tags]    Sanity
    [Setup]
    ProjectName    ${ProjectName}    paskey\\eason2_wu    OPop9090
    [Teardown]
