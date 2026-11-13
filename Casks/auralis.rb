cask "auralis" do
  version "1.0.1"
  sha256 "2a0f191e9fe9ae307d1e33659c3ef05f7913a06406cdfdd4acf9f137e86348d2"

  url "https://github.com/Shreyanshh071/Auralis/releases/download/v#{version}-macos/Auralis-#{version}.dmg"
  name "Auralis"
  desc "Music player with synced lyrics and Listen Together"
  homepage "https://github.com/Shreyanshh071/Auralis"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Auralis.app"

  # This ad-hoc signed beta is not notarized. Scope the workaround to this app.
  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "{{appdir}}/Auralis.app"],
        writable_paths: ["Auralis.app"],
        writable_base:  :appdir
  end

  caveats <<~EOS
    Auralis requires Apple Silicon and macOS 14 Sonoma or later.
    This beta is ad-hoc signed and is not notarized by Apple.
    Installation removes quarantine from Auralis.app only as a first-launch workaround.
    Install only if you trust the publisher. This does not provide Apple notarization.
    Report issues at: https://github.com/Shreyanshh071/Auralis/issues
  EOS
end
