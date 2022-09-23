![](https://img.shields.io/badge/Rails-5.2.8-informational?style=flat&logo=<LOGO_NAME>&logoColor=white&color=2bbc8a) ![](https://img.shields.io/badge/Ruby-2.7.4-orange)

<p align="center">
  <img src="https://user-images.githubusercontent.com/103782984/191810726-a781e16e-4ecc-4ef8-8b31-efe59fa82280.jpg" width=30% height=30%>
</p>

# Dreambook: Front-End

## Overview

This repo represents the front-end portion of a two-part project for Turing School of Software and Design's Back-End Engineering program.  

Have you wanted a space to jot down your dreams the second you wake up? Like the time you had a dream where WWE's Goldberg brought you flowers? How cool would it be if not only could you keep a track record of your dreams, but you were given movie and book recommendations based off of your dream?! In comes our application: Dreambook! Upon signing via a Google account, a user is brought to their dashboard where they can 'Record a Dream' and reference their previous dreams and movie and book recommendations. When recording a dream, users can enter a title for the dream, a description of their dream, and one keyword describing their dream. Users then can select from a dropdown bar a status for their dream, 'Shared' or 'Hidden'. If shared, all Dreambook users will be about to see that dream when visiting the 'Dreams' link from their dashboard and be able to comment on it. If hidden, the dream will only be accessible to the user. Our goal is to have a space where users can keep track of their dreams, get movie and book recommendations based off their dreams, and see what dreams others are having out in the world! 

The two repositories that make up this project can be found here: [Front-End repo](https://github.com/pdthomson/DreamBook_FE) & [Back-End repo](https://github.com/pdthomson/DreamBook_BE)

#### [Visit the Deployed Application Here](https://dreambook-frontend.herokuapp.com/)


## Table of Contents
  - [Design](#design)
  - [Setup](#setup)
  - [Running the Tests](#running-the-tests)
  - [Deployment](#deployment)
  - [Screenshots](#screenshots)
  - [Authors](#authors)


### Design
  * By splitting our project into two repositories, we have successfully implemented Service Oriented Architecture for future scalability. This Front-End repository is responsible for the user-facing views along with all services and controllers necessary to query our backend's API.  
  * Our team decided to use Google OAuth to log in a user. With Google OAuth, the user never has to provide sensitive credentials to our application.
  * One database is utilized on our front-end. This is for saving user information from Google OAuth to log in a user.

### Setup
#### Prerequisites
These setup instructions are for Mac OS.

This project requires the use of `Ruby 2.7.4` and `Rails 5.2.8`.
We also use `PostgreSQL` as our database.

##### Install Necessary Programs

1. Verify your machine has the correct version of Ruby installed (2.7.4).  You can check this by entering `ruby -v` from the command line.
    - To install, enter `rbenv install 2.7.4` from the command line.   

2. Verify your machine has the correct version of Rails installed (5.2.8).  You can check this by entering `rails -v` from the command line.
    - To install, enter `gem install rails -v 5.2.8` from the command line.

##### Local Repo Setup
1. Fork & Clone Repo
2. Run `bundle install`.
3. Setup database: `rails db:create`.

##### Google API Registration
1. Register a new app with Google Api Console and give consent.
2. Add a Credential, setting to 'External use' and 'Web Application', and give it a title (eg. 'Oauth Login').  Add the following URI to the redirect/callback field `http://localhost:3000/auth/google_oauth2/callback`.
3. Record the given Client_ID and Client_Secret.

##### Authorizing Application
1. Run `bundle exec figaro install` to set up the `application.yml` file to hide your sensitive credentials.
2. Add your credentials to `application.yml` as environment variables:
```
GOOGLE_CLIENT_ID: <add your client id>
GOOGLE_CLIENT_SECRET: <add your client secret>
RELOCATE_BE_DOMAIN: <add your backend server>
```

#### Running the Tests
To run our RSpec testing suite, run 'bundle exec rspec' from the command line.

#### Deployment
To run this project locally, enter `rails server` from the command line and visit `http://localhost:3000` to navigate to the homepage.  It is encouraged to visit this URL in an Incognito window of your browser to prevent needing to periodically delete cookies.

Start up the Back-End as instructed.

### Screenshots

#### Homepage
<img src="https://user-images.githubusercontent.com/103782984/191997509-49795c41-e443-4da9-b5ef-f0862805873f.png" width=80% height=80%>

#### Record a Dream
<img src="https://user-images.githubusercontent.com/103782984/191998498-e20e64fe-333a-4a34-96e2-4ab0356093a8.png" width=80% height=80%>

### Authors
  - **Tyler Caudill** - *Turing Student* - [GitHub Profile](https://github.com/TeeCaud) - [LinkedIn](https://www.linkedin.com/in/tyler-caudill-75885b240/)
  - **Shirley DeCesari** - *Turing Student* - [GitHub Profile](https://github.com/sdecesari) - [LinkedIn](https://www.linkedin.com/in/shirley-decesari-760950157/)
  - **Nikky Rojas** - *Turing Student* - [GitHub Profile](https://github.com/nikkyrojas) - [LinkedIn](https://www.linkedin.com/in/nikkyrojas/)
  - **Gwendolyn Ruiz** - *Turing Student* - [GitHub Profile](https://github.com/gwen-marina) - [LinkedIn](https://www.linkedin.com/in/gwendolyn-ruiz-329064238/)
  - **Bryce Simonds** - *Turing Student* - [GitHub Profile](https://github.com/brycesimonds) - [LinkedIn](https://www.linkedin.com/in/bryce-simonds/) - [Turing Alum Profile](https://terminal.turing.edu/alumni/1499-bryce-simonds)
  - **Parker Thompson** - *Turing Student* - [GitHub Profile](https://github.com/pdthomson) - [LinkedIn](https://www.linkedin.com/in/parker-thomson-a15a68146/)
