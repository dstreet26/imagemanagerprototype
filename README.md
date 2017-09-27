# Image Asset Manager Prototype

Note: requires postgres and imagemagick and a C compiler

# Installing and Running

## Clone the repo

`git clone https://github.com/dstreet26/imagemanagerprototype`

`cd imagemanagerprototype`

## Get dependencies

`mix deps.get`

`mix ecto.create`

`mix ecto.migrate`

`cd assets && npm install`

Start it with `mix phx.server` from the root directory

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

