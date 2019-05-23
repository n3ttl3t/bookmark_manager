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
```
As a user,
So I can view websites that I think are interesting,
I'd like to see a list of my saved websites.
```
![user-story-1-diagram](./images/User-Story-1.png)

```
As a user,
So I can remember more bookmarks,
I'd like to be able to add to my list.
```
Add more to my list
- Go to add page
- Insert text of URL into a table
- Click submit button
- See bookmark page with new bookmark

### Learning Objectives

* Attach a database to a web application
* Setting up a testing environment for web application with a database

### Pairing notes

* Why is a database the best solution here? -> It can be manipulated by the program and accessed via PostgreSQL. Immediately available.

* [Postgres cheatsheet](http://www.postgresqltutorial.com/postgresql-cheat-sheet/)
* [PostgreSQL Command Line Cheat Sheet 2](https://blog.jasonmeridth.com/posts/postgresql-command-line-cheat-sheet/)

**SETTING UP A DATABASE**
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

* Commands beginning with a \ are psql-specific commands (e.g. connecting to databases using \c).
* Everything else is part of SQL (e.g. SELECT * FROM ...), so can be used with any SQL-based Relational Database.

* Introduction to CRUD (**c**reate, **r**ead(query), **u**pdate, and **d**elete)

**USEFUL SYNTAX**
* to display details of a table `\d`.
* Insert multiple rows:
```
INSERT INTO bookmarks VALUES(1, 'http://www.makersacademy.com'), (2, 'http://www.askjeeves.com'),...;
```
* Alternatively it can assume the id if you are adding the data iteratively:
```
INSERT INTO bookmarks (url) VALUES ('http://www.askjeeves.com'), ('http://www.twitter.com')...;
```
* Use `SELECT * FROM bookmarks;` to view all records in `bookmarks` table.
* Limit the number of records viewed to the top two using `SELECT * FROM bookmarks LIMIT 2;`.
* Or scoping specific data using `SELECT * FROM bookmarks WHERE url = 'http://www.makersacademy.com';`.
* To delete a record we use `DELETE FROM bookmarks WHERE url = 'http://www.twitter.com';`.
* To update / replace a record we can use `UPDATE bookmarks SET url = 'http://www.destroyallsoftware.com' WHERE url = 'http://www.askjeeves.com';`

**ATTACHING A DATABASE TO A WEB APPLICATION**

* install the `pg` gem. This is the Ruby interface to the PostgreSQL.

* Ruby code to draw data from a database. First of all run `require 'pg'` at the top of the file. Followed by this code in the class file:
```
# this assigns the 'bookmark_manager' database to 'conn'
conn = PG.connect(dbname: 'bookmark_manager')
# this extracts the table from 'bookmark_manager' and assigns it to 'result'
result = conn.exec("SELECT * FROM bookmarks;")
# this extracts the 'url' column and pushes to an array
result.map { |bookmark| bookmark['url'] }
```
postgresqltutorial.com
PostgreSQL Cheat Sheet - Download the Cheat Sheet in PDF Format
The PostgreSQL cheat sheet provides you with the common PostgreSQL commands and statements that enable you to work with PostgreSQL quickly and effectively.
Learn, Converse, Share
PostgreSQL Command Line Cheat Sheet

**INSTALLING AND CONNECTING TABLE PLUS**

* `PostgreSQL` server is running 'backgrounded' on the local machine, by default on `Port 5432`.

* Installed TablePlus:
 * Where it is -> localhost (i.e. your PostgreSQL server is running 'backgrounded' on your local machine, on Port 5432).
 * What login details are required -> Your computer's name as a username (or, you can find this out by listing databases in psql), and no password. (i.e. `student`)
 * What database should it start with -> The bookmark_manager database.

**SETTING UP A TESTING ENVIRONMENT**

* `psql`, `pg` and `TablePlus` are interfaces to the `PostgreSQL` server.

* Multiple environments in applications:
 * A **development** environment that runs locally on your computer, so you can click around it and work on it.
 * A **production** environment that runs remotely on someone else's computer, so other people on the internet can click around it.
 * A **test** environment that runs locally on your computer whenever you run your tests. It comes into being especially for your tests, and disappears straight after your tests finish.

  ```
  Additionally a staging environment, where your application runs remotely on someone else's computer, at a secret link so you can click  around it to check it's all working before it's moved to production.
  ```


 PROCESS FOR SETTING UP A TESTING ENVIRONMENT:
 * Set up a database for our test environment.
 * Set up an Environmental Variable to tell the application to start in the test environment.
 * Write a script that sets up the testing environment before our tests run.
 * Integrate the script with our test runner `rspec` so we don't have to think about it anymore.
