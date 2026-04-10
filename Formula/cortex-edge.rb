class CortexEdge < Formula
  desc "Build and run cortex agents"
  homepage "https://github.com/archetypeai/catalyst"
  version "0.2.0-rc.100"
  license :cannot_represent

  @@release_key = ENV.fetch("HOMEBREW_CATALYST_RELEASE_KEY") {
    odie "Set HOMEBREW_CATALYST_RELEASE_KEY to install. See: https://github.com/archetypeai/homebrew-catalyst#setup"
  }
  if Hardware::CPU.arm?
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.100/cortex-darwin-arm64.tar.gz?key=#{@@release_key}"
    sha256 "0a7e903f9704e8b23946e59d1fb6d4a3f7734d3365bf34d833c029dc60b7041f"
  else
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.100/cortex-darwin-x86_64.tar.gz?key=#{@@release_key}"
    sha256 "6c0ea10dfa59b8f2ded3f0cff2db6fe497e1a35d3526003248300ecd9ba06cb6"
  end

  def install
    bin.install "cortex"
    bin.install_symlink "cortex" => "cx"
  end

  test do
    system bin/"cortex", "--version"
  end
end
