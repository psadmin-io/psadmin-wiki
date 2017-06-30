# About this repository [![Build Status](https://travis-ci.org/psadmin-io/psadmin-wiki.svg?branch=master)](https://travis-ci.org/psadmin-io/psadmin-wiki)

This is the GitHub repo for the psadmin.io Community Wiki (<http://wiki.psadmin.io>)

## How to contribute

Fork the repository, read the rest of this README file and make some changes.
Once you're done with your changes send a pull request. Thanks!

## How to check your edit before sending PR

You can inspect how your edits will be reflected by the documentation site.

### Install dependencies

1. Make sure you have Ruby and RubyGems installed.

1. Install [bundler](http://bundler.io/):

    ```sh-session
    $ gem install bundler
    ```

1. Install application dependencies:

    ```sh-session
    $ bundle install --binstubs
    ```

### Generate documentation

Run

```sh-session
$ ./bin/jekyll build
```


### Run application server

You are now ready to start your documentation site, using Jekyll or Puma.
For documentation edits, Jekyll is sufficient.

#### Starting and inspecting edits with Jekyll

1. Run Jekyll server:

    ```sh-session
    $ ./bin/jekyll serve
    ```

1. Open [localhost:4000](http://localhost:4000/) in your browser.

