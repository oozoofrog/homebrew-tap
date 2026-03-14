cask "frogtray" do
  version "1.6"
  sha256 "9fb18b99b7b847b11dd957c8624570cd5e2626ecb4c24cb23c17be729a6b6813"

  url "https://github.com/oozoofrog/FrogTray/releases/download/v#{version}/FrogTray-#{version}.dmg"
  name "FrogTray"
  desc "macOS menu bar system monitor"
  homepage "https://github.com/oozoofrog/FrogTray"

  depends_on macos: ">= :ventura"

  app "FrogTray.app"

  zap trash: [
    "~/Library/Preferences/com.oozoofrog.macos.FrogTray.plist",
  ]
end
