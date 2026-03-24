class CortexEdge < Formula
  desc "Build and run cortex agents"
  homepage "https://github.com/archetypeai/catalyst"
  version "0.2.0-rc.8"
  license :cannot_represent

  if Hardware::CPU.arm?
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.8/cortex-darwin-arm64.tar.gz?key=eHREC9V2VGP3kzMP4OiWx92694cxgMCq8mNMFbfh6qw"
    sha256 "999635bd690de30d962ef4399ce5ca4fc3fe3bf9ed69822f36d497bcd60c1d9d"
  else
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.8/cortex-darwin-x86_64.tar.gz?key=eHREC9V2VGP3kzMP4OiWx92694cxgMCq8mNMFbfh6qw"
    sha256 "d09ef8ec5b208c1c3c192d5aeffdfa94d35807fe9061b0c71955362b5c8e54f1"
  end

  def install
    bin.install "cortex"
    bin.install_symlink "cortex" => "cx"
  end

  test do
    system bin/"cortex", "--version"
  end
end
