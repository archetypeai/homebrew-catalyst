class CortexEdge < Formula
  desc "Build and run cortex agents"
  homepage "https://github.com/archetypeai/catalyst"
  version "0.2.0-rc.130"
  license :cannot_represent

  @@release_key = ENV.fetch("HOMEBREW_CATALYST_RELEASE_KEY") {
    odie "Set HOMEBREW_CATALYST_RELEASE_KEY to install. See: https://github.com/archetypeai/homebrew-catalyst#setup"
  }
  if Hardware::CPU.arm?
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.130/cortex-darwin-arm64.tar.gz?key=#{@@release_key}"
    sha256 "075c07153933a1a544d831bc7c96f1138e00252cd897c13378f8311954a61594"
  else
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.130/cortex-darwin-x86_64.tar.gz?key=#{@@release_key}"
    sha256 "4a5841a90cc28e9887e537c13e05550604940aa52f75c935b3fee4b8befa30ce"
  end

  def install
    bin.install "cortex"
    bin.install_symlink "cortex" => "cx"
  end

  test do
    system bin/"cortex", "--version"
  end
end
