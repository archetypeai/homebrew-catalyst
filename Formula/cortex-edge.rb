class CortexEdge < Formula
  desc "Build and run cortex agents"
  homepage "https://github.com/archetypeai/catalyst"
  version "0.2.0-rc.12"
  license :cannot_represent

  if Hardware::CPU.arm?
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.12/cortex-darwin-arm64.tar.gz?key=eHREC9V2VGP3kzMP4OiWx92694cxgMCq8mNMFbfh6qw"
    sha256 "b0430b45cf603730989773116a9bce87e6ac2ad427ad974a3338372361eccf11"
  else
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.12/cortex-darwin-x86_64.tar.gz?key=eHREC9V2VGP3kzMP4OiWx92694cxgMCq8mNMFbfh6qw"
    sha256 "6994d29fb68715852c57f3ece348fe7a4b9ba414e2d9b7b6a3ad712067cc0827"
  end

  def install
    bin.install "cortex"
    bin.install_symlink "cortex" => "cx"
  end

  test do
    system bin/"cortex", "--version"
  end
end
