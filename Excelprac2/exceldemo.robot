*** Settings ***
Library           Selenium2Library
Library           ExcelLibrary
Library      DatabaseLibrary
Library    autoit    
    

Library           Collections



*** Variables ***
${path_excel}   D:\Selenium.xls
${dbName}    abhi
${dbUsername}    root
${dbPassword}    sixerking
${dbHost}    localhost
${dbPort}    3306


*** Test Cases ***
Test1
    Open the Excel
    
    send    ENTER
Tes
    Connect To Database    dbConfigFile=C://Users/admin/Desktop/def.cfg        
    Check If Exists In Database    select * from pets where name='dogu';    
    @{list}    Query    select * from pets;
    ${rowCount}	Row Count	select * from pets where name='dogu';
    Log To Console    ${rowCount}  
    Log To Console    @{list}      
    

*** Keywords ***
Open the Excel
    open Excel    ${path_excel}     
    ${my_data}=    Read Cell Data By Name    Sheetnames    A3    
    Log To Console    ${my_data}