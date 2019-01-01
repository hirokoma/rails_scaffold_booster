# 以下のスクリプトの xxx 部分を任意のアプリ名(小文字)、XXX部分を同じアプリ名(大文字)に置換すれば基本的なアプリ立ち上げをすべて自動化できるようになる

# 動作確認済環境
- OSX 10.14
- ruby: 2.5.3
- rails: 5.2.1
- bootstrap: 3.0.0
- bootswatch: 3.3.7
- devise: 4.5.0

# 以下コマンドでPostreSQLに新規DBを作成
#psql postgres
#CREATE DATABASE xxx_development;
#CREATE USER xxx;
#ALTER USER xxx CREATEDB;
#ALTER USER xxx SUPERUSER;
#ALTER DATABASE xxx_development OWNER TO xxx;
#\quit

# 以下にアクセスしてTwitterAPPを新規作成
#open https://developer.twitter.com/en/apps/create

# Application description (required)
# With this application, you can browse, search, and post reviews of restaurants where you can eat hot dishes such as Korean and Chinese cuisine.

# Website URL (required)
# https://www.mahirokazuko.com/

# Allow this application to be used to sign in with Twitter
# Checked

# Callback URLs (required)
# http://127.0.0.1:3000/users/auth/twitter/callback

# Tell us how this app will be used (required)
# This application is a Web service that enables a user to log in and post a review. Make it easier to log in using Twitter so that many users can post it. Do not use other Twitter user information.


# 以下にアクセスしてGmailをアプリから使えるようにする (2段階認証を有効にしているGoogleアカウントで開くこと)
open https://myaccount.google.com/security

# 「アプリパスワード」をクリック
# アプリ名を入力してパスワードを生成する

# アプリ名の例： xxxのdeviseから登録確認メール送信

# ソースコード取得URLを定義
