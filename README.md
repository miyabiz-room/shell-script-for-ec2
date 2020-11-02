# shell-script-for-ec2
みやびの部屋の提供する[EC2のシェルスクリプト](https://github.com/miyabiz-room/ShellScript-for-EC2/tree/main)です。

1.  git cloneコマンド

    ```
    git clone -b lamp-01 https://github.com/miyabiz-room/CloudFormation-Template.git
    ```

## 構築内容
  - Apache
  - php
  - MySQL

## AWS リソース構築手順
1.  下記を実行してミドルウェアをインストール

    ```
    ./set_lamp_env.sh
    ```

## 関連情報
  - [[AWS] チュートリアル: Amazon Linux 2 に LAMP ウェブサーバーをインストールする](https://docs.aws.amazon.com/ja_jp/AWSEC2/latest/UserGuide/ec2-lamp-amazon-linux-2.html)

