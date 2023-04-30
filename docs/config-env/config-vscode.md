# Config VS Code

In the VS Code extension store, search for and install the following plugins:

```text
Ruby
```

```text
Ruby Runner
```

```text
Ruby Language Colorization
```

```text
Ruby Solargraph
```

```text
Ruby Haml
```

```text
Cucumber (Gherkin) Full Support 
```

```text
Snippets and Syntax Highlight for Gherkin (Cucumber) 
```

```text
Gherkin Indent
```

```text
vscode-icons 
```

---

## After [installing Bundler](install-bundler.md) and above extensions

Open the project folder in the terminal and change the **Gemfile** by running the command:

```bash
bundle config set --local gemfile Gemfile.local
```

**After that, download the dependencies again.**

```bash
bundle install
```
