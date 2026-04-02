class CortexEdge < Formula
  desc "Build and run cortex agents"
  homepage "https://github.com/archetypeai/catalyst"
  version "0.2.0-rc.31"
  license :cannot_represent

  @@release_key = ENV.fetch("HOMEBREW_CATALYST_RELEASE_KEY") {
    odie "Set HOMEBREW_CATALYST_RELEASE_KEY to install. See: https://github.com/archetypeai/homebrew-catalyst#setup"
  }
  if Hardware::CPU.arm?
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.31/cortex-darwin-arm64.tar.gz?key=#{@@release_key}"
    sha256 "bc7bd59d91e5d57201ad4197d96dba9e03ca2081b6be5095fa5c6defeb1254b7"
  else
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.31/cortex-darwin-x86_64.tar.gz?key=#{@@release_key}"
    sha256 "fe0f8f066e2752c2aa527ee8495038054a068431079c65d5e7b92c5a40b8390d"
  end

  def install
    bin.install "cortex"
    bin.install_symlink "cortex" => "cx"
  end

  test do
    system bin/"cortex", "--version"
  end
end
