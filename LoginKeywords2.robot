*** Settings ***
Library           Selenium2Library

*** Keywords ***
Login
    Open Browser    https://parking-garage-app.netlify.app/login    firefox
    Input Text    //*[@id="email"]    nagy.tamas@diak.szbi-pg.hu
    Input Password    //*[@id="password"]     npala
    Click Button  //*[@id="login-button"]