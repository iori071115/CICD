*** Settings ***
Resource          ..//All.txt

*** Test Cases ***
Upload
    [Tags]    Sanity
    [Setup]    登录AVUS
    select project
    wait until keyword succeeds    3    5s    upload version    10
    [Teardown]    关闭browser

*** Keywords ***
upload version
    [Arguments]    ${VersionNo}
    #${uploadbutton}    Get WebElements    //button[@class="el-button el-button--primary is-circle"]
    #run keyword if    ${uploadbutton}==True    wait click element    //button[@class="el-button el-button--primary is-circle"]    else    wait click element    //div[@class="version-trill"][1]//div[@class="version-create-trill-icon"]
    wait click element    //button[@class="el-button el-button--primary is-circle"]
    set global variable    ${VersionNo}
    wait input element    //input[@placeholder="Please Enter Version Number"]    ${VersionNo}
    upload file    //label[@for="file"]/parent::*//input[@name="file"]    ${EXECDIR}\\上传文件\\yyx.txt
    wait click element    //span[text()=" Upload "]
    wait input element    //input[@placeholder="Please Enter File Type"]    txt
    wait input element    //textarea[@placeholder="Please Enter SHA256"]    0c3fd81e65f3f3733d0977982a775879e7b8e8f36e5d28e2f539371e8fd42553
    wait click element    //span[text()="Next "]
    wait click element    //span[text()="Next "]
    wait click element    //span[text()="Unique ID: "]
    wait click element    //span[text()="+ Add Unique ID "]
    wait input element    //div[@class="input-new-tag el-input el-input--small"]//input    111
    wait click element    //span[text()="Save "]
    wait contains    ${VersionNo}
