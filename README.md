# README
# アプリ名
フリマアプリ


アプリケーションの概要
ユーザーを登録すると商品を出品できるようになります。自身が出品した商品は、編集と削除をすることができます。他のユーザーが出品した商品は、クレジットカードを用いて購入することができます。


# URL 
AWS EC2によるデプロイ
http://54.168.133.198/

Basic認証
ID: admin
Pass: 2222

# テスト用アカウント
#### 購入者用
メールアドレス: qqq@qqq
パスワード: qqq111

#### 購入用カード情報(PAYJPテスト用)
番号：4242424242424242
期限：12月/23年（未来の年月であれば可能）
セキュリティコード：123

#### 出品者用
メールアドレス名: aaa@aaa
パスワード: aaa111


# 実装機能

## 1.トップページ
[![Image from Gyazo](https://i.gyazo.com/27dbc1d9f177044f7effaa1e8de05800.gif)](https://gyazo.com/27dbc1d9f177044f7effaa1e8de05800)

[![Image from Gyazo](https://i.gyazo.com/27dbc1d9f177044f7effaa1e8de05800.gif)](https://gyazo.com/27dbc1d9f177044f7effaa1e8de05800)

## 2.ユーザー登録機能
ユーザー登録することで出品・購入できるようになります。（ユーザー登録していない人でも出品している商品を見ることは可能です。）

[![Image from Gyazo](https://i.gyazo.com/1e863ca3beedf0f99c011860a6d21737.gif)](https://gyazo.com/1e863ca3beedf0f99c011860a6d21737)


## 3.商品出品機能
商品画像を選択し、商品情報や販売したい金額を入力すると、出品することができます。（JavaScriptで販売手数料が表示されるようになっています。）

[![Image from Gyazo](https://i.gyazo.com/204bc5a06b1b40904436c803fb131e4f.gif)](https://gyazo.com/204bc5a06b1b40904436c803fb131e4f)



## 4.商品の編集機能
出品した商品について、編集することができます。その際に、ユーザーの手間を省くため出品時の情報が表示されるようになっています。

[![Image from Gyazo](https://i.gyazo.com/a3a31ba8bc8433b5bb9c0bf7e4feb322.gif)](https://gyazo.com/a3a31ba8bc8433b5bb9c0bf7e4feb322)


## 5.商品の削除機能
出品中であった商品について、削除ボタンを押すことで商品を削除することができます。

[![Image from Gyazo](https://i.gyazo.com/a529caa85e9eaeede06756b25bfbe331.gif)](https://gyazo.com/a529caa85e9eaeede06756b25bfbe331)


## 6.商品の購入機能
出品者以外であれば、商品を購入することができます。カード情報と配送先を入力すると購入できます。（JavaScriptとフォームオブジェクトを使用し、トークン化したカード情報をPAY.JPに送付しつつ、カード情報がアプリケーションのデータベースに保存されないように設計しています。）

[![Image from Gyazo](https://i.gyazo.com/9cfd9a3d3ca514fa9cbaaad4b490feff.gif)](https://gyazo.com/9cfd9a3d3ca514fa9cbaaad4b490feff)


# テーブル設計
## ER図

[![Image from Gyazo](https://i.gyazo.com/3d52a53b49a20f9b814f34214eab41b1.png)](https://gyazo.com/3d52a53b49a20f9b814f34214eab41b1)

# 画面遷移図


# 環境開発
・ruby 2.6.5
・Rails 6.0.6.1
・MySQL 14.14

# ローカルでの動作方法
