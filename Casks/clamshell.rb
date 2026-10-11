cask "clamshell" do
  version "0.1.0"
  sha256 "2206b66a12c1abeb547ae78a9c7e5ade5671748305f7e2e827e45efd845a5a35"

  url "https://github.com/smallja0605/clamshell/releases/download/v#{version}/Clamshell-#{version}.zip"
  name "Clamshell"
  desc "Pixel crab in the menu bar that works while Claude Code works"
  homepage "https://github.com/smallja0605/clamshell"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "Clamshell.app"

  uninstall quit: "io.github.smallja0605.clamshell"

  zap trash: [
    "~/.claude/clamshell",
    "~/Library/Preferences/io.github.smallja0605.clamshell.plist",
  ]

  caveats <<~EOS
    Clamshell is not notarized yet, so macOS warns the first time you open it:
      macOS 15 and later: open it once, then System Settings > Privacy & Security > Open Anyway.
      macOS 14 and earlier: right-click the app and choose Open.

    On first launch it asks before adding hooks to ~/.claude/settings.json.
    Before uninstalling, choose "Remove Claude Code hooks..." from its menu, so no hooks are left pointing at a missing app.
  EOS
end
