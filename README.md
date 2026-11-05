# shiv122/homebrew-tap

Homebrew casks for my macOS apps.

| App | What it is | Install |
|---|---|---|
| [DDevUI](https://github.com/shiv122/ddev-ui) | A desktop UI for managing [DDEV](https://ddev.com) local development environments | `brew install --cask shiv122/tap/ddevui` |
| [Stick-itt](https://github.com/shiv122/stickitt) | Tiny native sticky notes with an edge dock, reminders and markdown | `brew install --cask shiv122/tap/stick-itt` |

## Install

```sh
brew install --cask shiv122/tap/ddevui
brew install --cask shiv122/tap/stick-itt
```

That's it — the apps open normally, no Gatekeeper prompt.

> The macOS builds are ad-hoc signed but not notarized (no Apple Developer ID). Each cask removes
> the download quarantine flag on install so the app launches without the "could not verify"
> warning.

## Update / uninstall

```sh
brew upgrade --cask ddevui stick-itt
brew uninstall --cask stick-itt   # add --zap to also remove app data
```
