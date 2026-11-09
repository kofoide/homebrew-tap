# Homebrew formula for the quackd CLI. It lives in the tap repository
# github.com/kofoide/homebrew-tap as Formula/quackd.rb; see docs/releasing.md.
class Quackd < Formula
  desc "Run a DuckDB Quack server as a macOS launchd service"
  homepage "https://github.com/kofoide/quackd"
  url "https://github.com/kofoide/quackd/archive/refs/tags/v1.6.0.tar.gz"
  sha256 "f10be71074d40459fb5f75ec2c74f524724414d1240dc7023dd9535e1352fcd2"
  license "MIT"

  depends_on :macos

  def install
    bin.install "bin/quackd"
    doc.install "README.md", "docs/quackd-internals.md"
  end

  def caveats
    <<~EOS
      quackd needs DuckDB with the quack extension, which is not installed automatically:
        brew install duckdb

      Then:
        quackd init /path/to/database.duckdb
        quackd install && quackd start
    EOS
  end

  test do
    assert_match "quackd #{version}", shell_output("#{bin}/quackd version")
  end
end
