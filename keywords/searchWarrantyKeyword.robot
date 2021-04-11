
*** Settings ***
resource            ../variables/variables.robot







*** Keywords ***
Open "${browserName}" browser
    Open Browser    https://warrant.kgi.com/EDWebSite/Views/WarrantSearch/WarrantSearch.aspx    ${browserName}
    Maximize Browser Window
    Set Selenium Speed   0.2 seconds

set broker name to "${brokerName}"
    Wait Until Element Is Visible    //span[@aria-owns='ddlIssuer_listbox']/..//span[@class='k-select']     ${timeOutSeconds}
    click element   //span[@aria-owns='ddlIssuer_listbox']/..//span[@class='k-select']
    Wait Until Page Contains Element    //ul[@id='ddlIssuer_listbox']/..//li[contains(text(),'${brokerName}')]    ${timeOutSeconds}
    click element   //ul[@id='ddlIssuer_listbox']/..//li[contains(text(),'${brokerName}')]

enter stock id "${stockID}"
    click element   //input[@name='ctlUnderlying_input']/../span[@class='k-select']
    Wait Until Page Contains element    //ul[@id='cmbUnderlying_listbox']/li[contains(text(),'${stockID}')]    ${timeOutSeconds}
    click element   //ul[@id='cmbUnderlying_listbox']/li[contains(text(),'${stockID}')]

enter warranty type "${warrantyType}"
    click element   //span[@aria-owns='ddlCP_listbox']
    Wait Until Element Is Visible    //ul[@id='ddlCP_listbox']/li[contains(text(),'${warrantyType}')]    ${timeOutSeconds}
    click element   //ul[@id='ddlCP_listbox']/li[contains(text(),'${warrantyType}')]

enter days of expire more than "${numOfDays}" days
    click element   //span[@aria-owns='numLastDaysFrom_listbox']
    Wait Until Element Is Visible    //ul[@id='numLastDaysFrom_listbox']/li[contains(text(),'${numOfDays}')]    ${timeOutSeconds}
    click element   //ul[@id='numLastDaysFrom_listbox']/li[contains(text(),'${numOfDays}')]

set in percentage "${inPercentage}" and out percentage "${outPercentage}"
    click element   //span[@aria-owns='ddlInOutPercentFrom_listbox']
    Wait Until Element Is Visible    //ul[@id='ddlInOutPercentFrom_listbox']/li[contains(text(),'${inPercentage}')]    ${timeOutSeconds}
    click element   //ul[@id='ddlInOutPercentFrom_listbox']/li[contains(text(),'${inPercentage}')]
    click element   //span[@aria-owns='ddlInOutPercentTo_listbox']
    Wait Until Element Is Visible    //ul[@id='ddlInOutPercentTo_listbox']/li[contains(text(),'${outPercentage}')]    ${timeOutSeconds}
    click element   //ul[@id='ddlInOutPercentTo_listbox']/li[contains(text(),'${outPercentage}')]

click search button
    click Element       //input[@id='btnQuery']

should display warranty search result
    Wait Until Page Contains element    //td[contains(text(),'成交價')]/../..//label[@id='undDeal']    ${timeOutSeconds}
    Wait Until Page Contains element    //td[contains(text(),'成交量')]/../..//label[@id='undVolume']    ${timeOutSeconds}
    Wait Until Page Contains element    //td[contains(text(),'漲跌幅')]/../..//label[@id='undChangePercent']    ${timeOutSeconds}



