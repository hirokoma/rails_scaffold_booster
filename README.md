# Rails scaffold booster

This script automates the following tasks to facilitate the start of Rails application development.

- Run Scaffold
- Create PostgreSQL DB and user
- Install Bootswatch
- Install Devise
- Install Simple Form

## Requirements

The script should probably work on Unix-based OS such as Mac OSX and Linux.
I tested the script in the following environment.

- OSX 10.14
- Ruby: 2.5.3
- Ruby on Rails: 5.2.1
- Bootstrap: 3.0.0
- Bootswatch: 3.3.7
- Devise: 4.5.0

## How to use

### 1. Apply for a Twitter developer account

For Devise OmniAuth, you need Twitter's developer account.
Open [Twitter developer](https://developer.twitter.com/en/apps/create) and apply for it.
Then, create your new app by filling form like below.

```
# Application description (required)
With this application, you can browse, search, and post reviews of Korean and Chinese restaurant like ZOMATO.

# Website URL (required)
https://your/web/site.example.com

# Allow this application to be used to sign in with Twitter
Checked

# Callback URLs (required)
http://127.0.0.1:3000/users/auth/twitter/callback

# Tell us how this app will be used (required)
This application is a Web service that enables a user to post a review using Twitter account. Make it easier to login using Twitter so that many users can post it. Therefor we need only twitter id and we do not use other information.
```

### 2. Set up Google account.

In order to sign up using Email, you need a Google account that requires 2-step verification.
Open [Google Account](https://myaccount.google.com/security) and enable 2-step verification.
Then, issue a app password.


### 3. Configure on shell script.

Open `scaffold.sh` and rewrite the first paragraph.

```
APP_NAME_LOWER_CASE=my_app # Arbitrary project name
APP_NAME_UPPER_CASE=MY_APP # Arbitrary project name
APP_NAME_TO_DISPLAY="My App!!" # Used for the sender name of the email and the title of the Web page.
PROJECT_DIRECTORY=/path/to/your/project/directory # Your Rails application will be created here.
TWITTER_ID=XXXXXXXXXXXXXXXXXX # ID you got in step 1.
TWITTER_SECRET=XXXXXXXXXXXXXXXXXX # Secret you got in step 1.
GMAIL_USER=your_gmail_acount@gmail.com # Gmail account you used in step 2.
GMAIL_PASSWORD=XXXXXXXXXXXXXXXXX # Password you got in step 2.
FROM_ARRRESS=your_own_email@example.com # Used as the sender email. (Setting to enable transmission via Gmail is required.)
```

Do not change other lines.

### 4. Run this script.

Run the following command.

```
./scaffold.sh
```

## Demonstration

now writing...
