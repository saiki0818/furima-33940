# README

## usersテーブル

# README

## usersテーブル

|  Column      |  Type      |  Options       |
|  ----------  |  --------  |  ------------  |
|  nickname    |  string    |  null:  false  |
|  email       |  string    |  null:  false  |
|  password    |  string    |  null:  false  |
|  name        |  string    |  null:  false  |
|  birthday    |  string    |  null:  false  |

### アソシエーション

- has_many :products
- has_many :buyers

## productsテーブル

|  Column        |  Type       |  Options       |
|  ------------  |  ---------  |  ------------  |
|  product_name  |  string     |  null:  false  |
|  description   |  text       |  null:  false  |
|  category      |  string     |  null:  false  |
|  state         |  string     |  null:  false  |
|  deliver_fee   |  string     |  null:  false  |
|  shipment      |  string     |  null:  false  |
|  shipment_day  |  string     |  null:  false  |
|  price         |  string     |  null:  false  |
|  seller        |  reference  |                |

＊imageはActiveStorageで実装

### アソシエーション

- belongs_to :user
- belongs_to :buyer

## buyersテーブル

|  Column   |  Type       |  Options       |
|  -------- |  ---------  |  ------------  |
|  user     |  reference  |                |
|  product  |  reference  |                |


### アソシエーション

- belongs_to :user
- belongs_to :product


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

- has_one :buyer