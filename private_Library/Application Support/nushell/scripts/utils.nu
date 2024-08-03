### This clears out your screen buffer on a default mac terminal
### currently there is no way to do that in nushell

export def cls [] {
ansi cls
ansi clsb
ansi home
}
