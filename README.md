#  NVChad 2.5 Configuration Repository

This repository contains my personal NVChad configuration, tailored for version **2.5**.
OS: macOS, Ubuntu
---

##  Status of Language Support

| Technology | Status        | Debuging          |
|------------|---------------|-------------------|
| PHP        | ✅ Ready      | 🔎 Being tested   |
| Vue.js     | ✅ Ready      | ❌ Not configured | 
| JavaScript | ✅ Ready      | ❌ Not configured |
| CSS        | 🚧 In Process |                   |

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
- CSS integrations are currently in progress.

## Vista.vim
This build also includes a setting for [vista.vim](https://github.com/liuchengxu/vista.vim) that allows you to view the methods of the file being developed.  
In order for it to work correctly, you need to specify the use of nvim_lsp for the language you are using in the ```/lua/configs/vista.lua file```.  
You can follow the same example that is in the file itself. In the future, as my development progresses, I will add more languages as needed.  
For information about this module and its available commands for configuration, you can call the command ```:help vista-commands```.  

You also need to install ctags.
Here's how to do it:

```
    $ git clone https://github.com/universal-ctags/ctags.git
    $ cd ctags
    $ ./autogen.sh
    $ ./configure  # use --prefix=/where/you/want to override installation directory, defaults to /usr/local
    $ make
    $ make install # may require extra privileges depending on where to install
```

Without ctags, it will not work, so you will need to install it as described above.  
If you are interested in digging deeper and seeing what it is, you can go to github [ctags](https://github.com/universal-ctags/ctags/).  
I also reassigned the key combination ```<leader> + v```.
It calls the ```:Vista``` command to open the file tree and ```:Vista!``` when pressed again to close it.

## Copilot  

Added Copilot support.  

The repository that was connected - [Copilot repository](https://github.com/github/copilot.vim).  
To enable Copilot, you must first install it by entering the command ```:Copilot setup```.  
During setup, Copilot will generate a code that you will need to enter on the connection page (a browser will open and ask you to connect).  
And Copilot begin to work.  
**Note**: Copilot requires Node.js version > v20 to work.  

## Debuging for php
>_Instructions in process

>_Further instructions in development

## Commands for help: 
- :h nvui
