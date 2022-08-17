# Redmine Wiki Diff Alternative

This plugin provides another wiki diff view.

## Features

- Show wiki inline diff view.
- Show wiki side by side diff view.

## Installation

1. Download plugin in Redmine plugin directory.
   ```sh
   git clone https://github.com/9506hqwy/redmine_wiki_diff_alternative.git
   ```
2. Install dependency libraries in Redmine directory.
   ```sh
   bundle install --without development test 
   ```
3. Install plugin in Redmine directory.
   ```sh
   bundle exec rake redmine:plugins:migrate NAME=redmine_wiki_diff_alternative RAILS_ENV=production
   ```
4. Start Redmine

## Configuration

1. Enable plugin module.

   Check [Another Wiki Diff View] in project setting.

## Tested Environment

* Redmine (Docker Image)
  * 3.4
  * 4.0
  * 4.1
  * 4.2
  * 5.0
* Database
  * SQLite
  * MySQL 5.7
  * PostgreSQL 12

## References

- [#26400 Side by side diff view in wiki](https://www.redmine.org/issues/26400)