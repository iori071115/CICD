*** Settings ***
Resource          ../All.txt

*** Test Cases ***
submit
    [Tags]    Sanity
    [Setup]    登录AVUS
    select project
    wait click element    //p[text()=${VersionNO}]/parent::*/parent::*/parent::*/parent::*//div[@class="border-line"]
    wait until keyword succeeds    3    5s    wait click element    //span[text()=" Submit "]
    wait click element    //span[text()=" OK"]
    wait click element    //button[@class="el-button el-button--default el-button--small el-button--primary msg-confirm-class"]
    wait contains    RD Supervisor Reviewing
    [Teardown]    关闭browser
