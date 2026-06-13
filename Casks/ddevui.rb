cask "ddevui" do
  arch arm: "arm64", intel: "x64"

  version "0.1.0"
  sha256 arm:   "9dccdd7bd5c1491ec1821a9a6487e509d0c30bc33dd31d5dd0d0ebbbd59a58e5",
         intel: "c7320388d1f34745b10873510112dd246d9424b2ce0dd1c3b4a786fd0cd51189"

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
