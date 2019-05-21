# README - Bookmark Manager

The website will have the following specification:

- Show a list of bookmarks
- Add new bookmarks
- Delete bookmarks
- Update bookmarks
- Comment on bookmarks
- Tag bookmarks into categories
- Filter bookmarks by tag
- Users are restricted to manage only their own bookmarks

### User Stories

As a user,
So I can view websites that I think are interesting,
I'd like to see a list of my saved websites.

![user-story-1-diagram](./images/User-Story-1.png)


### Setting up a database

* Install PostgreSQL - used `brew install postgresql`
* Started PostgreSQL via `brew services start postgresql`
* Enter postgres through `psql postgres`
* Create a database `CREATE DATABASE bookmark_manager`
* Show databases `\l`
* Connect to a database `\c bookmarks`
* Create a new table. Where `id` is the primary key and `url` has a varchar of 60:
```
CREATE TABLE bookmarks(id SERIAL PRIMARY KEY, url VARCHAR(60));
```
* Show table `\dt`
* Delete a table `DROP TABLE bookmarks;`

## Getting Started

### To set up the database

1. Install PostgreSQL - used `brew install postgresql`.
2. Started PostgreSQL via `brew services start postgresql`.
3. Create the database using the `psql` command `CREATE DATABASE bookmark_manager;`.
4. Connect to the database using the `pqsl` command `\c bookmark_manager;`.
5. Run the query we have saved in the file `01_create_bookmarks_table.sql`.

### To run the Bookmark Manager app

1. Run `rackup -p 3000` from the command line.

2. To view bookmarks, navigate to `localhost:3000/bookmarks`.
