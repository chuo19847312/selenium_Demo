*** Settings ***
Library             Selenium2Library
resource            ../keywords/searchWarrantyKeyword.robot




suite setup     Open "chrome" browser
suite teardown  Close Browser




*** Test case ***
1.1.1 search warranty
    [Tags]  P1
    set broker name to "全部"
    enter warranty type "認購"
    enter days of expire more than "90日" days
    set in percentage "價內5%" and out percentage "價外5%"
    enter stock id "6531"
    click search button
    should display warranty search result