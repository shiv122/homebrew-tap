cask "ddevui" do
  arch arm: "arm64", intel: "x64"

  version "0.2.0"
  sha256 arm:   "d7f7b97de1eb8d6a6b5d9cd820f51657430a0b4fd90fb3df9378e481c22c0fac",
         intel: "566e6c53b6018e50152b0c4dbc4e18e2abae93137ef2a9a306b4810e6baff3f1"

  url "https://github.com/shiv122/ddev-ui/releases/download/v#{version}/ddevui-#{version}-mac-#{arch}.dmg",
      verified: "github.com/shiv122/ddev-ui/"
  name "DDevUI"
  desc "Desktop UI for managing DDEV local development environments"
  homepage "https://github.com/shiv122/ddev-ui"

  depends_on macos: :big_sur

  app "DDevUI.app"

  # The app is ad-hoc signed but not notarized (no Apple Developer ID), so it
  # cannot pass Gatekeeper's notarization check. Strip the quarantine flag that
  # Homebrew applies on download so the app launches without a security prompt.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/DDevUI.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/ddevui",
    "~/Library/Preferences/com.zaraffasoft.ddevui.plist",
    "~/Library/Saved Application State/com.zaraffasoft.ddevui.savedState",
  ]
end
