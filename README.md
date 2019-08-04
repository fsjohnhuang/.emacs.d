# fsjohnhuang/.emacs.d
My personal emacs configuration on Ubuntu.

``` bash
$ emacs --version
GNU Emacs 24.5.1
```

Custom configurations are sorted by following modes:
* Python
* Org
* Markdown
* Web
* JavaScript
* JSON
* YAML

## Quickstart

1. Run `cd $HOME && rm .emacs.d -rf && git clone git@github.com:fsjohnhuang/.emacs.d.git`.
2. Install dependencies according to modes you want.

## Org
### Dependencies

``` elisp
<M-x> package-install <RET> org <RET>
```

## FrontEnd
Features:
1. HTML support
   1. Syntax check
   2. Auto completion
   3. Emmet support
2. CSS syntax check
3. SCSS syntax check
4. LESS syntax check(Todo)
6. JavaScript/ES6 support
   1. Syntax check
   2. Auto prettify(WIP: unify eslint and prettier)
   3. Auto completion(Todo)
7. TypeScript support(Todo)
   1. Syntax check
   2. Auto completion

### HTML
#### Dependencies

``` bash
# install backend for flycheck for HTML
sudo apt install tidy
```

### JavaScript/ES6
#### Dependencies

``` bash
# eslint: pluggable linter for JavaScript and jsx, requires Node.js>=8.10 and npm > 3.
# babel-eslint: to enable ES6 and jsx parsing for eslint.
# prettier: prettify the code style automatically before save files.
npm install eslint babel-eslint prettier
```

#### Configuration
1. Initialize .eslintrc in your project.
``` bash
eslint --init
```
2. Set `parser` to `babel-eslint` in .eslintrc. Template like below

``` yaml
parser: babel-eslint
plugins: []
env:
  - browser: true
  - es6: true
  - node: true
emacsFeatures:
  - arrowFunctions: true
  - blockBindings: true
  - classes: true
  - defaultParams: true
  - destructing: true
  - forOf: true
  - generators: true
  - modules: true
  - spread: true
  - templateStrings: true
```

#### Usage
1. Fold all function definitions `C-c C-f`
2. Unfold the function under cursor `C-c C-o`
3. Goto function definition `M-.`

### CSS/LESS/SCSS
#### Dependencies

``` bash
# install backend for flycheck for CSS/LESS/SCSS
npm install stylelint stylelint-config-standard -g
```

## Python
### Dependencies

``` bash
# Optional style formatter: autopep8 yapf
# Optional syntax check backend: mypy pycompile
pip install --user rope rope_py3k jedi isort pylint ipython
```

### Usage

Elpy offical: https://elpy.readthedocs.io/en/latest/index.html

1. REPL interaction
``` elisp
<C-M-x>, send the function definition to REPL buffer.
<C-c> <C-y> e, send the statement under the cursor to REPL buffer.
<C-c> <C-c>, send the buffer under the cursor to REPL buffer.
```

### QA

1. If you have trouble seeing error codes in IPython 7 with Emacs 24, try to uninstall IPython 7 then install IPython 6 instead.
2. If you build a web application by Flask, suggest to disable autopep8 style formatter which would trigger import sequence problem in Flask.
3. If auto complete is not available, run `<M-x> elpy-config` to check the Jedi has been installed or not, if not install yet, do it by `pip install jedi`.

## Flycheck
## Status Legend
|Status Description | Indicator |
| ----------------- | ------------------ |
|A syntax check is now running in the current buffer | FlyC*|
|The current syntx check finished normally without errors or warnings| FlyC|
|The current syntx check finished normally with three errors, five warnings, and two informational messages| FlyC:3/5/2|
|Thc current buffer was not checked| FlyC|
|Automatic syntax checker selection did not find a suitable syntax checker| FlyC-|
|The current syntax check has errored | FlyC!|
|Thec current sytax check was interrupted| FlyC-|
|The last syntax check had a suspicious result | FlyC?|
