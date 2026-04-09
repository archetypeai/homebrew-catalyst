class CortexEdge < Formula
  desc "Build and run cortex agents"
  homepage "https://github.com/archetypeai/catalyst"
  version "0.2.0-rc.80"
  license :cannot_represent

  @@release_key = ENV.fetch("HOMEBREW_CATALYST_RELEASE_KEY") {
    odie "Set HOMEBREW_CATALYST_RELEASE_KEY to install. See: https://github.com/archetypeai/homebrew-catalyst#setup"
  }
  if Hardware::CPU.arm?
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.80/cortex-darwin-arm64.tar.gz?key=#{@@release_key}"
    sha256 "a6a7d4e00ff79991e9fd34c93ae901876b1be81c74df449b2041539fbead7001"
  else
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.80/cortex-darwin-x86_64.tar.gz?key=#{@@release_key}"
    sha256 "0c949bbc71bb6322d95ee8a251a59c353a3158ba0059a5b051daf93ff0162f0e"
  end

  def install
    bin.install "cortex"
    bin.install_symlink "cortex" => "cx"
  end

  test do
    system bin/"cortex", "--version"
  end
end
