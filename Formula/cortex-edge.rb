class CortexEdge < Formula
  desc "Build and run cortex agents"
  homepage "https://github.com/archetypeai/catalyst"
  version "0.2.0-rc.9"
  license :cannot_represent

  if Hardware::CPU.arm?
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.9/cortex-darwin-arm64.tar.gz?key=eHREC9V2VGP3kzMP4OiWx92694cxgMCq8mNMFbfh6qw"
    sha256 "5fcf21bc7a61b9c749698d3947988eb4c241f0b798e6665f90b0c86c3bad10f1"
  else
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.9/cortex-darwin-x86_64.tar.gz?key=eHREC9V2VGP3kzMP4OiWx92694cxgMCq8mNMFbfh6qw"
    sha256 "577daa5038f3b81ae7b93a0699d6b1c09e0bf97f261b5231cd05a36e3f470e4c"
  end

  def install
    bin.install "cortex"
    bin.install_symlink "cortex" => "cx"
  end

  test do
    system bin/"cortex", "--version"
  end
end
