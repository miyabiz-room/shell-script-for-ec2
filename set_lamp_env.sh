#!/bin/sh

sudo yum update -y

# lamp-mariadb10.2-php7.2 と php7.2 Amazon Linux Extras リポジトリをインストールして､LAMP MariaDB と Amazon Linux 2 PHP パッケージの最新バージョンを取得します。
sudo amazon-linux-extras install -y lamp-mariadb10.2-php7.2 php7.2

# Apache ウェブサーバー、MariaDB、PHP ソフトウェアパッケージをインストールします。
sudo yum install -y httpd mariadb-server

# Apache ウェブサーバーを起動します。
sudo systemctl start httpd

# systemctl コマンドを使用して、システムがブートするたびに Apache ウェブサーバーが起動するように設定します。
sudo systemctl enable httpd

# ユーザー (この場合は ec2-user) を apache グループに追加します。
sudo usermod -a -G apache ec2-user

# /var/www とそのコンテンツのグループ所有権を apache グループに変更します。
sudo chown -R ec2-user:apache /var/www

# グループの書き込み許可を追加して、これからのサブディレクトにグループ ID を設定するには、/var/www とサブディレクトのディレクトリ許可を変更します。
sudo chmod 2775 /var/www && find /var/www -type d -exec sudo chmod 2775 {} \;

# グループ書き込み許可を追加するには、/var/www とサブディレクトリのファイル許可を再帰的に変更します。
find /var/www -type f -exec sudo chmod 0664 {} \;

# MariaDB サーバーを起動します。
sudo systemctl start mariadb

# mysql_secure_installation を実行します。
sudo mysql_secure_installation -y

# sudo systemctl stop mariadb
sudo systemctl enable mariadb
