#  NVChad 2.5 Configuration Repository

This repository contains my personal NVChad configuration, tailored for version **2.5**.

---

##  Status of Language Support

| Technology | Status       |
|------------|--------------|
| PHP        | ✅ Ready      |
| Vue.js     | 🚧 In Process |
| JavaScript | 🚧 In Process |
| CSS        | 🚧 In Process |

> _Some parts of the configuration still require fine-tuning._

---

##  Getting Started

To install a clean NVChad setup, follow the official [installation guide](https://nvchad.com/docs/quickstart/install).

---

##  PHP Environment Configuration

If you're working locally and need to define specific PHP rules (e.g., for Intelephense), create an `intelephense.json` file in the root of your project.

###  Example: `intelephense.json`

```json
{
  "environment": {
    "phpVersion": "7.4",
    "shortOpenTag": false
  },
  "files": {
    "exclude": [
      "**/.git/**",
      "**/.svn/**",
      "**/.hg/**",
      "**/node_modules/**",
      "**/vendor/**",
      "**/runtime/**",
      "**/web/assets/**",
      "**/console/migrations/**.php"
    ]
  }
}
```
##  Summary
- Primary focus: NVChad 2.5 configuration for PHP, Vue, JS, and CSS development and more for future.
- PHP setup is ready to use.
- Vue, JS, and CSS integrations are currently in progress.

>_Further instructions in development
