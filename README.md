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
6. JavaScript/ES6/JSX support
   1. Syntax check
   2. Auto prettify
   3. Auto completion
7. TypeScript/TSX support
   1. Syntax check
   2. Auto prettify(Todo)
   3. Auto completion

### HTML
#### Dependencies

``` bash
# install backend for flycheck for HTML
sudo apt install tidy -y
```

### JavaScript/ES6/JSX
#### Dependencies

``` bash
# eslint: pluggable linter for JavaScript and jsx, requires Node.js>=8.10 and npm > 3.
# prettier: prettify the code style automatically before save files.
npm install eslint prettier -g

# babel-eslint: to enable ES6 and jsx parsing for eslint.
# eslint-plugin-prettier: add prettier as rules for eslint.
# eslint-config-prettier: config prettier in eslint.
# eslint-plugin-import: add import plugin for eslint.
# eslint-plugin-react: add react plugin for eslint.
# eslint-plugin-jsx-a11y: add jsx a11y plugin for eslint.
npm install babel-eslint eslint-plugin-prettier eslint-config-prettier eslint-plugin-react eslint-plugin-jsx-a11y eslint-plugin-import --save-dev

# typescript: install typescript and tsserver for JavaScript and TypeScript.
npm install typescript --save-dev
# avoid tsserver raising error that can not resolve symbol $ in JQuery.
npm install jquery --save
```

#### Configuration
1. Initialize .eslintrc in your project.
``` bash
eslint --init
```
2. Set `parser` to `babel-eslint` in .eslintrc. And use `prettier` as rule. Template like below

``` yaml
parser: babel-eslint
plugins:
  - react
  - prettier
rules:
  "prettier/prettier": error
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
3. Set `jsconfig.json` for tsserver.

``` json
{
  "compilerOptions": {
    "target": "es2017",
    "allowSyntheticDefaultImports": true,
    "noEmit": true,
    "checkJs": true,
    "jsx": "react",
    "lib": [ "dom", "es2017" ]
  }
}
```

#### Usage
1. Fold all function definitions `C-c C-f`
2. Unfold the function under cursor `C-c C-o`
3. Goto function definition `M-.`

### CSS/LESS/SCSS
#### Dependencies

``` bash
# install backend for flycheck for CSS/LESS/SCSS
npm install stylelint -g

# install extends of stylelint
npm install stylelint-config-standard -D
```

#### Configuration

``` bash
cd $PROJECT

cat << END > .stylelintrc
---

extends: stylelint-config-standard
END
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
