*** Settings ***
Resource          ../All.txt

*** Test Cases ***
delete
    wait click element    //p[text()=5]/parent::*/parent::*/parent::*/parent::*//div[@class="el-card is-always-shadow background-blue version-trill-content"]
    wait until keyword succeeds    3    3s    wait click element    //div[@class="btn-box clearfix"]//span[text()=" Delete "]
    wait click element    //button[@class="el-button el-button--default el-button--small el-button--primary msg-confirm-class"]
    check page not contains    5
