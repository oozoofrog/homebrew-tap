class Xcodecli < Formula
  desc "macOS CLI wrapper around xcrun mcpbridge"
  homepage "https://github.com/oozoofrog/xcodecli"
  url "https://github.com/oozoofrog/xcodecli/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "4e2e4bc0df48379cca598757594012241ce755e484daba9d5c72a1e6978595e9"
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
