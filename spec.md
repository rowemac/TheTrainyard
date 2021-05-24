# Specifications for the Rails Assessment
Specs:
- [X] Using Ruby on Rails for the project
    - The project is set up using the command 'rails new'

- [X] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes)
    - Both User has_many :tickets and Concert has_many: tickets

- [X] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)
    - Ticket belongs_to both User and Concert

- [X] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients) (many-to=many)
    - User has has_many :concerts, through: :tickets 
    - Concert has_many :users, through: :tickets

- [X] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
    - User has has_many :concerts, through: :tickets 
    - Concert has_many :users, through: :tickets
    
- [X] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
    - The User submittable attribute is ticket quantity upon "purchasing" a ticket for a concert. This is also editable/deletable if a user decides they want to change the amount of tickets for a concert or if they want a "refund."

- [X] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
    - A User's validations include the presence of a name, username, email, and the uniqueness of an email upon creation
    - A Ticket validates the quantity of a ticket upon creation in which it must be an integer greater than 0

- [X] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
    - In the Concert model, using a scope method concerts are ordered by ascending date to be more user-friendly in the concert index
        - This method is chained to the .each iteration in that index
    - In the Concert index a link is placed to show all of the early concerts in a new route
        - The scope method is chained with two AcitveRecord methods: where (7pm) and order (ascending) 

- [X] Include signup (how e.g. Devise)
    - A signup for User is located on the home page of the app

- [X] Include login (how e.g. Devise)
    - A Login for User is located on the home page of the app wherein a User provides an email and password to navigate the site

- [X] Include logout (how e.g. Devise)
    - Logout is located on the navbar at the top of the page once a user is logged in 
    
- [X] Include third party signup/login (how e.g.OmniAuth)
    - The app provdies a User the opportunity to sign in with Google via Omniauth

- [X] Include nested resource show or index (URL e.g. users/2/recipes) (in route file)
    - Ticket show page is nested within concerts

- [X] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new) (in route file)
    - In order to "purchase" a ticket a User is directed to a ticket form nested within the specific concert for which they wish to buy a ticket

- [X] Include form display of validation errors (form URL e.g. /recipes/
new)
    Both the User form and the Ticket form display validation errors in red
    at the top of the form to aid a user in the creation and updating of each


Confirm:
- [X] The application is pretty DRY
    - Makes use of partilals and before_actions to keep code clean
- [X] Limited logic in controllers
    - The most logic in controllers is limited to conditionals 
- [X] Views use helper methods if appropriate
    - The application layout implements the logged_in? helper method to display navbar options conditionally
- [X] Views use partials if appropriate
    - Both the views for users and tickets utilize partials