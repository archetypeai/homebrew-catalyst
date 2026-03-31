class CatalystEdge < Formula
  desc "Hyperparameter optimization for cortex agents"
  homepage "https://github.com/archetypeai/catalyst"
  version "0.0.0-edge.fcd00d3"
  license :cannot_represent

  @@release_key = ENV.fetch("HOMEBREW_CATALYST_RELEASE_KEY") {
    odie "Set HOMEBREW_CATALYST_RELEASE_KEY to install. See: https://github.com/archetypeai/homebrew-catalyst#setup"
  }
  url "https://d9pwqft6ad7vm.cloudfront.net/v0.0.0-edge.fcd00d3/catalyst-darwin-arm64.tar.gz?key=#{@@release_key}"
  sha256 "2d17116fb08e001e752ab9015098a19418411921a93326892efa71cb4d1c211d"

  depends_on "python@3.12"

  def install
    libexec.install "lib"
    libexec.install "catalyst" => "catalyst"
    bin.install_symlink libexec/"catalyst"
  end

  test do
    system bin/"catalyst", "--version"
  end
end
