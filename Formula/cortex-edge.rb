class CortexEdge < Formula
  desc "Build and run cortex agents"
  homepage "https://github.com/archetypeai/catalyst"
  version "0.2.0-rc.17"
  license :cannot_represent

  if Hardware::CPU.arm?
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.17/cortex-darwin-arm64.tar.gz?key=#{ENV.fetch("CATALYST_RELEASE_KEY")}"
    sha256 "892a13d2b0fa69dbb74a29e29844ac67ba6bb683541b66b9956cbeaf47fd4eca"
  else
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.17/cortex-darwin-x86_64.tar.gz?key=#{ENV.fetch("CATALYST_RELEASE_KEY")}"
    sha256 "08faefd1b9f0908c9d0c396b6ab19e3a108a2d938f3a5bb8b64a92192fffef41"
  end

  def install
    bin.install "cortex"
    bin.install_symlink "cortex" => "cx"
  end

  test do
    system bin/"cortex", "--version"
  end
end
