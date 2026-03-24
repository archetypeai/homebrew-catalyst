class CatalystEdge < Formula
  desc "Hyperparameter optimization for cortex agents"
  homepage "https://github.com/archetypeai/catalyst"
  version "0.2.0-rc.15"
  license :cannot_represent

  url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.15/catalyst-darwin-arm64.tar.gz?key=eHREC9V2VGP3kzMP4OiWx92694cxgMCq8mNMFbfh6qw"
  sha256 "3dad19e9b959e6e4605378e5bc3207fbea9d20ced6be73dbe5760decbc8e8d52"

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
