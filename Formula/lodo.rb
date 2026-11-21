class Lodo < Formula
  desc "Manage .lodo and custom local domains on macOS via dnsmasq and Caddy"
  homepage "https://github.com/sangdth/lodo"
  url "https://github.com/sangdth/lodo/releases/download/v0.1.2/lodo-v0.1.2-aarch64-apple-darwin.tar.gz"
  version "0.1.2"
  sha256 "7dcfad9f6e57528c489c42992c0c0e081d8b7d32c57a4cd4dba143777f9b7c71"
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
