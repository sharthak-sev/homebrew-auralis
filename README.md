# Auralis Homebrew tap

Install the Auralis macOS beta on **Apple Silicon (M1 or newer), macOS 14 Sonoma or later**:

```sh
brew install --cask sharthak-sev/auralis/auralis
```

The recipe downloads the DMG from [Shreyanshh071/Auralis releases](https://github.com/Shreyanshh071/Auralis/releases) and checks its SHA-256 before installation. This repository contains the Homebrew recipe; app source and downloads remain in the main Auralis repository.

## Beta signing and first launch

This beta is ad-hoc signed, not Developer ID signed or Apple-notarized. The recipe removes `com.apple.quarantine` from the installed `Auralis.app` only, as a first-launch workaround. This bypasses quarantine-triggered Gatekeeper assessment; it does not provide Apple's security review or guarantee that macOS will allow launch. Install only if you trust the publisher. Gatekeeper is not disabled system-wide.

Homebrew is recommended for checksum verification, installation, the app-specific first-launch workaround, and upgrades. A manual DMG download remains available in the main repository's release. For a manual installation, drag Auralis into Applications, try opening it, then use **System Settings → Privacy & Security → Open Anyway** if macOS blocks it. See [Apple's instructions](https://support.apple.com/en-nz/102445).

## Upgrade

After a newer version is published and this recipe is updated:

```sh
brew update
brew upgrade --cask sharthak-sev/auralis/auralis
```

## Uninstall

```sh
brew uninstall --cask sharthak-sev/auralis/auralis
```

The cask deliberately has no `zap` stanza; it does not request deletion of app settings or account data.

## Maintaining the recipe

1. Publish a new macOS DMG in the main Auralis repository. The current URL pattern is `v<version>-macos/Auralis-<version>.dmg`; adjust the recipe if release naming changes.
2. Update `version` and `sha256` in `Casks/auralis.rb`. Calculate the checksum with `shasum -a 256 <downloaded-dmg>` and compare it with the published asset digest.
3. Run `brew style Casks/auralis.rb` and `brew audit --cask sharthak-sev/auralis/auralis` against the updated tap, then test installation on a clean Mac.
4. Commit and push the recipe. Never replace an existing release asset silently: publish a new version and checksum instead.

Report app bugs in [Auralis issues](https://github.com/Shreyanshh071/Auralis/issues). Report packaging issues in [this tap](https://github.com/sharthak-sev/homebrew-auralis/issues).
