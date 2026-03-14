cask "frogtray" do
  version "1.1"
  sha256 "8536e4edd740decd53fae434714e3bef002012868446a4258030717d4cb29129"

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
