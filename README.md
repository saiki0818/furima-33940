# README

## usersテーブル

# README

## usersテーブル

|  Column                |  Type      |  Options       |
|  --------------------  |  --------  |  ------------  |
|  nickname              |  string    |  null:  false  |
|  email                 |  string    |  null:  false  |
|  encrypted_password    |  string    |  unique: true  |
|  name                  |  string    |  null:  false  |
|  name_kana             |  string    |  null:  false  |
|  birthday              |  date      |  null:  false  |

### アソシエーション

- has_many :products
- has_many :buyers

## productsテーブル

|  Column           |  Type       |  Options            |
|  ---------------  |  ---------  |  ------------       |
|  product_name     |  string     |  null:  false       |
|  description      |  text       |  null:  false       |
|  category         |  string     |  null:  false       |
|  state_id         |  integer    |  null:  false       |
|  deliver_fee_id   |  integer    |  null:  false       |
|  shipment_id      |  integer    |  null:  false       | 
|  shipment_day_id  |  integer    |  null:  false       |
|  price            |  integer    |  null:  false       |
|  seller           |  reference  |  foreign_key: true  |

＊imageはActiveStorageで実装

### アソシエーション

- belongs_to :user
- belongs_to :buyer

## buyersテーブル

|  Column   |  Type       |  Options            |
|  -------- |  ---------  |  -----------------  |
|  user     |  reference  |  foreign_key: true  |
|  product  |  reference  |  foreign_key: true  |


### アソシエーション

- belongs_to :user
- belongs_to :product
- has_one :buyer


## buyers_addressesテーブル

|  Column            |  Type       |  Options       |
|  ----------------- |  ---------  |  ------------  |
|  shipping_address  |  string     |  null:  false  |
|  postal_code       |  string     |  null:  false  |
|  region            |  string     |  null:  false  |
|  city              |  string     |  null:  false  |
|  house_number      |  string     |  null:  false  |
|  tell              |  string     |  null:  false  |


### アソシエーション

- belongs_to :buyers