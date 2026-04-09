class CortexEdge < Formula
  desc "Build and run cortex agents"
  homepage "https://github.com/archetypeai/catalyst"
  version "0.2.0-rc.90"
  license :cannot_represent

  @@release_key = ENV.fetch("HOMEBREW_CATALYST_RELEASE_KEY") {
    odie "Set HOMEBREW_CATALYST_RELEASE_KEY to install. See: https://github.com/archetypeai/homebrew-catalyst#setup"
  }
  if Hardware::CPU.arm?
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.90/cortex-darwin-arm64.tar.gz?key=#{@@release_key}"
    sha256 "0d94850a618c6a108c8b3a6e898e0783ef04fa06fb61685bd62b373f6a39eaa6"
  else
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.90/cortex-darwin-x86_64.tar.gz?key=#{@@release_key}"
    sha256 "1a8e24d72fc3777c7caf5b4b3b3ae7fe7eb2293982f300628062f7d3783bd4d7"
  end

  def install
    bin.install "cortex"
    bin.install_symlink "cortex" => "cx"
  end

  test do
    system bin/"cortex", "--version"
  end
end
