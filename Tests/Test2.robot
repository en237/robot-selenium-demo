*** Settings ***
Library  SeleniumLibrary
Suite Setup  Go to homepage
Suite Teardown  Close All Browsers
Documentation  Demonstrate SeleniumLibrary by googling.

*** Variables ***
${HOMEPAGE}  http://www.google.be
${BROWSER}  chrome

*** Test Cases ***
Google devops and find devops.com
    Google and check results  devops  devops.com

Google deveo and find its web site
    Google and check results  deveo  deveo

Google robot and find its web site
    Google and check results  robot  robotframework.org

*** Keywords ***
Google and check results
    [Arguments]  ${searchkey}  ${result}
    Input Text  id=lst-ib  ${searchkey}
    Press Key  id=lst-ib  \\13
    Wait Until Page Contains  ${result}

Go to homepage
    Open Browser  ${HOMEPAGE}  ${BROWSER}