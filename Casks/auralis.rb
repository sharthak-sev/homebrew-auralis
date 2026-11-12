cask "auralis" do
  version "1.0.0"
  sha256 "e6612563dbbbd6d60b6f8d77b24ef1a93171b88809fb9458f287a888e4372430"

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
