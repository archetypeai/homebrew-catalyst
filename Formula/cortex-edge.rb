class CortexEdge < Formula
  desc "Build and run cortex agents"
  homepage "https://github.com/archetypeai/catalyst"
  version "0.2.0-rc.89"
  license :cannot_represent

  @@release_key = ENV.fetch("HOMEBREW_CATALYST_RELEASE_KEY") {
    odie "Set HOMEBREW_CATALYST_RELEASE_KEY to install. See: https://github.com/archetypeai/homebrew-catalyst#setup"
  }
  if Hardware::CPU.arm?
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.89/cortex-darwin-arm64.tar.gz?key=#{@@release_key}"
    sha256 "1b41fdb35e7bc7331a2e2c4ef2a1256debccf98e7f36cf5706abfce22d128d5f"
  else
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.89/cortex-darwin-x86_64.tar.gz?key=#{@@release_key}"
    sha256 "4747cb42af26e8ec27e9d41316010410c7800795b483ce9045de6bd274c6c319"
  end

  def install
    bin.install "cortex"
    bin.install_symlink "cortex" => "cx"
  end

  test do
    system bin/"cortex", "--version"
  end
end
