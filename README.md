[ruby-image]: https://img.shields.io/badge/ruby-2.7-red
[ruby-url]: https://www.ruby-lang.org/pt/
[cucumber-image]: https://img.shields.io/badge/cucumber-6.1.0-brightgreen
[cucumber-url]: https://cucumber.io/docs/installation/ruby/
[capybara-image]: https://img.shields.io/badge/capybara-3.35.3-purple
[capybara-url]: https://teamcapybara.github.io/capybara/
[rspec-image]: https://img.shields.io/badge/rspec-3.10.0-red
[rspec-url]: https://rspec.info/documentation/
[site_prism-image]: https://img.shields.io/badge/site_prism-3.7.1-black
[site_prism-url]: https://rdoc.info/gems/site_prism/frames
[report_builder-image]: https://img.shields.io/badge/report_builder-1.9-blue
[report_builder-url]: https://reportbuilder.rajatthareja.com/

# challenge-ecore-automation-web

### Business Feature
- [Requirement PDF](docs/Quality_Assurance_-_Test_Automation_Assessment.pdf)

### **Features Automated**
- [Login](features/specs/login.feature)
- [Invoice details](features/specs/invoice_details.feature)

## Project Structure

[![Ruby Version][ruby-image]][ruby-url]
[![Capybara Version][capybara-image]][capybara-url]
[![Cucumber Version][cucumber-image]][cucumber-url]
[![Rspec Version][rspec-image]][rspec-url]
[![SitePrism Version][site_prism-image]][site_prism-url]
[![ReportBuilder Version][report_builder-image]][report_builder-url]

```text
./
├── docs/
├── features/
│   ├── hooks/
│   ├── pages/
│   ├── specs/
│   ├── step_definitions/
│   └── support/
│       ├── config/
│       │   └── environments.yml
│       ├── helpers/
│       │   ├── secrets_helper.rb
│       │   └── steps_helper.rb
│       ├── env.rb
│       └── report_builder.rb
├── reports/
│   ├── report-builder/
│   └── screenshots/
├── .gitignore
├── cucumber.yml
├── Gemfile
├── Gemfile.lock
└── README.md
```

---

## Configuring Environment

We assume that you already ***have Ruby available in the terminal***, if you don't, follow a step by step.

- [Install Ruby 2.7](docs/config-env/install-ruby.md)

Now you will need **WebDriver** to use Web Browser and **bundler** to download ruby project package dependencies in ***"[Gemfile](Gemfile)"*** file.  

- [Install WebDriver](docs/config-env/install-webdriver.md)
- [Install Bundler](docs/config-env/install-bundler.md)

To develop locally we recommend using VS Code with some plugins:

- [Config VS Code](docs/config-env/config-vscode.md)

Install and configure an IDE with the "**[AWS Secrets Manager](https://docs.aws.amazon.com/secretsmanager/latest/userguide/intro.html)**" to be able to use SecretsManager to store data masses of the project tests.

- **[VSCode](https://docs.aws.amazon.com/toolkit-for-vscode/latest/userguide/setup-toolkit.html)**
- **[RubyMine](https://docs.aws.amazon.com/toolkit-for-jetbrains/latest/userguide/setup-toolkit.html)**

---

## Run Tests

To run the tests locally, open the project folder in the terminal and run the command:

```bash
cucumber
```

Or to run a specific test tag:

```bash
cucumber -t @myTag
```

---

## Change Execution Environments

By default the tests will run in the **QA** environment according to the "**[environments.yml](features/support/config/environments.yml)**" file.

Environments available for configuration:

- dev
- qa
- prod

To change the environment at runtime, add the "**ENV**" parameter in the terminal:

```bash
cucumber ENV=dev
```

To change the default environment, go to the "**[cucumber.yml](cucumber.yml)**" file and change line 4:

```text
default: (...) -p qa
```

---
If you want to point to a specific **URL**:

```bash
cucumber URL=http://environment-url.test
```
