cask "cablepeek" do
  version "0.7"
  sha256 "489dd82b7e1f7bb7b1f616acd0a0d230937b86267ebe5442f0d3617ba666a755"

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
