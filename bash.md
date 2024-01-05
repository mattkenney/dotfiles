# Bash shell tips

## Create `~/.bashrc` and `~/.profile` if necessary.
Tools like RVM, NVM, and SDKMAN may modify `.bash_profile` if these
files do not exist. It is cleaner to keep those changes separate.

```
if [ ! -f ~/.profile ]; then
    touch ~/.profile
fi
if [ ! -f ~/.bashrc ]; then
    touch ~/.bashrc
fi
```

## Bash in Gnome Terminal
Behavior is more consistent if Gnome Terminal starts bash as a login shell.

In Gnome Terminal preferences, enable the "Run command as a login shell" option
- this changes how the
[start up files](https://www.gnu.org/software/bash/manual/html_node/Bash-Startup-Files.html)
are processed.

## Change default shell in MacOS
```
echo /usr/local/bin/bash | sudo tee -a /etc/shells
chsh -s /usr/local/bin/bash
```

## Check Bash version
Check bash version with Ctrl-x Ctrl-v.
