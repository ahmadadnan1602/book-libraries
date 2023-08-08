# README

## Install

### Clone the repository

```bash
git clone https://github.com/ahmadadnan1902/book-libraries.git
cd book-libraries

```

### Check your Ruby version

```bash
ruby -v
```

The ouput should start with something like `ruby 3.2.2`

If not, install the right ruby version using rvm (it could take a while):

```bash
rvm install "ruby-3.2.2"
```

### Install dependencies

Using [Bundler](https://github.com/bundler/bundler):

```bash
bundle
```

### Update database.yml file
In database.yml file, edit the database configuration as required.

### Initialize the database

```ruby
rails db:create db:migrate db:seed
```
### Run rswag

```bash
rake rswag:specs:swaggerize 
```

### Serve

```ruby
rails s
```
And now you can visit the site with the URL http://localhost:3000/api-docs/index.html

[demo](https://github.com/ahmadadnan1902/book-libraries/assets/117168869/3e252650-f769-4836-98fa-35328aa43641)
### Additonal Info
if you create changes in spec folder
run below command

```bash
rake rswag:specs:swaggerize 
```