# screenlayout

CLI tool to switch to a specific screenlayout created by `arandr`.

Run `screenlayout` to list all screenlayouts:

```shell
$ screenlayout
homeoffice
work
presentation
```

Run `screenlayout <name>` to switch to the specified screenlayout:

```shell
$ screenlayout homeoffice
```

## Configuration

The default configuration directory is `$XDG_CONFIG_HOME/screenlayout`. If `$XDG_CONFIG_HOME` is not set, `$HOME/.config` is used as default for it instead.

The file `$XDG_CONFIG_HOME/screenlayout/post` can be used to execute commands after the screenlayout has changed. It must be an executable shell script.

## Running

```shell
$ crystal run main.cr
$ crystal run main.cr -- homeoffice
```

## Reasoning

`screenlayout` could easily be implemented using a simple bash script. This project merely exists to try out [crystal](https://crystal-lang.org).
