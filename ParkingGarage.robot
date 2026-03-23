1. Bejelentkezes ellenorzese
- Sikeres bejelentkezes ervenyes felhasznalonevvel es jelszoval
- Sikertelen bejelentkezes hibas jelszo eseten
- Sikertelen bejelentkezes nem letezo felhasznaloval
- Kotelezo mezok ellenorzese ures bejelentkezesi adatoknal
- Hibauzenet helyes megjelenitese sikertelen bejelentkezesnel
- Kijelentkezes utan vedett oldalak eleresenek tiltasa

2. Uj auto rogzitese
- Sikeres uj auto felvitele (happy path)
- Kotelezo mezok ellenorzese mentes elott
- Hibasan megadott rendszam formatum kezelese
- Duplikalt rendszam mentesenek kezelese

3. Modositas es torles
- Auto adatainak sikeres modositasa
- Torles megerosito ablakkal
- Torles megszakitasa (Megse folyamattal)
- Megerosito ablak gombjainak helyes mukodese

*** Settings ***
Library           Selenium2Library
Resource    LoginKeywords2.robot

*** Test Cases ***
Bejelentkezes ellenorzese
    Login
    Sleep    1s
    Wait Until Element Is Visible    class:logout-button
    Page Should Contain Element    class:logout-button
    Sleep    1s
    Close Browser

Sikeres bejelentkezes ervenyes felhasznalonevvel es jelszoval
    Open Browser    https://parking-garage-app.netlify.app/login    firefox
    Input Text    //*[@id="email"]    nagy.tamas@diak.szbi-pg.hu
    Input Password    //*[@id="password"]     npala
    Click Button  //*[@id="login-button"]
    Sleep    1s
    Wait Until Element Is Visible    class:logout-button
    Page Should Contain Element    class:logout-button
    Sleep    1s
    Close Browser

Sikertelen bejelentkezes hibas jelszo eseten
    Open Browser    https://parking-garage-app.netlify.app/login    firefox
    Input Text    //*[@id="email"]    nagy.tamas@diak.szbi-pg.hu
    Input Password    //*[@id="password"]     rossz_jelszo
    Click Button  //*[@id="login-button"]
    Sleep    1s
    Page Should Contain    Invalid email or password.
    Close Browser

Sikertelen bejelentkezes nem letezo felhasznaloval
    Open Browser    https://parking-garage-app.netlify.app/login    firefox
    Input Text    //*[@id="email"]    nemletezo@felhasznalo.hu
    Input Password    //*[@id="password"]     npala
    Click Button  //*[@id="login-button"]
    Sleep    1s
    Page Should Contain    Invalid email or password.
    Close Browser

Kotelezo mezok ellenorzese ures bejelentkezesi adatoknal
    Open Browser    https://parking-garage-app.netlify.app/login    firefox
    Click Button  //*[@id="login-button"]
    Sleep    1s
    Location Should Be    https://parking-garage-app.netlify.app/login
    Close Browser

Hibauzenet helyes megjelenitese sikertelen bejelentkezesnel
    Open Browser    https://parking-garage-app.netlify.app/login    firefox
    Input Text    //*[@id="email"]    nemletezo@felhasznalo.hu
    Input Password    //*[@id="password"]     rossz_jelszo
    Click Button  //*[@id="login-button"]
    Sleep    1s
    Page Should Contain    Invalid email or password.
    Close Browser

Kijelentkezes utan vedett oldalak eleresenek tiltasa
    Open Browser    https://parking-garage-app.netlify.app/login    firefox
    Input Text    //*[@id="email"]    nagy.tamas@diak.szbi-pg.hu
    Input Password    //*[@id="password"]     npala
    Click Button  //*[@id="login-button"]
    Sleep    1s
    Click Button    class:logout-button
    Sleep    1s
    Go To    https://parking-garage-app.netlify.app/statistics
    Sleep    1s
    Location Should Be    https://parking-garage-app.netlify.app/
    Close Browser

Sikeres uj auto felvitele
    Login
    Sleep    1s
    Wait Until Element Is Visible    //*[@id="cars-link"]
    Click Button    //*[@id="cars-link"]
    Sleep    1s
    Input Text    id:license-plate-input    ABC-123
    Click Button    id:save-car-button
    Sleep    1s
    Page Should Contain    ABC-123
    Sleep    1s
    Close Browser