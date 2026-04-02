class CortexEdge < Formula
  desc "Build and run cortex agents"
  homepage "https://github.com/archetypeai/catalyst"
  version "0.2.0-rc.38"
  license :cannot_represent

  @@release_key = ENV.fetch("HOMEBREW_CATALYST_RELEASE_KEY") {
    odie "Set HOMEBREW_CATALYST_RELEASE_KEY to install. See: https://github.com/archetypeai/homebrew-catalyst#setup"
  }
  if Hardware::CPU.arm?
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.38/cortex-darwin-arm64.tar.gz?key=#{@@release_key}"
    sha256 "20ecd4d91f2acd72a15d8f60dc19880206b66166616c51d3fd7d4cd08febf459"
  else
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.38/cortex-darwin-x86_64.tar.gz?key=#{@@release_key}"
    sha256 "d399e887a55e650980d0798fae7a95d5a5674ad215809e9c0f1d4698aac42df9"
  end

  def install
    bin.install "cortex"
    bin.install_symlink "cortex" => "cx"
  end

  test do
    system bin/"cortex", "--version"
  end
end
