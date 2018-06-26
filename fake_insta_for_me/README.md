#### Post(1)

- posts 컨트롤러 `rails g controller posts index new create show edit update destroy` 
- post 모델`rails g model post title:string content:text `

#### Comment(N)

- comments 컨트롤러 

  - CRUD - Create

- comment 모델 

  - `rails g model comment content:string post_id:integer`

    

#### Devise

1. `devise` gem 설치

```ruby
# Gemfile
gem 'devise'
```

```
$ bundle install
```

1. devise 설치

```
$ rails generate devise:install
```

- `config/initialize/devise.rb` 만들어짐.

1. user 모델 만들기

```
$ rails generate devise user
```

- `db/migrate/20180625_devise_create_users.rb`
- `model/user.rb`
- `config/routes.rb` : devise_for :users

1. migration

```
$ rake db:migrate
```

1. routes 확인

   | new_user_session_path         | GET    | /users/sign_in(.:format)       | devise/sessions#new          |
   | ----------------------------- | ------ | ------------------------------ | ---------------------------- |
   | user_session_path             | POST   | /users/sign_in(.:format)       | devise/sessions#create       |
   | destroy_user_session_path     | DELETE | /users/sign_out(.:format)      | devise/sessions#destroy      |
   | user_password_path            | POST   | /users/password(.:format)      | devise/passwords#create      |
   | new_user_password_path        | GET    | /users/password/new(.:format)  | devise/passwords#new         |
   | edit_user_password_path       | GET    | /users/password/edit(.:format) | devise/passwords#edit        |
   |                               | PATCH  | /users/password(.:format)      | devise/passwords#update      |
   |                               | PUT    | /users/password(.:format)      | devise/passwords#update      |
   | cancel_user_registration_path | GET    | /users/cancel(.:format)        | devise/registrations#cancel  |
   | user_registration_path        | POST   | /users(.:format)               | devise/registrations#create  |
   | new_user_registration_path    | GET    | /users/sign_up(.:format)       | devise/registrations#new     |
   | edit_user_registration_path   | GET    | /users/edit(.:format)          | devise/registrations#edit    |
   |                               | PATCH  | /users(.:format)               | devise/registrations#update  |
   |                               | PUT    | /users(.:format)               | devise/registrations#update  |
   |                               | DELETE | /users(.:format)               | devise/registrations#destroy |

- 회원가입 : `get 'users/sign_up'`
- 로그인 : `get 'users/sign_in' `
- 로그아웃 : `delete 'users/sign_out'`

1. helper method

- `user_sign_in?`
  : 유저가 로그인 했는지 안했는지를 true/false 리턴

- `current_user`
  : 로그인되어있는 user 오브젝트를 가지고 있음

- `before_action :authenticate_user!`

  : 로그인 되어있는 유저 검증(필터)

1. View 파일 수정하기

```
$ rails generate devise:views users
```

1. [custom column 추가하기](https://github.com/plataformatec/devise#strong-parameters)

   1. migration 파일에 원하는 column추가

   2. `app/views/devise/registrations/new.html.erb` input 추가

   3. `app/controllers/application_controller.rb`

      ```ruby
        before_action :configure_permitted_parameters, if: :devise_controller?
      
        protected
      
        def configure_permitted_parameters
          devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
        end
      ```

      

```ruby
Post.find(1)
Post.first(3) # 앞에서부터 3개
Post.last(3) # 뒤에서부터 3개
Post.order(:title) # title column data기준으로 정렬
Post.order(title: :desc) # z~a
Post.order(title: :asc) # a~z
Post.where("title=?", "Golduck") # title column에서 data가 Golduck인 것을 찾아줘요
Post.where("title like ?", "%duck%") # title column에서 data에 duck이 들어간 것을 찾아줘요
Post.where.not("조건")
User.where("age > ? AND gender = ?", 25, "male") # 나이 25 초과, 남자
```

