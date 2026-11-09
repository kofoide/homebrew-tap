cask "quackd-menu" do
  version "1.6.1"
  sha256 "4b04109e25e188eaff966007508b8227db73f56aabea5c0ea43ed293559c36d4"

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
