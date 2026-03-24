class CatalystEdge < Formula
  desc "Hyperparameter optimization for cortex agents"
  homepage "https://github.com/archetypeai/catalyst"
  version "0.2.0-rc.11"
  license :cannot_represent

  url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.11/catalyst-darwin-arm64.tar.gz?key=eHREC9V2VGP3kzMP4OiWx92694cxgMCq8mNMFbfh6qw"
  sha256 "698cc82027965bb27453b040f68a8655aa1f8854db14f4a60e5555b273e51e11"

  def install
    bin.install "catalyst"
  end

  test do
    system bin/"catalyst", "--version"
  end
end
