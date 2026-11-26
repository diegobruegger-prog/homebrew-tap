cask "cablepeek" do
  version "0.5"
  sha256 "a350b064f5f1c16e6b74943e7f2124885120c49e5c1e4fe4b5d1a9a38db7a392"

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
