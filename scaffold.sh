# User Config
APP_NAME_LOWER_CASE=my_app
APP_NAME_UPPER_CASE=MY_APP
APP_NAME_TO_DISPLAY="My App!!"
PROJECT_DIRECTORY=/path/to/your/project/directory
TWITTER_ID=XXXXXXXXXXXXXXXXXX
TWITTER_SECRET=XXXXXXXXXXXXXXXXXX
GMAIL_USER=your_gmail_acount@gmail.com
GMAIL_PASSWORD=your_gmail_password@gmail.com
FROM_ARRRESS=your_own_email@example.com

# Do not change the following setting.
SOURCE_PATH=https://raw.githubusercontent.com/hirokoma/rails_scaffold_booster/master/code

mkdir -p $PROJECT_DIRECTORY
cd $PROJECT_DIRECTORY
rails new $APP_NAME_LOWER_CASE -d postgresql
cd $APP_NAME_LOWER_CASE
wget $SOURCE_PATH/Gemfile -O Gemfile
bundle install --path vendor/bundle
gem install execjs
rails g bootswatch:install flatly

mkdir -p app/assets/stylesheets/flatly
mkdir -p app/views/pages
wget $SOURCE_PATH/app/assets/stylesheets/flatly/variables.less -O app/assets/stylesheets/flatly/variables.less
wget $SOURCE_PATH/app/assets/stylesheets/flatly/bootswatch.css.less -O app/assets/stylesheets/flatly/bootswatch.css.less
wget $SOURCE_PATH/app/assets/stylesheets/application.css -O app/assets/stylesheets/application.css
wget $SOURCE_PATH/config/routes.rb -O config/routes.rb
wget $SOURCE_PATH/app/controllers/pages_controller.rb -O app/controllers/pages_controller.rb
wget $SOURCE_PATH/app/views/pages/index.html.erb -O app/views/pages/index.html
wget $SOURCE_PATH/public/dummy_logo.png -O public/dummy_logo.png
wget $SOURCE_PATH/app/views/layouts/application.html.erb -O app/views/layouts/application.html.erb
wget $SOURCE_PATH/config/environments/development.rb -O config/environments/development.rb

rails g devise:install
rails g devise:views
rails g devise User
rm -f db/migrate/*_devise_create_users.rb

wget $SOURCE_PATH/app/models/user.rb -O app/models/user.rb
wget $SOURCE_PATH/db/migrate/20171231000000_devise_create_users.rb -O db/migrate/20171231000000_devise_create_users.rb

rails db:migrate

wget $SOURCE_PATH/config/initializers/devise.rb -O config/initializers/devise.rb
cat config/initializers/devise.rb | perl -pe "s/@@@/${APP_NAME_UPPER_CASE}/g" >_&&mv _ config/initializers/devise.rb

rails g controller omniauth_callbacks
wget $SOURCE_PATH/app/controllers/omniauth_callbacks_controller.rb app/controllers/omniauth_callbacks_controller.rb

echo "" >> ~/.bash_profile
echo "# My Rails APP -- ${APP_NAME_LOWER_CASE}" >> ~/.bash_profile
echo "export RAILS_APP_${APP_NAME_UPPER_CASE}_TWITTER_ID=${TWITTER_ID}" >> ~/.bash_profile
echo "export RAILS_APP_${APP_NAME_UPPER_CASE}_TWITTER_SECRET=${TWITTER_SECRET}" >> ~/.bash_profile
echo "export RAILS_APP_${APP_NAME_UPPER_CASE}_EMAIL_USER=${GMAIL_USER}" >> ~/.bash_profile
echo "export RAILS_APP_${APP_NAME_UPPER_CASE}_EMAIL_PASSWORD=${GMAIL_PASSWORD}" >> ~/.bash_profile
echo "export RAILS_APP_${APP_NAME_UPPER_CASE}_EMAIL_FROM_ARRRESS=\"${APP_NAME_TO_DISPLAY}\"\ \<${FROM_ARRRESS}\>" >> ~/.bash_profile
echo "export RAILS_APP_${APP_NAME_UPPER_CASE}_SMTP_SERVER=smtp.gmail.com" >> ~/.bash_profile

source ~/.bash_profile

rails generate simple_form:install --bootstrap

wget $SOURCE_PATH/config/application.rb -O config/application.rb
wget $SOURCE_PATH/config/locales/devise.ja.yml -O config/locales/devise.ja.yml

wget $SOURCE_PATH/app/views/devise/confirmations/new.html.erb -O app/views/devise/confirmations/new.html.erb
wget $SOURCE_PATH/app/views/devise/mailer/confirmation_instructions.html.erb -O app/views/devise/mailer/confirmation_instructions.html.erb
wget $SOURCE_PATH/app/views/devise/mailer/email_changed.html.erb -O app/views/devise/mailer/email_changed.html.erb
wget $SOURCE_PATH/app/views/devise/mailer/password_change.html.erb -O app/views/devise/mailer/password_change.html.erb
wget $SOURCE_PATH/app/views/devise/mailer/reset_password_instructions.html.erb -O app/views/devise/mailer/reset_password_instructions.html.erb
wget $SOURCE_PATH/app/views/devise/mailer/unlock_instructions.html.erb -O app/views/devise/mailer/unlock_instructions.html.erb
wget $SOURCE_PATH/app/views/devise/passwords/edit.html.erb -O app/views/devise/passwords/edit.html.erb
wget $SOURCE_PATH/app/views/devise/passwords/new.html.erb -O app/views/devise/passwords/new.html.erb
wget $SOURCE_PATH/app/views/devise/registrations/edit.html.erb -O app/views/devise/registrations/edit.html.erb
wget $SOURCE_PATH/app/views/devise/registrations/new.html.erb -O app/views/devise/registrations/new.html.erb
wget $SOURCE_PATH/app/views/devise/sessions/new.html.erb -O app/views/devise/sessions/new.html.erb
wget $SOURCE_PATH/app/views/devise/shared/_links.html.erb -O app/views/devise/shared/_links.html.erb
wget $SOURCE_PATH/app/views/devise/unlocks/new.html.erb -O app/views/devise/unlocks/new.html.erb

mkdir -p app/views/utils
wget $SOURCE_PATH/app/views/utils/_debug.html.erb -O app/views/utils/_debug.html.erb

mkdir app/views/users
wget $SOURCE_PATH/app/views/user_show.rb -O app/views/users/show.html.erb
wget $SOURCE_PATH/app/controllers/users_controller.rb -O app/controllers/users_controller.rb
wget $SOURCE_PATH/app/controllers/application_controller.rb -O app/controllers/application_controller.rb
wget $SOURCE_PATH/db/migrate/20171231000001_create_images.rb -O db/migrate/20171231000001_create_images.rb
wget $SOURCE_PATH/app/models/image.rb -O app/models/image.rb