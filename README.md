# Redmine Wiki Diff Alternative

This plugin provides another wiki diff view.

## Features

- Show wiki inline diff view.
- Show wiki side by side diff view.
- Show wiki diff preview for editing (Redmine4.0 or later).

## Installation

1. Download plugin in Redmine plugin directory.
   ```sh
   git clone https://github.com/9506hqwy/redmine_wiki_diff_alternative.git
   ```
2. Install dependency libraries in Redmine directory.
   ```sh
   bundle install --without development test
   ```
3. Start Redmine

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
  * 5.1
  * 6.0
* Database
  * SQLite
  * MySQL 5.7 or 8.0
  * PostgreSQL 12

## References

- [#26400 Side by side diff view in wiki](https://www.redmine.org/issues/26400)
