class Lodo < Formula
  desc "Manage .lodo and custom local domains on macOS via dnsmasq and Caddy"
  homepage "https://github.com/sangdth/lodo"
  url "https://github.com/sangdth/lodo/releases/download/v0.1.3/lodo-v0.1.3-aarch64-apple-darwin.tar.gz"
  version "0.1.3"
  sha256 "24a741fc9d0e28c584912cf3e40b52123ec0e659b6e14abdeb4eb86b58fa9b4b"
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
