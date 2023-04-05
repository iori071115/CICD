*** Settings ***
Suite Teardown
Test Teardown
Resource          ../All.txt

*** Test Cases ***
Create_New_Project
    [Tags]    Sanity
    [Setup]    登录AVUS
    wait click element    css=div [class="el-button min-layout-btn el-button--primary"] span
    ${YYYY}    ${MM}    ${DD}    ${hh}    ${mm}    get time    year,month,day,hour,min
    wait input element    css=[placeholder="Enter Customer Name"]    C${YYYY}${MM}${DD}${hh}${mm}
    ${ProjectName}    set variable    P${YYYY}${MM}${DD}${hh}${mm}
    set global variable    ${ProjectName}
    wait input element    css=[placeholder="Enter Project Name"]    ${ProjectName}
    wait input element    css=[placeholder="Enter Module"]    M${YYYY}${MM}${DD}${hh}${mm}
    ${RdSupervisor}    Get WebElements    css=[placeholder="Enter Askey AD Account"]
    wait input element    ${RdSupervisor[0]}    eason2_wu
    ${SIT_Reviewer}    Get WebElements    css=[placeholder="Enter Askey AD Account"]
    wait input element    ${SIT_Reviewer[1]}    henry01_zhu
    ${DQA_Reviewer}    Get WebElements    css=[placeholder="Enter Askey AD Account"]
    wait input element    ${DQA_Reviewer[2]}    catherine_cao
    ${PJM_Reviewer}    Get WebElements    css=[placeholder="Enter Askey AD Account"]
    wait input element    ${PJM_Reviewer[3]}    may_xiang
    ${PLM_Reviewer}    Get WebElements    css=[placeholder="Enter Askey AD Account"]
    wait input element    ${PLM_Reviewer[4]}    jason_xu
    wait click element    css=div [class="el-dialog__footer"] span button:nth-child(3)
    wait click element    css=div [class="el-dialog__footer"] span button:nth-child(4)
    ${Send}    Get WebElements    css=div [class="el-message-box__btns"] button
    wait click element    ${Send[1]}
    [Teardown]    关闭browser
