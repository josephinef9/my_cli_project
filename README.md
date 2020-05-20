# 15 Coffees To Try Before You Die

# Objectives
- Use Nokogiri to scrape a website titled "15 Coffees To Try Before You Die".
- Use scraped data to create a CLI where the user can see a list of those 15 coffees.
- Give user an option to select one of the coffees and get information about the coffee they selected.
- Give user an option to choose another coffee after they are done learning about the previous one.

# Overview
This project will scrape the 15 Coffees To Try Before You Die webpage. When the CLI starts, it will welcome the user and give them a list of the 15 different types of coffee. Once the user enters a number from 1 to 15, it will return the corresponding coffee and give the user more information about it, which will include its bio, ingredients and instructions. Once the user is done reading about the coffee they selected, they will have the option to either pick another coffee or exit the program. If they choose to exit the program, the CLI will output a goodbye message.

# Navigation
1. Type in ruby bin/movielist.rb to initiate the CLI.
2. Once the terminal outputs the list of coffees, make a selection from 1 to 15 to print out basic information about the coffe you selected.
3. You will be prompted to type in yes or no in the terminal to either choose another coffee or leave the program. If you type in yes, you will be redirected back to the list of coffees so that you can choose again. But if you type in no, the program will output a goodbye message.
