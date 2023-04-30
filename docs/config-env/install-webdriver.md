# Install WebDriver

Open the **[ChormeDriver](https://chromedriver.chromium.org/downloads)** website and download the version according to your web browser.

---

## **Windows**

- Download the file for your web browser version;
- Unzip in folder ***"C:\Windows"***; Or create a folder of your own and add it to Environment Variables.

---

## **Linux**

Download the file for your web browser version, unzip the file, open the terminal in this folder and execute the following commands:

```bash
sudo mv chromedriver /usr/bin/chromedriver
```

```bash
sudo chown root:root /usr/bin/chromedriver
```

```bash
sudo chmod +x /usr/bin/chromedriver
```

---

## **MacOS**

Unzip the file, open the terminal in this folder and run the following commands:

```bash
sudo mv chromedriver /usr/local/bin
```

```bash
sudo chmod +x /usr/local/bin/chromedriver
```

- It is also possible to install from **[Homebrew](https://brew.sh/)** by running the following command:

    ```bash
    brew install --cask chromedriver
    ```
