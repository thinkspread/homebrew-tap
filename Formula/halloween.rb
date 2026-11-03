class Halloween < Formula
  desc "Skeleton jump-scare for whoever walks in front of your Mac's camera"
  homepage "https://github.com/thinkspread/halloween"
  url "https://github.com/thinkspread/halloween/releases/download/v0.1.0/halloween-0.1.0-macos-arm64.tar.gz"
  version "0.1.0"
  sha256 "48f799c1da906d6df2821ac89dda6dc23474db86f4cd5f1bc08b12a75a977693"

  depends_on arch: :arm64
  # It needs tempo9, which needs macOS 26; tempo9 is installed separately
  # (brew install thinkspread/tap/tempo9) and `halloween` says so if missing.
  depends_on macos: :tahoe

  def install
    bin.install "halloween"
    doc.install "README.md", "README.zh-CN.md", "LICENSE", "NOTICE"
  end

  test do
    assert_match "halloween 0.1.0", shell_output("#{bin}/halloween --version")
  end
end
