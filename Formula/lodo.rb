class Lodo < Formula
  desc "Manage .lodo and custom local domains on macOS via dnsmasq and Caddy"
  homepage "https://github.com/sangdth/lodo"
  url "https://github.com/sangdth/lodo/releases/download/v0.1.0/lodo-v0.1.0-aarch64-apple-darwin.tar.gz"
  version "0.1.0"
  sha256 "9c401664d1777cf549d18fe000343f39d9cac085074de97521ed81c2afeb33c8"
  depends_on :macos
  depends_on arch: :arm64
  depends_on "dnsmasq"
  depends_on "caddy"

  def install
    bin.install "lodo"
    libexec.install "lodo-menubar"
  end

  def caveats
    <<~EOS
      Run one-time system setup (or repair after an upgrade if prompted):
        lodo setup
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/lodo version")
  end
end
