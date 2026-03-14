class Xcodemcp < Formula
  desc "Go CLI wrapper around xcrun mcpbridge"
  homepage "https://github.com/oozoofrog/xcodemcp-cli"
  url "https://github.com/oozoofrog/xcodemcp-cli/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "df901d6c5e8f85f24922ad2925c34aab20f76da8a8b20e1a34dbbe1881434356"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(output: bin/"xcodemcp"), "./cmd/xcodemcp"
  end

  test do
    output = shell_output("#{bin}/xcodemcp help")
    assert_match "xcodemcp wraps xcrun mcpbridge", output
  end
end
