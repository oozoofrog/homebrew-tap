class Xcodecli < Formula
  desc "macOS CLI wrapper around xcrun mcpbridge"
  homepage "https://github.com/oozoofrog/xcodecli"
  url "https://github.com/oozoofrog/xcodecli/archive/refs/tags/v1.2.1.tar.gz"
  sha256 "088267f3e198fe274e54cbf6e3b8d6580018c59d4ff770bac1c9044943064139"
  license "MIT"

  depends_on xcode: ["16.0", :build]
  depends_on :macos

  def install
    # Inject release version and channel into Version.swift before building
    version_file = "Sources/XcodeCLICore/Shared/Version.swift"
    inreplace version_file, "public static let current: String = source",
                            "public static let current: String = \"v#{version}\""
    inreplace version_file, "public static let buildChannel: String = \"dev\"",
                            "public static let buildChannel: String = \"release\""
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/xcodecli"
  end

  test do
    assert_match "v#{version}", shell_output("#{bin}/xcodecli version")
  end
end
