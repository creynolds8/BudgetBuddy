# BudgetBuddy

Welcome to BudgetBuddy! The best new budgeting app out there! This project was done as the final project at the Lighthouse Labs Web Development Bootcamp. BudgetBuddy was created by [Evgheni Barducov](https://github.com/baovevni), [Mackenzie Hamelin](https://github.com/Mekyle28), and myself. This branch represents our application's state when we presented it at the Lighthouse Labs Demo Day Graduation on July 18, 2024.


## Project Design


We aimed to design an app that would allow users to better manage their monthly spending with budgets created to suit their needs, along with a clean and easy to use interface.


We chose to build BudgetBuddy using Rails 7, though we were relatively unfamiliar with the framework when beginning the project. We chose Rails because of the ease of setup for a small project thanks to the built commands to create the necessary files for working with different datasets. Rails' adherence to convention over configuration allowed us to develop different features of the app independently of each other while still following similar development practices. This made it very smooth to integrate another developer's changes into you're own changes as well as making it easier to hop into someone else's code to tweak something or to help them out.


### Final Project


![Main Page of BudgetBuddy](https://github.com/creynolds8/BudgetBuddy/blob/presentation-state/docs/Main%20Page.png?raw=true)
The main page of BudgetBuddy allows users to get the most important budget information with just a quick look.


![Users can expand any category to see what transactions are in that category](https://github.com/creynolds8/BudgetBuddy/blob/presentation-state/docs/Main%20Page%20w:%20expanded%20category.png?raw=true)
Users can expand any category to see what transactions are in that category for more detailed information.


![Accounts Overview Page](https://github.com/creynolds8/BudgetBuddy/blob/presentation-state/docs/Accounts%20Overview.png?raw=true)
Users can view important account information such as their net balance and the trend of their debit and credit balances over the course of the month.


![Transaction Page with search parameters](https://github.com/creynolds8/BudgetBuddy/blob/presentation-state/docs/Transactions%20Page%20w:%20search.png?raw=true)
Users can search through their previously added transactions. This search can be filtered by a date range and runs a fuzzy search against the merchant, category, and account name of each transaction.


![New Transaction Form](https://github.com/creynolds8/BudgetBuddy/blob/presentation-state/docs/New%20Transaction%20Form.png?raw=true)
Users can add new transactions through this form. New accounts and budgets can be added through a similar form.


![Budgets Page](https://github.com/creynolds8/BudgetBuddy/blob/presentation-state/docs/Budgets%20Page.png?raw=true)
Users can see and edit their current budget as well as see the overview from previous months' budgets.


![Form error handling](https://github.com/creynolds8/BudgetBuddy/blob/presentation-state/docs/Budget%20Form%20w:%20error%20handling.png?raw=true)
If a required field is not filled out when attempting to save the form, a helpful error message will be displayed.


## Startup Instructions


If you would like to dig through the code or check out the app in the state it was in when presented, follow these instructions to run a development version of the app.


### Getting Started


1. [Create](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-repository-from-a-template) a new repository using this repository as a template.
2. Clone your repository onto your local device.
3. Install dependencies using the `bundle install` command.
3. Start the web server using the `rails s` command. The app will be served at <http://localhost:3000/>.
4. Go to <http://localhost:3000/> in your browser.

