# Bash shell tips

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
