class Tempo9 < Formula
  desc "Server-grade LLM inference on Apple Silicon (continuous batching, paged KV)"
  homepage "https://github.com/thinkspread/tempo9"
  url "https://github.com/thinkspread/tempo9/releases/download/v1.3.0/tempo9-1.3.0-macos-arm64.tar.gz"
  sha256 "df978ef2b2f4d24146e899ebf8d653f78e494620dbf38a83861ec321790656ec"
  version "1.3.0"

  depends_on arch: :arm64
  # The binary is linked for macOS 26: declared lower, the engine's Metal
  # backend switches itself off, and it will not start below 26 anyway.
  # (Implies macOS; Homebrew refuses a separate `depends_on :macos` with it.)
  depends_on macos: :tahoe

  def install
    bin.install "tempo9"
    doc.install "NOTICE", "LICENSE", "ENGINE-LICENSE", "LICENSES", "README.md"
  end

  test do
    assert_match "usage: tempo9", shell_output("#{bin}/tempo9 --help 2>&1", 2)
  end
end
