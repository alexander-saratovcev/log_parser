# LogParser

[![Rspec tests](https://github.com/alexander-saratovcev/log_parser/actions/workflows/tests.yaml/badge.svg)](https://github.com/alexander-saratovcev/log_parser/actions/workflows/tests.yaml)

## Description

Simple Ruby CLI tool to parse a file with visitors logs and print the following reports:

* Most page views
* Uniq page views

## How to install

* Clone this repository.

```bash
$ git clone https://github.com/alexander-saratovcev/log_parser
```

### Ensure you have installed (globally) the following software on your system:

* Ruby 3.0.0
* bundler

Run command:

```bash
$ bundle install
```

## Usage

Grant permissions to the executable file:

```bash
$ chmod +x bin/run.rb
```

Run the application:

```bash
$ bin/run.rb webserver.log
```

## Example script output:

```bash
$ bin/run.rb webserver.log

=================Most page views=================
/about/2 90 visits
/contact 89 visits
/index 82 visits
/about 81 visits
/help_page/1 80 visits
/home 78 visits
==============END Most page views================
=================Uniq page views=================
/index 23 uniq views
/home 23 uniq views
/contact 23 uniq views
/help_page/1 23 uniq views
/about/2 22 uniq views
/about 21 uniq views
==============END Uniq page views================
```

## Testing

* To run the RSpec tests:

```bash
rspec
```

## Approach description

* Use OO, SOLID, TDD

* Validates path missing and file extension
