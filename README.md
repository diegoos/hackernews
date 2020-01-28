# Hacker News

## Running project

To start the project, just run `rails s`.

> When run `rails s` it print some warnings, it are related to big [keyword arguments related change](https://www.ruby-lang.org/en/news/2019/12/12/separation-of-positional-and-keyword-arguments-in-ruby-3-0/).
>
> Use the command bellow to run without warnings:
> ```ruby
> RUBYOPT=-W:no-deprecated rails s
>```
>

## Cache

I've implemented a simple cache strategy using json files, if the cache file not exist, the main list os news might be loaded from the API.
But the search can not be loaded without cache for performance reasons.

To generate the cache files, you should use the following commands:

```sh
# Generate or regenerate the entire file (this a bit is slow)
$ rake hacker_news:cache:stories

# Append newest top stories to the cache file
$ rake hacker_news:cache:update_stories[top]

# Append newest stories to the cache file
$ rake hacker_news:cache:update_stories[new]
```

If you use `ZSH`, you may receive an error when try to update the cache.
So, you should try run the command with quotation marks, for example:

```sh
$ rake 'hacker_news:cache:update_stories[top]'

# or

$ rake 'hacker_news:cache:update_stories[new]'
```

## Development install

- Clone this repository.

- Install bundler

```sh
$ gem install bundler
```

- Install dependencies with `bundle install`.

### Editor

If you use Vscode, you can use the [Solargraph plugin](https://github.com/castwide/vscode-solargraph).

After installing the plugin, install the development tools.

```sh
gem install rubocop rcodetools solargraph
```
