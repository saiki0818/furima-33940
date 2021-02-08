# README

## usersテーブル

# README

## usersテーブル

|  Column                |  Type      |  Options       |
|  --------------------  |  --------  |  ------------  |
|  nickname              |  string    |  null:  false  |
|  email                 |  string    |  unique: true  |
|  encrypted_password    |  string    |  null:  false  |
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
|  category_id      |  integer    |  null:  false       |
|  state_id         |  integer    |  null:  false       |
|  deliver_fee_id   |  integer    |  null:  false       |
|  shipment_id      |  integer    |  null:  false       | 
|  shipment_day_id  |  integer    |  null:  false       |
|  price            |  integer    |  null:  false       |
|  user             |  reference  |  foreign_key: true  |

＊imageはActiveStorageで実装

### アソシエーション

- belongs_to :user
- has_one  :buyer

## buyersテーブル

|  Column   |  Type       |  Options            |
|  -------- |  ---------  |  -----------------  |
|  user     |  reference  |  foreign_key: true  |
|  product  |  reference  |  foreign_key: true  |


### アソシエーション

- belongs_to :user
- belongs_to :product
- has_one :buyers_addresses


## buyers_addressesテーブル

|  Column            |  Type       |  Options            |
|  ----------------- |  ---------  |  -----------------  |
|  postal_code       |  string     |  null:  false       |
|  region_id         |  integer    |  null:  false       |
|  city              |  string     |  null:  false       |
|  house_number      |  string     |  null:  false       |
|  building          |  string     |                     |
|  tell              |  string     |  null:  false       |
|  buyer             |  reference  |  foreign_key: true  |


### アソシエーション

- belongs_to :buyers