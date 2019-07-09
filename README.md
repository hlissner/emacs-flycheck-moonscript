# flycheck-moonscript

This package provides support for the [Moonscript
language](https://moonscript.org) to the [Flycheck
package](http://www.flycheck.org).

## Installation

You have two choices of linter. `moonc` (included with moonscript) and
[moonpick](https://github.com/nilnor/moonpick). I recommend moonpick, because it
has better integration into Flycheck.

Moonscript and moonpick can be installed through luarocks:

```sh
luarocks install moonscript

# Optional
luarocks install moonpick
```

Then installed in Emacs with:

```elisp
(add-hook 'moonscript-mode-hook #'flycheck-mode)

(with-eval-after-load 'moonscript
  (require 'flycheck-moonscript))
  
;; or

(use-package flycheck-moonscript
  :after moonscript)
```
