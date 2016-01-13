#require 'mechanize'
require 'selenium-webdriver'
#require 'capybara'
require 'nokogiri'
require 'pry'

puts 'Quel est le montant des recettes a déclarer ?'
montant_recettes = gets

driver = Selenium::WebDriver.for :firefox
driver.navigate.to 'https://www.net-entreprises.fr/'

### LOGIN
login_form = driver.find_element(:id ,'Form2')

siret_field = driver.find_element(:id, 'j_siret')
siret_field.clear
siret_field.send_keys('79844545800028')

nom_field = driver.find_element(:id, 'j_nom')
nom_field.clear
nom_field.send_keys('lepetit')

prenom_field = driver.find_element(:id, 'j_prenom')
prenom_field.clear
prenom_field.send_keys('hugo')

password_field = driver.find_element(:id, 'j_password')
password_field.clear
password_field.send_keys('umad')

login_form.submit

### SELECT DECLARATION
driver.find_element(:link_text, 'Auto-entreprise').click

### DECLARATION EN COURS
driver.find_element(:id, 'item_dec').click

### SAISIE MONTANT
driver.find_element(:name, 'ass_recettes').send_keys(montant_recettes.to_s)

#driver.quit
#binding.pry
#
## wait for a specific element to show up
#wait = Selenium::WebDriver::Wait.new(:timeout => 10) # seconds
#wait.until { driver.find_element(:id => "foo") }
