# Homebrew Cogito Studio

This is the official Homebrew tap for **Cogito Studio**, an all-in-one workspace AI app.
The cask uses the upstream installer script so it always installs the latest available release.

## Installation

To install Cogito Studio via Homebrew, run:

```bash
# Tap the repository
brew tap cogitoforge-ai/cogito-studio

# Install the cask
brew install --cask cogito-studio
```

## Update Behavior

This tap is configured to always fetch the latest upstream release at install time.
That means you do not need to update this repository for every new Cogito Studio version.

Trade-offs:

- The cask uses `version :latest` and `sha256 :no_check`, which is the Homebrew-supported pattern for unversioned latest downloads.
- Homebrew does not track an exact installed version for `:latest` casks, so standard upgrade behavior is less precise than a pinned-version cask.
- In practice, updates should come from Cogito Studio's built-in auto-update, or you can run `brew reinstall --cask cogito-studio`.
- If you want Homebrew to force refresh `:latest` casks during upgrades, use `brew upgrade --greedy cogito-studio`.

## Troubleshooting

### "Cogito Studio is damaged and can't be opened"

If macOS blocks the application and shows a "damaged" warning, run the following command to remove the quarantine attribute:

```bash
xattr -cr /Applications/Cogito\ Studio.app
```

## Development Workflow

If you maintain this tap and need to update or fix the cask, follow this process:

1. Modify the cask: edit `Casks/cogito-studio.rb` with your changes.
2. Commit and push:
   ```bash
   git add Casks/cogito-studio.rb README.md
   git commit -m "Update Cogito Studio cask"
   git push origin main
   ```
3. Sync Homebrew:
   ```bash
   brew update
   ```
4. Reinstall or upgrade:
   - Reinstall latest: `brew reinstall --cask cogito-studio`
   - Force upgrade latest casks: `brew upgrade --greedy cogito-studio`

---

Built by the Cogito Studio community.
