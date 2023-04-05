*** Settings ***
Resource          ../All.txt

*** Test Cases ***
download
    [Setup]    登录AVUS
    wait click element    //div[text()='ttt']
    wait click element    //div[@id="tab-third"]
    download file    //div[text()='5740763463811072']/parent::*/parent::*//i[@class="el-icon-download"]    C:\\Users\\henry.zhu\\Downloads\\Report-20220111_1544-henry01_zhu-uniqueId.csv
    remove file    C:\\Users\\henry.zhu\\Downloads\\Report-20220111_1544-henry01_zhu-uniqueId.csv
