cask "quackd-menu" do
  version "1.6.2"
  sha256 "a5c4c77fe2d002be461a559b11fe1b28558830083b53ea269c994178d43a0c73"

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
