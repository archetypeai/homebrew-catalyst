class CatalystEdge < Formula
  desc "Hyperparameter optimization for cortex agents"
  homepage "https://github.com/archetypeai/catalyst"
  version "0.2.0-rc.12"
  license :cannot_represent

  url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.12/catalyst-darwin-arm64.tar.gz?key=eHREC9V2VGP3kzMP4OiWx92694cxgMCq8mNMFbfh6qw"
  sha256 "eb4deb737546253d7a54b61307a726a7cf62c2810e2e4fbafcee8d7b35788f34"

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
