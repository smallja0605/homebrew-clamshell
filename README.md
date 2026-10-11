# homebrew-clamshell

[Homebrew](https://brew.sh) tap for [Clamshell](https://github.com/smallja0605/clamshell), a pixel crab in your macOS menu bar that works while Claude Code works.

```bash
brew install --cask smallja0605/clamshell/clamshell
```

- Update: `brew upgrade --cask clamshell`
- Uninstall: first choose *Remove Claude Code hooks…* from Clamshell's menu, then `brew uninstall --cask clamshell` (add `--zap` to also delete its settings and data).

Clamshell is not notarized yet, so macOS warns the first time you open it (macOS 15 and later: *System Settings → Privacy & Security → Open Anyway*).

## For the maintainer

After publishing a new Clamshell release, point the cask at it:

```bash
./update.sh 0.2.0     # downloads that release's zip, rewrites version and sha256 in Casks/clamshell.rb
```

then commit and push.
