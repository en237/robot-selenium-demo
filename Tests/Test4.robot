*** Settings ***
Library  SeleniumLibrary
Suite Setup  Open Browser  ${HOMEPAGE}  ${BROWSER}
Test Setup  Go To  ${HOMEPAGE}
Suite Teardown  Close All Browsers
Documentation  Demonstrate SeleniumLibrary by googling.

*** Variables ***
${HOMEPAGE}  http://www.google.be
${BROWSER}  gc

*** Test Cases ***
Google searches and verifying results
    [Tags]  templated-tests
    [Template]  Google and check results
    devops  devops.com
    deveo  deveo
    robot framework  robotframework.org

Google devops and find devops.com
    [Tags]  devops  smoke
    Google and check results  devops  devops.com

Google deveo and find its web site
    [Tags]  deveo
    Google and check results  deveo  deveo

Google robotframework and find its web site
    [Tags]  robot
    Google and check results  robotframework  robotframework.org

*** Keywords ***
Google and check results
    [Arguments]  ${searchkey}  ${result}
    Input Text  id=lst-ib  ${searchkey}
    Press Key  id=lst-ib  \\13
    Wait Until Page Contains  ${result}
