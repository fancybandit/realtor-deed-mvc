# realtor-deed-mvc
Basic Sinatra MVC app for homeowners to keep track of their real estate.

The goal of this application is to provide homeowners or real estate agents with a simple-to-navigate interface for keeping records of their properties, deeds, & buildings. Personal property, deed, & building info is confidential and secure from peering eyes for fraud protection. One is able to view other user's basic account information such as their name, join date, & addresses belonging to them, in case they wish to find contact information through an external resource for purchasing inquiries. RealtorDeed prioritizes a simple, user-friendly interface alongside personal information security, so that you may keep your tasks short, and your schedule open.

## Summary

  - [Getting Started](#getting-started)
  - [Built With](#built-with)
  - [Contributing](#contributing)
  - [Authors](#authors)
  - [License](#license)
  - [Acknowledgments](#acknowledgments)

## Getting Started

These instructions will get you a copy of the project up and running on
your local machine for development and testing purposes.

### Prerequisites

What you'll need to get the project up-and-running:

    Bundler

### Installing

After forking the project:
Copy the SSH link, then in the desired directory, type:

    `git clone <SSH LINK HERE>'

then, cd into the directory and open the project in your text editor/development environment.

In the project's terminal, type:

    `bundle' > Installs necessary libraries/dependencies

Now, create a session_secret in order to ensure all users' passwords are safe from exploitation:
In the project's main directory, in the terminal, type (in order):

    `touch .env'
    `ruby -e "require 'securerandom'; puts SecureRandom.hex(40)"'

Copy the long string of random characters, then open the .env file and type:

    `SESSION_SECRET = <INSERT CHARACTERS HERE>'

Now, all of your user passwords will be secure.

In the project's terminal, type (in order):

    `rake db:migrate' > Sets up the database & necessary tables
    `rake db:seed' > OPTIONAL: Fills the database with dummy data to provide a more immersive experience
    `shotgun' > Starts the server on your local machine

After running 'shotgun', take note of the port displayed in the terminal (usually 9393), then in your browser, go to "localhost:(PORT)"

## Built With
  - [Corneal](https://github.com/thebrianemory/corneal) - Used to create scaffolding for some models, views, & controllers
  - [Contributor Covenant](https://www.contributor-covenant.org/) - Used
    for Contributing section of README
  - [MIT License](LICENSE) - Used to choose
    the license

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/fancybandit/realtor-deed-mvc This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## Authors

  - **Jacob Klimenko** - *Created project in it's entirety* -
    [FancyBandit](https://github.com/fancybandit)

## License

This project is licensed under the [MIT](LICENSE) License - see the [LICENSE](LICENSE) file for
details

## Acknowledgments

  - Thank you Brian Emory for creating the Corneal gem, used to help create the scaffolding for this project's models, views, & controllers: https://github.com/thebrianemory/corneal
  - Thank you to my coaches, Matteo & Katie, for helping me with motivation & questions through the creation of this project during a personally very demanding time.