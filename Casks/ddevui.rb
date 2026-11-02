cask "ddevui" do
  arch arm: "arm64", intel: "x64"

  version "0.2.5"
  sha256 arm:   "83c8fbb0cc90cb0b4b57c1f9f4b8f782da5756b2d8b2a4d1660015f926c535b8",
         intel: "d3fef120b16db3639015ef28f02d3a5254f78785ded56cbacd65155fd94a1fff"

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
