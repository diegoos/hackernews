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
