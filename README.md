#### Package in Atom (html)

- `autocomplet-html-entities` 
- `emmet` 
- `css-snippets`
- `autoclose-html`



### 사전 준비

##### - VirtualBox 5.3.0

##### - vagrant 1.9.5msi

##### - Git Bash



##### In gitBash

`$ cd  ##최상단 경로 `

`$ mkdir vagrant`

`$ cd vagrant ##vagrant dir로 이동`

`$ vagrant init`

##### In Vagrantfile(위 경로에 init 이후 생긴 파일)

```
# 수정 및 추가
Vagrant::DEFAULT_SERVER_URL.replace('https://vagrantcloud.com')
Vagrant.configure("2") do |config|
config.vm.box = "ubuntu/xenial64"
config.vm.network "forwarded_port", guest: 3000, host: 3000
end
    
```

##### In gitBash

`$ vagrant up ##vagrant 컴퓨터 켜기` 

`$ vagrant ssh ##vagrant 접속`

###### In ubunto *(In gitBash)    ##ruby  version `2.4.4` 설치

```cmd
$ curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
$ curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
$ echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

$ sudo apt-get update
$ sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev nodejs yarn
```

##### Rails Guide

- [rails download]("https://gorails.com/]")
- ruby  version `2.4.4`

##### Using rbenv

```cmd
$ cd
$ git clone https://github.com/rbenv/rbenv.git ~/.rbenv
$ echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
$ echo 'eval "$(rbenv init -)"' >> ~/.bashrc
$ exec $SHELL

$ git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
$ echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
$ exec $SHELL

$ rbenv install 2.4.4
$ rbenv global 2.4.4  ##ruby command 사용 가능해짐
$ ruby -v
```

`$ gem install bundler`

`$ rbenv rehash #새로고침 변경사항 적용` 

###### Installing Rails (ver 5.2.0)

~~~cmd
$ curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
$ sudo apt-get install -y nodejs
$ gem install rails -v 5.2.0
$ rbenv rehash
$ rails -v
# Rails 5.2.0
~~~



##### ubunto 키고 끄기(vagrant) (* in gitbash)

- `cd`
- `cd vagrant`
- `vagrant up` #켜기
- `vagrant ssh` #접속
- `exit` #나가기
- `vagrant halt` #끄기



#### Vagrant에서 rails  시작

```cmd
$ cd /vagrant/   #공유폴더로 이동
$ rails new simpleapp #app  이름은 아무렇게나
#Project 생성 (window의 vagrant 폴더 내에 전부 생성됨)
$ cd simpleapp
$ rails s #rails 실행
```

