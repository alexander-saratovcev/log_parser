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

## Testing

* To run the RSpec tests:

```bash
rspec
```

## Approach description

* Use OO, SOLID, TDD

* Validates path missing and file extension
