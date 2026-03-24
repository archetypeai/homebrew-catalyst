class CortexEdge < Formula
  desc "Build and run cortex agents"
  homepage "https://github.com/archetypeai/catalyst"
  version "0.2.0-rc.16"
  license :cannot_represent

  if Hardware::CPU.arm?
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.16/cortex-darwin-arm64.tar.gz?key=eHREC9V2VGP3kzMP4OiWx92694cxgMCq8mNMFbfh6qw"
    sha256 "79bf22fd33e8919e0a575defa64901a70d2bb9a6c4fb0179f5285b171b941d77"
  else
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.16/cortex-darwin-x86_64.tar.gz?key=eHREC9V2VGP3kzMP4OiWx92694cxgMCq8mNMFbfh6qw"
    sha256 "3a5f919553387441ac3260a3e70c2be289f96d7c95346d954f7962d09c6d2ed9"
  end

  def install
    bin.install "cortex"
    bin.install_symlink "cortex" => "cx"
  end

  test do
    system bin/"cortex", "--version"
  end
end
