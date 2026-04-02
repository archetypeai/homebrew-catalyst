class CortexEdge < Formula
  desc "Build and run cortex agents"
  homepage "https://github.com/archetypeai/catalyst"
  version "0.2.0-rc.30"
  license :cannot_represent

  @@release_key = ENV.fetch("HOMEBREW_CATALYST_RELEASE_KEY") {
    odie "Set HOMEBREW_CATALYST_RELEASE_KEY to install. See: https://github.com/archetypeai/homebrew-catalyst#setup"
  }
  if Hardware::CPU.arm?
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.30/cortex-darwin-arm64.tar.gz?key=#{@@release_key}"
    sha256 "3d8b24dbfe71189889f2ea4cda4ba59871d8b79a9a48e2bd21846e97c4879283"
  else
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.30/cortex-darwin-x86_64.tar.gz?key=#{@@release_key}"
    sha256 "09a9e446e403ef025f72989b3ecdde4d61272b5d2a7ddc96806635dfe3c00971"
  end

  def install
    bin.install "cortex"
    bin.install_symlink "cortex" => "cx"
  end

  test do
    system bin/"cortex", "--version"
  end
end
