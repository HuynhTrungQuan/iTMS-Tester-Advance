require "selenium-webdriver"
require "webdrivers"
require "rubygems"
Given('Go to the login page and login successfull') do
    @driver = Selenium::WebDriver.for :chrome
    @driver.get 'http://the-internet.herokuapp.com/login'
    @driver.manage.window.resize_to(781, 878)
  end
  When('User input usename:{string}') do |string|
    @username = 'tomsmith'
    @driver.find_element(:id, 'username').send_keys(@username)
  end
  
  When('Enter password:{string}') do |string|
    @password = 'SuperSecretPassword!'
    @driver.find_element(:id, 'password').send_keys(@password)
  end

  When('Click button') do 
    @driver.find_element(:css, '.radius').click
  end

  Then('{string} result should be listed on page title') do |string|
    expect(@driver.find_element(:id, 'flash').text).to include('You logged into a secure area!')
    @driver.quit
  end



  Given('Go to the login page and login unsuccessfully') do
    @driver = Selenium::WebDriver.for :chrome
    @driver.get 'http://the-internet.herokuapp.com/login'
    @driver.manage.window.resize_to(778, 888)
  end
  When('user input invalid username {string}') do |string|
    @username = string 
    @driver.find_element(:id, 'username').click
    @driver.find_element(:id, 'username').send_keys(@username)
  end
  
  When('and password {string}') do |string|
    @password = string 
    @driver.find_element(:id, 'password').send_keys(@password)
    @driver.find_element(:id, 'password').send_keys(:enter)
  end

  Then('{string} result should be appeared on the screen') do |string|
    expect(@driver.find_element(:id, 'flash').text).to include(string)
    @driver.close
  end

  
  
  