cask "stick-itt" do
  version "0.1.0"
  sha256 "87b564007f7478fd103a91bace1c5c8c9a8c385403e1dc13845c6b27a6d9c4df"

  url "https://github.com/shiv122/stickitt/releases/download/v#{version}/Stick-itt-#{version}-macos.zip",
      verified: "github.com/shiv122/stickitt/"
  name "Stick-itt"
  desc "Tiny native sticky notes with an edge dock, reminders and markdown"
  homepage "https://github.com/shiv122/stickitt"

  depends_on macos: :big_sur

  app "Stick-itt.app"

  # The app is ad-hoc signed but not notarized (no Apple Developer ID), so it cannot pass
  # Gatekeeper's notarization check. Strip the quarantine flag Homebrew applies on download so
  # the app launches without a security prompt.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Stick-itt.app"],
                   sudo: false
  end

  uninstall quit: "com.shiv122.stickitt"

  zap trash: [
    "~/Library/Application Support/Stick-itt",
    "~/Library/Saved Application State/com.shiv122.stickitt.savedState",
  ]
end
