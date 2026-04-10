class CortexEdge < Formula
  desc "Build and run cortex agents"
  homepage "https://github.com/archetypeai/catalyst"
  version "0.2.0-rc.103"
  license :cannot_represent

  @@release_key = ENV.fetch("HOMEBREW_CATALYST_RELEASE_KEY") {
    odie "Set HOMEBREW_CATALYST_RELEASE_KEY to install. See: https://github.com/archetypeai/homebrew-catalyst#setup"
  }
  if Hardware::CPU.arm?
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.103/cortex-darwin-arm64.tar.gz?key=#{@@release_key}"
    sha256 "a9ad78f6ef61058b112cfd0d4d697ce5d09aa70ef7cc454219efb22f9bfe6151"
  else
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.103/cortex-darwin-x86_64.tar.gz?key=#{@@release_key}"
    sha256 "ac78ca679aa7f3cc18d89c428a4f1eacb697d51b74b734248059ddd679121d5c"
  end

  def install
    bin.install "cortex"
    bin.install_symlink "cortex" => "cx"
  end

  test do
    system bin/"cortex", "--version"
  end
end
