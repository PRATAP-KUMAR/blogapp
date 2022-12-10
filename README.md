<a name="readme-top"></a>

<div align="center">

  <img src="murple_logo.png" alt="logo" width="140"  height="auto" />
  <br/>

  <h3><b>README</b></h3>

</div>

<!-- TABLE OF CONTENTS -->

# 📗 Table of Contents

- [📖 About the Project](#about-project)
  - [🛠 Built With](#built-with)
    - [Tech Stack](#tech-stack)
    - [Key Features](#key-features)
  - [🚀 Live Demo](#live-demo)
- [💻 Getting Started](#getting-started)
  - [Setup](#setup)
  - [Prerequisites](#prerequisites)
  - [Install](#install)
  - [Usage](#usage)
  - [Run tests](#run-tests)
  - [Deployment](#triangular_flag_on_post-deployment)
- [👥 Authors](#authors)
- [🔭 Future Features](#future-features)
- [🤝 Contributing](#contributing)
- [⭐️ Show your support](#support)
- [🙏 Acknowledgements](#acknowledgements)
- [❓ FAQ](#faq)
- [📝 License](#license)

<!-- PROJECT DESCRIPTION -->

# 📖 Blog App <a name="about-project"></a>

**Blog App** will be a classic example of a blog website. You will create a fully functional website that will show the list of posts and empower readers to interact with them by adding comments and liking posts.

## 🛠 Built With <a name="built-with"></a>

### Tech Stack <a name="tech-stack"></a>

<details>
  <summary>Client</summary>
  <ul>
    <li><a href="https://rubyonrails.org/">Ruby on Rails</a></li>
  </ul>
</details>

<details>
<summary>Database</summary>
  <ul>
    <li><a href="https://www.postgresql.org/">PostgreSQL</a></li>
  </ul>
</details>

<!-- Features -->

### Key Features <a name="key-features"></a>

- Its a blog app, that displays user names and posts on a blog. It stores all user names and comments they made

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LIVE DEMO -->

## 🚀 Live Demo <a name="live-demo"></a>

- [Not applicable yet](https://loom.com)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🚀 API Endpoints
````
POST   /api/v1/register
POST   /api/v1/login            
GET    /api/v1/users/:user_id/posts/:post_id/comments                                      
POST   /api/v1/users/:user_id/posts/:post_id/comments
GET    /api/v1/users/:user_id/posts/:post_id/comments/:id
GET    /api/v1/users/:user_id/posts
POST   /api/v1/users/:user_id/posts
GET    /api/v1/users/:user_id/posts/new
GET    /api/v1/users/:user_id/posts/:id
GET    /api/v1/users
POST    /api/v1/users
GET    /api/v1/users/:id
````

## 🚀 API Documentation
![image](https://user-images.githubusercontent.com/40719899/206862337-010f9403-8887-4601-b01c-9bac7b5a741a.png)


<!-- GETTING STARTED -->

## 💻 Getting Started <a name="getting-started"></a>

To get a local copy up and running, follow these steps.
````
git clone https://github.com/PRATAP-KUMAR/blogapp
cd blogapp
ls
````

### Prerequisites

In order to run this project you need:

```sh
 gem install rails
```

### Setup

Clone this repository to your desired folder:

<!--
Example commands:

```sh
  cd my-folder
  git clone git@github.com:myaccount/my-project.git
```
--->

### Database

To create some data to check the blog app,
use the commands in [this file](./create_database.txt) 

### Install

Install this project with:

<!--
Example command:

```sh
  cd my-project
  gem install
```
--->

### Usage

To run the project, execute the following command:

```sh
  rails server
```

### Run tests

Tests not yet implemented

### Deployment

Not yet deployed

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- AUTHORS -->

## 👥 Authors <a name="authors"></a>

👤 **Christian Iradukunda B.**

- GitHub: [@githubhandle](https://github.com/Christianib003)
- LinkedIn: [@LinkedIn](https://www.linkedin.com/in/christian-iradukunda/)

👤 **PRATAP PANABAKA**

- GitHub: [@githubhandle](https://github.com/PRATAP-KUMAR)
- Twitter: [@twitterhandle](https://twitter.com/PRATAP_TWT)
- LinkedIn: [LinkedIn](https://linkedin.com/in/pratap-kumar-panabaka)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- FUTURE FEATURES -->

## 🔭 Future Features <a name="future-features"></a>

- [ ] Setup and controllers
- [ ] Controllers specs
- [ ] Creating a data model

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTRIBUTING -->

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- SUPPORT -->

## ⭐️ Show your support <a name="support"></a>

If you like this project kindly give a start to this repository

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ACKNOWLEDGEMENTS -->

## 🙏 Acknowledgments <a name="acknowledgements"></a>

I would like to thank [Microverse](https://www.microverse.org/)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- FAQ (optional) -->

## ❓ FAQ <a name="faq"></a>

- **What is this repo for**

  - Its part of Microverse Currculum for Ruby on Rails Project

- **How long did you take to build this web app**

  - 3 Weeks

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LICENSE -->

## 📝 License <a name="license"></a>

This project is [MIT](./MIT.md) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>
