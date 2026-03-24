class CortexEdge < Formula
  desc "Build and run cortex agents"
  homepage "https://github.com/archetypeai/catalyst"
  version "0.2.0-rc.11"
  license :cannot_represent

  if Hardware::CPU.arm?
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.11/cortex-darwin-arm64.tar.gz?key=eHREC9V2VGP3kzMP4OiWx92694cxgMCq8mNMFbfh6qw"
    sha256 "daf333be92a9a34133fb46ebd8435633b763e3eb85bf36f9ea414dfc350e6d50"
  else
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.11/cortex-darwin-x86_64.tar.gz?key=eHREC9V2VGP3kzMP4OiWx92694cxgMCq8mNMFbfh6qw"
    sha256 "44dc730146623189162f1aeb51fd8b079811a9b60a902e61ab436140a1b806f7"
  end

  def install
    bin.install "cortex"
    bin.install_symlink "cortex" => "cx"
  end

  test do
    system bin/"cortex", "--version"
  end
end
