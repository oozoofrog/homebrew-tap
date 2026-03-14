class Xcodecli < Formula
  desc "Go CLI wrapper around xcrun mcpbridge"
  homepage "https://github.com/oozoofrog/xcodecli"
  url "https://github.com/oozoofrog/xcodecli/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "ded021260c2a11afb537d09422cfa6000ab62d563a6a80fb91fb368dfc8740aa"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(output: bin/"xcodecli"), "./cmd/xcodecli"
  end

  test do
    output = shell_output("#{bin}/xcodecli help")
    assert_match "xcodecli wraps xcrun mcpbridge", output
  end
end
