# Install Ruby 2.7

## **Windows**

To install Ruby, go to the site: [RubyInstaller.org / Downloads](https://rubyinstaller.org/downloads/);

Download the installer with DevKIT version 2.7, then just *"Next, Next, Install and Finish"*.

Then the **Command Prompt** will open: Press *Enter* and wait for it to finish.

---

## **Linux**

For Ruby installation we are going to use **RVM**(*Ruby Version Manager*).

- **[Install RVM](https://rvm.io/rvm/install)**:

  - Open the terminal and Install the GPG keys used to verify the installation package by running the following commands:

      ```bash
      sudo apt install gnupg2
      ```

      ```bash
      gpg2 --keyserver keyserver.ubuntu.com --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
      ```

  - Then install **RVM** by running the following command:

      ```bash
      \curl -sSL https://get.rvm.io | bash
      ```
  - And **Install** Ruby 2.7 already set as **default**:
  
      ```bash
      rvm install 2.7@global
      ```

---

## **MacOS**

For Ruby installation we are going to use **RVM**(*Ruby Version Manager*) and some other dependencies like **Xcode** and **Homebrew** -> **Wget**.

- **[Install Xcode](https://apps.apple.com/br/app/xcode/id497799835?mt=12)**:
  - Open the *App Store*, search and install "Xcode";
  - After installation, *Open Xcode and Accept the Terms of Agreement*.
  - Then open the terminal and run the following command:

      ```bash
      xcode-select --install
      ```

- **[Install Homebrew](https://brew.sh/)** (Wget):
  - Open the "Homebrew" Site and *follow the installation instructions*; 
  - After installation, open the terminal and install "wget" with the following command:

      ```bash
      brew install wget
      ```

- **[Install RVM](https://rvm.io/rvm/install)**:
  - Open the terminal and install **RVM** by running the following command:

      ```bash
      \curl -sSL https://get.rvm.io | bash
      ```
    
  - And **Install** Ruby 2.7 already set as **default**:

      ```bash
      rvm install 2.7@global
      ```

---

## How to use RVM? *(Linux our MacOS)*

- View installed Ruby versions:

    ```bash
    rvm list
    ```
  
- View other versions of Ruby available for Installation:

    ```bash
    rvm list known
    ```
  
- Install another version of Ruby:

    ```bash
    rvm install 2.7
    ```
  
- Install another version of Ruby and already set as default:

    ```bash
    rvm install 2.7@global
    ```
  
- Change the installed default version of Ruby:

    ```bash
    rvm use 2.7 --default
    ```
  
- Removing an installed version of Ruby:

    ```bash
    rvm remove ruby-3
    ```
