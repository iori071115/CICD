*** Settings ***
Resource          ../All.txt

*** Test Cases ***
Check
    ${header}    create dictionary    authorization=Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJhaW1zMy5hc2tleWNsb3VkYXBpLmNvbSIsImF1ZCI6ImNvbnNvbGUtcWF0LmF2dXMzLmFza2V5Y2xvdWRhcGkubmV0IiwiYWNjb3VudElkIjoiMzM2OTI4ZjMtZDNiNS00MzcxLWFhNTgtZmJjNTdmOWY2MTQ2IiwiZW1haWwiOiJoZW5yeTAxX3podUBhc2tleS5jb20iLCJjbGllbnRJZCI6IjM5OWI0MjA3NDMwMWI3Y2QiLCJzaWQiOiJfOTMxYTRhMjYtNzJkMS00MTlhLWJiZDUtY2Q5NjllMjkwMzAwIiwiaXNMb2dpbiI6dHJ1ZSwiaWF0IjoxNjQyMzk5MzY4LCJleHAiOjE2NDI0MTM3NjgsInN    content-type=application/json; charset=utf-8
    ${params}    create dictionary    v=1    u=111
    create session    tool    https://5101417652027392.vc-qat.avus3.askeycloudapi.net    ${header}
    ${data}    get request    tool    /v3/check/2/ttt/3    params=${params}    headers=${header}
    ${res}    set variable    ${data.content}
    ${res_body}    to json    ${res}
    ${res_file}    get from dictionary    ${res_body}    file
    ${res_code}    get from dictionary    ${res_body}    code
    set suite variable    ${res_file}
    should be equal as strings    ${res_code}    20000
    log    ${res_file}
    log    ${res_code}

Down
    #open browser    ${res_file}    chrome
    #sleep    20s
    #file_should_exist    C:\\Users\\henry.zhu\\Downloads\\yyx.txt
    #log file    C:\\Users\\henry.zhu\\Downloads\\yyx.txt    encoding_errors=ignore
    ${file}    get file    C:\\Users\\henry.zhu\\Downloads\\yyx.txt    encoding_errors=ignore
    ${size}    grep file    C:\\Users\\henry.zhu\\Downloads\\yyx.txt    monkey
    Should Start With    ${file}    maybe
    log    ${file}
    log    ${size}
