*** Settings ***
Suite Teardown
Test Teardown
Resource          ../All.txt

*** Test Cases ***
Login
    [Tags]    Sanity
    wait until keyword succeeds    3    5s    登录    https://console-qat.avus3.askeycloud.net/#/login    henry01_zhu@askey.com    henry_0654    v3.1
    [Teardown]    关闭browser
