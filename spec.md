# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
- [x] Use ActiveRecord for storing information in a database
- [x] Include more than one model class (e.g. User, Post, Category): User, Deed, Property, Building
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts): User has_many Deeds, Properties through: Deeds, Buildings through: Properties
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User): Deed belongs_to Owner, Property. Building belongs_to Property
- [x] Include user accounts with unique login attribute (username or email): Users can't create an account with a used username or email
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying: Deed gets CRUDed through CRUDing Properties. Building has it's own CRUD routes.
- [x] Ensure that users can't modify content created by other users: Users can't access other users content
- [x] Include user input validations: If input is invalid, an error is shown after redirecting the user to a fresh page. Forms also have required fields & input types that require a specific form of input.
- [x] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new): Errors are shown to the user after redirection if input data can't create a valid object
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code: I wrote a short description, install instructions, a contributors guide, and a link to the license for my code.

Confirm
- [x] You have a large number of small Git commits: PLENTY
- [x] Your commit messages are meaningful: Let reader know what I did
- [x] You made the changes in a commit that relate to the commit message: Commit messages relate to changes made to project's code
- [x] You don't include changes in a commit that aren't related to the commit message: Largely, no. Some extremely minor changes may make their way in if they don't change functionality of code such as "remove extra space between html tags" even though it doesn't change anything on the web page, or "indent line of code on line 27" so that it looks pretty for the developer who is coding there. Final minor changes will be grouped together in ~1 commit message once project is finished and code is being cleaned up for aesthetic purposes.