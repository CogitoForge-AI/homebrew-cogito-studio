cask "cogito-studio" do
  version :latest
  sha256 :no_check

  url "https://studio.cogito-ai.org/installer.sh"
  name "Cogito Studio"
  desc "All-in-One Workspace AI"
  homepage "https://studio.cogito-ai.org/"

  livecheck do
    url "https://api.github.com/repos/CogitoForge-AI/cogito-studio/releases?per_page=1"
    strategy :json do |json|
      json.first["tag_name"]
    end
  end

  auto_updates true

  container type: :naked

  installer script: {
    executable: "/bin/bash",
    args:       ["#{staged_path}/installer.sh"],
  }

  uninstall quit:   "com.cogito-studio.app",
            delete: "/Applications/Cogito Studio.app"

  caveats <<~EOS
    If you encounter the "Cogito Studio is damaged and can't be opened" error, please run the following command:
      xattr -cr #{appdir}/Cogito\\ Studio.app
  EOS

  zap trash: [
    "~/Library/Application Support/com.cogito-studio.app",
    "~/Library/Caches/com.cogito-studio.app",
    "~/Library/Saved Application State/com.cogito-studio.app.savedState",
    "~/Library/Preferences/com.cogito-studio.app.plist",
    "~/Library/WebKit/com.cogito-studio.app",
    "~/Library/Logs/Cogito Studio",
  ]
end
