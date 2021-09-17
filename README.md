# MANA.app

Credits : 

* By Germain Longchamp and Calvin Ponsot and really good advices and help by Remi Calizzano aka airKlizz
* Developement Starting : 08/03/2021

## Installation

> Use [`rbenv`](https://github.com/rbenv/rbenv) to deal with multiple Ruby environnements.

Make sure to :

* use Ruby version 2.7.0
* have SQLite3 installed
* have Node.js and Yarn installed

Now run the following commands to install all the dependencies:

```bash
gem install bundler
bundler install
yarn install --check-files
```

Then run: `rails db:migrate` to create the database.

You should be now ready to go and start the server by running:

```
rails server
```

If everything goes well, the application is running at: http://localhost:3000/
