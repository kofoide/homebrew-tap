cask "quackd-menu" do
  version "1.6.0"
  sha256 "78cd6de4208b1a855320c8b106e274c335690681a637cd67c25ebea08112514e"

  url "https://github.com/kofoide/quackd/releases/download/v#{version}/Quackd-#{version}.zip"
  name "Quackd"
  desc "Menu bar controller for the quackd DuckDB Quack server"
  homepage "https://github.com/kofoide/quackd"

  depends_on macos: :ventura

  app "Quackd.app"

  zap trash: [
    "~/.config/quackd",
    "~/Library/Application Support/quackd",
    "~/Library/Logs/quackd",
  ]

  caveats <<~EOS
    Quackd is not notarized. The first time you open it, go to
    System Settings → Privacy & Security and click "Open Anyway".

    It needs DuckDB with the quack extension:
      brew install duckdb
  EOS
end
