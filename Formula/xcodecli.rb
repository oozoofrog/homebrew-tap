class Xcodecli < Formula
  desc "Go CLI wrapper around xcrun mcpbridge"
  homepage "https://github.com/oozoofrog/xcodecli"
  url "https://github.com/oozoofrog/xcodecli/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "35990d23ca95f8feeab474575173abddd1486d968bdf7e677e24e94afde7de1a"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(output: bin/"xcodecli", ldflags: "-s -w -X main.cliVersion=v#{version} -X main.cliBuildChannel=release"), "./cmd/xcodecli"
  end

  test do
    output = shell_output("#{bin}/xcodecli help")
    assert_match "xcodecli wraps xcrun mcpbridge", output
    assert_match "v#{version}", shell_output("#{bin}/xcodecli version")
  end
end
