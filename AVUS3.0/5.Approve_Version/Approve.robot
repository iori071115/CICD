*** Settings ***
Resource          ../All.txt

*** Test Cases ***
1.RD approve
    [Tags]    Sanity
    [Setup]    RD登录
    go approval list
    wait click element    //div[text()="ttt"]
    wait click element    //span[text()=" Approve "]
    wait click element    //button[@class="el-button el-button--default el-button--small el-button--primary msg-confirm-class"]
    wait contains    SIT Testing
    [Teardown]    关闭browser

2.SIT approve
    [Tags]    Sanity
    [Setup]    SIT登录
    go approval list
    wait click element    //div[text()="ttt"]
    wait click element    //span[text()=" Approve "]
    wait click element    //button[@class="el-button el-button--default el-button--small el-button--primary msg-confirm-class"]
    wait contains    DQA Reviewing
    [Teardown]    关闭browser

3.DQA approve
    [Tags]    Sanity
    [Setup]    DQA登录
    go approval list
    wait click element    //div[text()="ttt"]
    wait click element    //span[text()=" Approve "]
    wait click element    //button[@class="el-button el-button--default el-button--small el-button--primary msg-confirm-class"]
    wait contains    PJM Reviewing
    [Teardown]    关闭browser

4.PJM approve
    [Tags]    Sanity
    [Setup]    PJM登录
    go approval list
    wait click element    //div[text()="ttt"]
    wait click element    //span[text()=" Approve "]
    wait input element    //input[@placeholder="Please enter the ECR/ECN number."]    1357
    wait click element    //span[text()=" Approve"]
    wait contains    Owner Reviewing
    [Teardown]    关闭browser

5.Owner approve
    [Tags]    Sanity
    [Setup]    登录AVUS
    go approval list
    wait click element    //div[text()="ttt"]
    wait click element    //span[text()=" Finalize "]
    wait click element    //span[text()="Delete ALL allow list"]
    wait click element    //span[text()=" Next"]
    wait click element    //button[@class="el-button el-button--default el-button--small el-button--primary msg-confirm-class"]
    wait contains    RD Supervisor Reviewing
    [Teardown]    关闭browser

6.RD finalization
    [Tags]    Sanity
    [Setup]    RD登录
    go approval list
    wait click element    //div[text()="ttt"]
    wait click element    //span[text()=" Approve "]
    wait click element    //button[@class="el-button el-button--default el-button--small el-button--primary msg-confirm-class"]
    wait contains    PJM Reviewing
    [Teardown]    关闭browser

7.PJM finalization
    [Tags]    Sanity
    [Setup]    PJM登录
    go approval list
    wait click element    //div[text()="ttt"]
    wait click element    //span[text()=" Approve "]
    wait click element    //button[@class="el-button el-button--default el-button--small el-button--primary msg-confirm-class"]
    wait contains    PLM Reviewing
    [Teardown]    关闭browser

8.PLM finalization
    [Tags]    Sanity
    [Setup]    PLM登录
    go approval list
    wait click element    //div[text()="ttt"]
    wait click element    //span[text()=" Approve "]
    wait click element    //button[@class="el-button el-button--default el-button--small el-button--primary msg-confirm-class"]
    wait contains    DQA Reviewing
    [Teardown]    关闭browser

9.DQA finalization
    [Tags]    Sanity
    [Setup]    DQA登录
    go approval list
    wait click element    //div[text()="ttt"]
    wait click element    //span[text()=" Approve "]
    wait click element    //button[@class="el-button el-button--default el-button--small el-button--primary msg-confirm-class"]
    wait contains    Owner Final Review
    [Teardown]    关闭browser

10.Owner deploy
    [Tags]    Sanity
    [Setup]    登录AVUS
    go approval list
    wait click element    //div[text()="ttt"]
    wait click element    //span[text()=" Deploy "]
    wait input element    //input[@placeholder="Please Enter Version Number"]    5
    wait click element    //span[text()=" Deploy"]
    wait contains    Deployed
    [Teardown]    关闭browser
