# shiv122/homebrew-tap

Homebrew tap for [DDevUI](https://github.com/shiv122/ddev-ui) — a desktop UI for managing
[DDEV](https://ddev.com) local development environments.

## Install

```sh
brew install --cask shiv122/tap/ddevui
```

That's it — the app opens normally, no Gatekeeper prompt.

> The macOS build is ad-hoc signed but not notarized (no Apple Developer ID). The cask removes
> the download quarantine flag on install so the app launches without the "could not verify"
> warning.

## Update / uninstall

```sh
brew upgrade --cask ddevui
brew uninstall --cask ddevui   # add --zap to also remove app data
```
