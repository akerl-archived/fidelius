fidelius
=========

[![Build Status](https://img.shields.io/circleci/project/akerl/fidelius/master.svg)](https://circleci.com/gh/akerl/fidelius)
[![Coverage Status](https://img.shields.io/codecov/c/github/akerl/fidelius.svg)](https://codecov.io/github/akerl/fidelius)
[![Code Quality](https://img.shields.io/codacy/6ca6971ad8c74fa794aa296e2ca4316e.svg)](https://www.codacy.com/app/akerl/fidelius)
[![MIT Licensed](https://img.shields.io/badge/license-MIT-green.svg)](https://tldrlegal.com/license/mit-license)

Password strength checking API, inspired by [this HackerNews comment](https://news.ycombinator.com/item?id=9025017)

## Usage

The following commands will download and run the fidelius web service on localhost:3000

```
git clone git://github.com/akerl/fidelius
cd fidelius
bundle install
thin start
```

To run a "production" service on port 80, use `thin start -p 80 -e production`. For more info on how to invoke thin, use `thin -h`.

To use the History validator, you need to have Redis installed, running, and listening on localhost:6379.

## License

fidelius is released under the MIT License. See the bundled LICENSE file for details.

