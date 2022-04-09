
<p align="center">
  <img alt="Unsplash black shoulder-mount" src="https://images.unsplash.com/photo-1590179068383-b9c69aacebd3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=250&q=80" />
</p>

<h3 align="center">
  OscarApp API
</h3>

<p align="center">“A fictional oscar voting”!</blockquote>
<p align="center">Develop to "DS151 - Desenvolvimento para Aplicativos Móveis", UFPR</p>
<p align="center">TDD api requests with RSpec</p>

<p align="center">
  <img alt="GitHub repo size" src="https://img.shields.io/github/repo-size/renanrudney/oscarApp_api">
  <img alt="GitHub contributors" src="https://img.shields.io/github/contributors/renanrudney/oscarApp_api">
</p>

## Prerequisites

Before you begin, ensure you have met the following requirements:
* You have installed the 3.0.0 version of Ruby

## Installing Project

To install dependencies, run:

```
gem install bundler
bundle install
```

## Using Project

To use, follow these steps:

```
rails s
```

Or run tests:
```
rspec
```

### Aplication Routes
If you want to test on insomnia, postman or similar: [Import this json](./examples.json).

- **`POST /auth`** { `login`, `password`} : authenticate a user;
- **`POST /choices`** { `remote_director_id`, `remote_movie_id` }, headers: { `login`, `token` } : oscar voting!


## Contributing
To contribute to "oscarApp_api", follow these steps:

1. Fork this repository.
2. Create a branch: `git checkout -b <branch_name>`.
3. Make your changes and commit them: `git commit -m '<commit_message>'`
4. Push to the original branch: `git push origin <project_name>/<location>`
5. Create the pull request.

Alternatively see the GitHub documentation on [creating a pull request](https://help.github.com/en/github/collaborating-with-issues-and-pull-requests/creating-a-pull-request).

