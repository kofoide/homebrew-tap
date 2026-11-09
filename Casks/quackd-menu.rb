cask "quackd-menu" do
  version "1.5.0"
  sha256 "14bf5fe13ac800d7787a7b6a792b50615712b2fe13bf58e3c7b537f746d07359"

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
