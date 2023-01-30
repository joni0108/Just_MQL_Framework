# February 2023 | v3.0
**Update 3.0.1**: What was fixed?
#
Welcome to the <date> release of Just MQL Framework. Below is a list with all the updates of this version.

- **[Now the framework is 100% compatible with MQL4 & MQL5](#100-compatibility-added)** - Now you can code any script, indicator, and ea in this framework to be fully compatible with MQL4 and MQL5.
- **[Better Documentation](#improved-documentation)** - A remake of the documentation was made.
- **[Built-ins Includes Extended](#more-compatibility-less-code)** - Added some libraries to extend the current built-in includes libraries of Metatrader.
- **[Automated Installation](#automatic-installation)** - Now the framework can be installed with a double click.
- **[Normalized Versions System](#normalized-versions)** - Now we have adapted the regular `xx.yy.zz` version system.
- **[New Libraries, new features](#new-libraries)** - Lot of new useful libraries were added.

# Development
## 100% Compatibility Added
We just didn't stopped in the most important functions, we have covered all the definitions, functions, and syntax that were not compatible between both languages. <br><br>
Now we are happy to say with this version that using Just MQL Framework you can code anything you want in MQL, being fully compatible for MQL4 and MQL5. <br><br>

## More compatibility, less code
Instead of re-creating the classes as we did in the version 1 and 2, for this version we are using the built-in libraries provided by Metaquotes in order to do some of our libraries extending them instead of re-making them. <br><br>
This improved the framework by having a most structured code, and loading only the code required instead of the same code in 2 different files.
<br><br>

## New Libraries
Lot of new libraries were added for this version release. The list of the new libraries is below:

- CName

In order to see the whole library list, please go to our [documentation's main file](docs/Home.md).<br><br>

# User-Friendly
## Improved Documentation
All the documentation was re-created. Now with a most professional and informative design, with all the code example tested and working. <br><br>

## Automatic Installation
The framework in this version included a `setup.bat` file which will detect all your Metatrader platforms data folders, and copy in the specific folders what the framework needs to work properly.<br><br>

## Normalized Versions
Now the versions system was normalized from `xx.yy` to `xx.yy.zz` where:
- `xx` is the main version number. An increment in this number means that the framework syntax is not longer compatible with previews versions.
- `yy` is the features number. An increment in this number means that one or more libraries and features were added to the framework, and maybe some other improvement, but the syntax is fully compatible with all the previews versions of the same `xx` number.
- `zz` is the hotfix number. An increment in this number means that a bug was fixed, something was improved in the current libraries and it is fully compatible with previews versions, however, no new library or feature was added