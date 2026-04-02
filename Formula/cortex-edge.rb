class CortexEdge < Formula
  desc "Build and run cortex agents"
  homepage "https://github.com/archetypeai/catalyst"
  version "0.2.0-rc.28"
  license :cannot_represent

  @@release_key = ENV.fetch("HOMEBREW_CATALYST_RELEASE_KEY") {
    odie "Set HOMEBREW_CATALYST_RELEASE_KEY to install. See: https://github.com/archetypeai/homebrew-catalyst#setup"
  }
  if Hardware::CPU.arm?
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.28/cortex-darwin-arm64.tar.gz?key=#{@@release_key}"
    sha256 "8aab8c9ec87c224da66e1d1dc9b0c50da54d39835972909db6927c4479dbc5ba"
  else
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.28/cortex-darwin-x86_64.tar.gz?key=#{@@release_key}"
    sha256 "c5c866effaf2415d06385e4aeeb2fd42f7e48c7e9f934552aa839a4252702d54"
  end

  def install
    bin.install "cortex"
    bin.install_symlink "cortex" => "cx"
  end

  test do
    system bin/"cortex", "--version"
  end
end
