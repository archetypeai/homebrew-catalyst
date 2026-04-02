class CortexEdge < Formula
  desc "Build and run cortex agents"
  homepage "https://github.com/archetypeai/catalyst"
  version "0.2.0-rc.33"
  license :cannot_represent

  @@release_key = ENV.fetch("HOMEBREW_CATALYST_RELEASE_KEY") {
    odie "Set HOMEBREW_CATALYST_RELEASE_KEY to install. See: https://github.com/archetypeai/homebrew-catalyst#setup"
  }
  if Hardware::CPU.arm?
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.33/cortex-darwin-arm64.tar.gz?key=#{@@release_key}"
    sha256 "7241936f8d8bd8953cf53469a18fae5eb1d616874450fc4bf6b08ab24d0c2fc8"
  else
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.33/cortex-darwin-x86_64.tar.gz?key=#{@@release_key}"
    sha256 "6cdbc8b1c191c82f1c07046288245b85390c48d5d36d8e51746481044831e4ad"
  end

  def install
    bin.install "cortex"
    bin.install_symlink "cortex" => "cx"
  end

  test do
    system bin/"cortex", "--version"
  end
end
