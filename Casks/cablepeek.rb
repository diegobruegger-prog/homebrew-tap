cask "cablepeek" do
  version "0.6"
  sha256 "db72339f1923a518d0fc15bac3b6ef1fa7ff355e0fa2dfb4644ff16c720ef418"

  url "https://github.com/diegobruegger-prog/cablepeek/releases/download/v#{version}/CablePeek.zip"
  name "CablePeek"
  desc "Shows USB-C link speed or charging wattage next to the port"
  homepage "https://cablepeek.pages.dev/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "CablePeek.app"

  uninstall quit: "ch.diegobrugger.cablepeek"

  zap trash: "~/Library/Preferences/ch.diegobrugger.cablepeek.plist"

  caveats <<~EOS
    CablePeek is not notarized. On first launch macOS may block it.
    Open System Settings > Privacy & Security and click "Open Anyway".
  EOS
end
