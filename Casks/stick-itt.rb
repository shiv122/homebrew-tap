cask "stick-itt" do
  version "0.1.1"
  sha256 "6ec7a669353a977a57a8e3601e827f5b4ba41ad31c73eeffea82dffff97ddda0"

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
