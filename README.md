# AppCritic

> An app for sharing criticism and ratings of apps.

This is an MVP version of twitter. I've adapted it to share opinions about specific apps. Users can add a new app for everyone to critique, and they can follow eachother as well.

# Video Presentation

Check out the video presentation for this project [here](https://youtu.be/kzKFd2JS-H0)!

# Screenshots

![screenshot](screenshots/screenshot1.png)

![screenshot](screenshots/screenshot2.png)

## Built With

- Ruby 2.6.5
- Rubocop 
- RSpec 
- Visual Studio Code 

## Live Demo

Check out the live demo [here](https://calm-hamlet-19158.herokuapp.com/)


### Prerequisites

Make sure you [install Ruby](https://www.ruby-lang.org/en/documentation/installation/) and have the following packages installed before continuing:

```
$ gem install bundler rspec 
```


### Install

To test AppCritic locally, clone the repository, navigate to it's containing directory, and run:

```
$ bundle install
$ rails db:migrate
```

This should install all ruby gems. Make sure you also have a proper `application.yml` file with your [Cloudinary](https://cloudinary.com/documentation/rails_integration) credentials. Example:

```
---
development:
  cloud_name: my_cloud_name
  api_key: '123123132123123'
  api_secret: xqPEy_xXxXxXXXxxxxXXXXxxXXx
  enhance_image_tag: true
  static_file_support: false
production:
  cloud_name: my_cloud_name
  api_key: '123123132123123'
  api_secret: xqPEy_xXxXxXXXxxxxXXXXxxXXx
  enhance_image_tag: true
  static_file_support: true
test:
  cloud_name: my_cloud_name
  api_key: '123123132123123'
  api_secret: xqPEy_xXxXxXXXxxxxXXXXxxXXx
  enhance_image_tag: true
  static_file_support: false

```

### Run tests

Running `rspec` will test AppCritic's functionalities. Navigate the `spec` directory to find out how the tests are performed.

### Deployment

You may deploy AppCritic on Heroku by running the following commands in the repo directory:

```
$ heroku create
$ git push heroku master
$ figaro heroku:set -e production
$ heroku open
```

## Author

**Oscar Mier**
- Github: [@voscarmv](https://github.com/voscarmv)
- Twitter: [@voscarmv](https://twitter.com/voscarmv)
- Linkedin: [Oscar Mier](https://www.linkedin.com/in/oscar-mier-072984196/) 

## Future features and improvements

- Add Instant Messaging.
- Add user tagging.
- Add rich text posts with images (to share memes).

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- Special thanks to [Alexis](https://github.com/Psiale) and [Leonardo](https://github.com/leonmezu1) for their help with this project!

## 📝 License

This project is MIT licensed.
