Feature: Login Test Function
    As a user,
    I wanna login in to website,
    So that I can access successfully

    Scenario Outline: Login valid
        Given Go to the login page and login successfull
        When User input usename:'<tomsmith>'
        And Enter password:'<SuperSecretPassword!>'
        And Click button
        Then "You logged into a secure area!" result should be listed on page title

     Scenario Outline: Invalid
        Given Go to the login page and login unsuccessfully
        When user input invalid username '<username>'
        And and password '<password>'
        Then "Your username is invalid!" result should be listed on page title

        Examples:
            | username    | password |
            | huynhtrungquan| dsadsa   |
            | asdsadsadsa | dsadsadsadsadsa  |
            
        
