class CortexEdge < Formula
  desc "Build and run cortex agents"
  homepage "https://github.com/archetypeai/catalyst"
  version "0.2.0-rc.25"
  license :cannot_represent

  @@release_key = ENV.fetch("HOMEBREW_CATALYST_RELEASE_KEY") {
    odie "Set HOMEBREW_CATALYST_RELEASE_KEY to install. See: https://github.com/archetypeai/homebrew-catalyst#setup"
  }
  if Hardware::CPU.arm?
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.25/cortex-darwin-arm64.tar.gz?key=#{@@release_key}"
    sha256 "6f7d049166a80ac616693b0996c1a9a7e746b57a8c366549e6b5f5e56ae729ee"
  else
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.25/cortex-darwin-x86_64.tar.gz?key=#{@@release_key}"
    sha256 "d273167b598ceb725f4a3fdbf8bd06ea1a6068c5c3e60ef2dd07e69dbec65526"
  end

  def install
    bin.install "cortex"
    bin.install_symlink "cortex" => "cx"
  end

  test do
    system bin/"cortex", "--version"
  end
end
