# pamer
Subscription package manager

## Information

With Pamer you can create Packages and Items into it. As you can see in the example above with the basic package you can send only 4 emails and you have support. With the professional package you can send 10 e-mails.

    __________________  ________________________
    | Basic package  |  | Professional package |
    |                |  |                      |
    |   4 x e-mails  |  |   10 x e-mails       |
    |   support      |  |   Item 4             |
    |________________|  |______________________|

When your user orders the Basic package

* You can check if the user ordered the e-mails pack
* You can decrement the available e-mail number and check if it's greather than zero
* When the user reaches zero Pamer offers the extension of the order

## Getting started

Pamer works with Rails 4.0. You can add it to your Gemfile with:

`gem 'pamer'`

Run the bundle command and install it.

After you install Pamer you have to create the migration files.

`rake pamer:install:migrations`

Run your migration with:

`rake db:migrate`

## Usage

Check if the user can use the package:

`Pamer::PamerPolicy.valid?(':teszt', User.last.id)`

Decrement the available number of items with 1:

`Pamer::PamerPolicy.decrement!('item_keyword', current_user.id)`

Decrement the available number of items with n:

`Pamer::PamerPolicy.decrement!('item_keyword', current_user.id, [n])`

## TODO

Changegroup - az egy csoportba tartozó csomagok közül egyszerre csak egy lehet megvásárolva