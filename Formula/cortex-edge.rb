class CortexEdge < Formula
  desc "Build and run cortex agents"
  homepage "https://github.com/archetypeai/catalyst"
  version "0.2.0-rc.41"
  license :cannot_represent

  @@release_key = ENV.fetch("HOMEBREW_CATALYST_RELEASE_KEY") {
    odie "Set HOMEBREW_CATALYST_RELEASE_KEY to install. See: https://github.com/archetypeai/homebrew-catalyst#setup"
  }
  if Hardware::CPU.arm?
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.41/cortex-darwin-arm64.tar.gz?key=#{@@release_key}"
    sha256 "c0ba54676a8c2783c5aa87734e0d07126acccd3b753eaae05088140fc3bd5775"
  else
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.41/cortex-darwin-x86_64.tar.gz?key=#{@@release_key}"
    sha256 "992b3c66109e4802be4c63584768406a2c8ffd3c3598b6c57f7a76cd23aebf21"
  end

  def install
    bin.install "cortex"
    bin.install_symlink "cortex" => "cx"
  end

  test do
    system bin/"cortex", "--version"
  end
end
