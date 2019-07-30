# fsjohnhuang/.emacs.d
My personal emacs configuration.

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
  
## Python
### Dependencies

``` bash
pip install --user rope rope_py3k jedi isort ipython autopep8 yapf
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
3. If auto complete is not available, run `<M-x> elpy-config` to check the Jedi have been installed or not, if not install yet, do it by `pip install jedi`.
