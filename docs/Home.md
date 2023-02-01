# Just MQL Framework Documentation

- [Just MQL Framework Documentation](#just-mql-framework-documentation)
- [Installation](#installation)
  - [Automatic Installation](#automatic-installation)
  - [Manual Installation](#manual-installation)
  - [Notes](#notes)
- [Usage](#usage)
    - [Notes](#notes-1)
  - [Importing the whole framework](#importing-the-whole-framework)
    - [Pros and Cons of Importing the whole framework.](#pros-and-cons-of-importing-the-whole-framework)
  - [Importing a whole module](#importing-a-whole-module)
    - [Pros and Cons of importing a module](#pros-and-cons-of-importing-a-module)
  - [Importing just a class](#importing-just-a-class)
    - [Pros and Cons of importing a module](#pros-and-cons-of-importing-a-module-1)
- [Modules and Classes](#modules-and-classes)
- [Improving the Framework](#improving-the-framework)
  - [Reporting and Suggesting Guidelines](#reporting-and-suggesting-guidelines)
  - [Pull Request Guidelines](#pull-request-guidelines)
    - [Notes](#notes-2)

# Installation
You can choose between the `automatic` and `manual` installation methods.

## Automatic Installation
If you have modified the Metatrader data folders, or do not want to copy the framework to all your Metatrader data folders, do not follow this method and use the [manual installation](#manual-installation).

1. Download an official release from the [Github Releases](https://github.com/justupcorp/Just_MQL_Framework/releases).
2. Unzip the code in your computer.
3. Double click the file with name `setup.bat` and it will do the whole installation for you in all the Metatrader data paths.
4. Include the framework in your project by following the [importation wiki](#usage).
5. You are free to go.

## Manual Installation
1. Download an official release from the [Github Releases](https://github.com/justupcorp/Just_MQL_Framework/releases).
2. Unzip the code in your computer.
3. Rename the folder to `Just_MQL_Framework` in order to the wiki examples to work and an easy importation to your projects.
4. Copy the Just_MQL_Framework folder to the path `MQL4/Include/` and `MQL5/Include/`.
5. From the path `MQL4/Include/Just_MQL_Framework/libraries/MQL4/`, copy the `.dll` and `.ex4` files to your `MQL4/Libraries/` folder. Please keep the name and orders of these files, do not add it into a new folder or change the name or will not be imported by the framework when needed.
6. From the path `MQL5/Include/Just_MQL_Framework/libraries/MQL5/`, copy the `.dll` and `.ex5` files to your `MQL5/Libraries/` folder. Use the same rule as above to avoid errors.
7. Include the framework in your project by following the [importation wiki](#usage).
8. You are free to go.


## Notes
If you are downloading the repository to `use it` and not for improve it, please, download the last official `stable` release. The last stable release will guarantee that the code has been tested multiple times and it is working. The `beta` releases are release that compiles and has been tested but not enough, just a superficial test; and the the source code from branches could have incomplete, bug and untested code.<br>
Also downloading the last release will guarantee that the [wiki](https://github.com/justupcorp/Just_MQL_Framework/wiki) will be `up-to-date` with this last `stable-release`.

# Usage
This framework version is structured in modules. You can import the `whole framework`, a `whole module` or just a single `class` from a module. This is up to you. <br>
In this wiki we will teach you the pros and cons of each mode with the syntax and example and you just import it based on your project demands.

### Notes
There are modules that are imported automatically from all modules and modules that have dependencies that are imported in an automatic way.

## Importing the whole framework
For do so, you must use the following code.
```cpp
#include <Just_MQL_Framework/modules/all.mqh>
```
This will include the file with name `all.mqh` in the path above and this file will include all the framework files and dependencies.

### Pros and Cons of Importing the whole framework.
| Pros                                                                     | Cons                        |
| :----------------------------------------------------------------------- | :-------------------------- |
| You will have all the files                                              | It will consume more memory |
| You will have access to all the features with just a single line of code |

## Importing a whole module
You can include a whole module of the task you are doing. Example: If you want to use your own libraries but want the base code to be compatible with both MQL4 and MQL5 versions, you just need to include the `main` module and will have all the compatibility.
<br>
For doing so, use the syntax `#include <Just_MQL_Framework/modules/<module name>.mqh>`.
<br>
In the following example, the `main` and `concepts` modules will be included:
```cpp
#include <Just_MQL_Framework/modules/main.mqh>
#include <Just_MQL_Framework/modules/concepts.mqh>
```

### Pros and Cons of importing a module
| Pros                                                        | Cons                                     |
| :---------------------------------------------------------- | :--------------------------------------- |
| You will have all the features of that module               | You most include other modules if needed |
| You will save in memory as just importing the needed module |

## Importing just a class
You can also include specific classes that you need for your specific project. 
<br>
For doing so, you must use the syntax `#include <Just_MQL_Framework/modules/<module name>/<class name>.mqh>`.
<br>
In the following example, you will be including the whole `main` module, and the `discord` class from the `APIs` module:
```cpp
#include <Just_MQL_Framework/modules/main.mqh>
#include <Just_MQL_Framework/modules/apis/discord.mqh>
```

### Pros and Cons of importing a module
| Pros                                          | Cons                                                       |
| :-------------------------------------------- | :--------------------------------------------------------- |
| You will have only the code piece you need    | You must include other classes and modules to be available |
| You will have the minimum memory use possible |

# Modules and Classes
Below there is a list of the current modules and classes in this version release.

| Modules | Sub-Modules                    | Description                                                               |
| :------ | :----------------------------- | :------------------------------------------------------------------------ |
| `Main`  |                                | This module allows the full compatibility of MQL4 & MQL5 in one code.     |
| ->      | [Ticks](modules/main/ticks.md) | Handle all the candlesticks informations                                  |
| ->      | [Info](modules/main/info.md)   | Handle all the information of the terminal and account                    |
| ->      | [Arrays](modules/main/arrays.md)    | Handle all arrays functions that are not compatible between MQL4 and MQL5 |

# Improving the Framework
You can improve the framework in too much ways:
- By reporting bugs.
- By suggesting features.
- By improving the documentation.
- By fixing bugs.
- By adding libraries or features to the actual libraries.
- And others ways.

## Reporting and Suggesting Guidelines
- Use the [issues](https://github.com/justupcorp/Just_MQL_Framework/issues) tab to open a new issue.
- Add the `bug` (for reporting bugs) or `enhancement` (for suggestions) tags.
- Do not use despective words and be objective with your suggestiong and report.
- In case of reporting a bug, please include a detailed description of what to do in order to replicate the bug, the platform used, etc. Use this file as your [bug template](../.temp/bugs_template.md).
- Use only `english` and `spanish` while opening a report or suggestion.

## Pull Request Guidelines
- Use always the `open` branch for your pull requests. This branch will be always up-to-date with the `main` branch which will be up-to-date with the most recent release.
- Include on your request a documentation on how to use the new library or a link to the documentation where the library comes from.
- A copyright of the code developer. If available any link to the original repository, or social network of the developer. If you are the developer of the new library, say that in the pull request and you reserve the right of adding the copyrights and credits or not.
- Include a description of what does this new library is and what is it for.
- If it is a bug fix of a current library, specify what bug or issue was fixed.
- If are new features or methods for a current library, please, specify details of what does each new methods do and how to use them.

### Notes
After each pull request for the `open branch`, we will:
1. Review the code. Check if it can be optimized.
2. Test the code. Test it for MQL4 and MQL5 to see and fix possible bugs if could have, if any.
3. Add the library to a module where it should be.
4. Add the documentation, and documentation references of this new feature.
5. Generate the examples of how to use it.
6. Add the copyright lines to the code header, if missing.
7. Make a pull request to the `dev` branch.
8. Merge the `dev` branch with the `main` with the new integration.
9. Make an official release of the new features or hotfix.