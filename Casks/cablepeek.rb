cask "cablepeek" do
  version "0.4"
  sha256 "0d3c9a85b281e64beb038b0bdaab40f2af7ccd1900d7e6c655339d3c2e9d9e1c"

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
