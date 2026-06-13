cask "ddevui" do
  arch arm: "arm64", intel: "x64"

  version "0.1.0"
  sha256 arm:   "8e11d0d74e427ff774f0962de9007a2babbc27b48a3c34b9ebc03e22de1e9f3b",
         intel: "b13c31c510900bec5fb751a199665248c2fdae7936adb403bfd570f116324669"

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
