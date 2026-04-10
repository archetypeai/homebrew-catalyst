class CortexEdge < Formula
  desc "Build and run cortex agents"
  homepage "https://github.com/archetypeai/catalyst"
  version "0.2.0-rc.104"
  license :cannot_represent

  @@release_key = ENV.fetch("HOMEBREW_CATALYST_RELEASE_KEY") {
    odie "Set HOMEBREW_CATALYST_RELEASE_KEY to install. See: https://github.com/archetypeai/homebrew-catalyst#setup"
  }
  if Hardware::CPU.arm?
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.104/cortex-darwin-arm64.tar.gz?key=#{@@release_key}"
    sha256 "6818e215fa34178ee3f441e5fbe2e3444b746b7b4491fb861afdf828eaa8c5c2"
  else
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.104/cortex-darwin-x86_64.tar.gz?key=#{@@release_key}"
    sha256 "480daa4314f6964ad93de11ce9991f0b6b0c208ec25da8afb420dbe44001ac45"
  end

  def install
    bin.install "cortex"
    bin.install_symlink "cortex" => "cx"
  end

  test do
    system bin/"cortex", "--version"
  end
end
