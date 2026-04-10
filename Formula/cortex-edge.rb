class CortexEdge < Formula
  desc "Build and run cortex agents"
  homepage "https://github.com/archetypeai/catalyst"
  version "0.2.0-rc.106"
  license :cannot_represent

  @@release_key = ENV.fetch("HOMEBREW_CATALYST_RELEASE_KEY") {
    odie "Set HOMEBREW_CATALYST_RELEASE_KEY to install. See: https://github.com/archetypeai/homebrew-catalyst#setup"
  }
  if Hardware::CPU.arm?
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.106/cortex-darwin-arm64.tar.gz?key=#{@@release_key}"
    sha256 "6a8d0dd072ddd99e864527b45d20ab5b38a65bea180a575ba7c4bf85758edf83"
  else
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.106/cortex-darwin-x86_64.tar.gz?key=#{@@release_key}"
    sha256 "bcbd10229e1e76392e1ac8a5c98573e94dc567195e324baf3112fe6abd7ab9e7"
  end

  def install
    bin.install "cortex"
    bin.install_symlink "cortex" => "cx"
  end

  test do
    system bin/"cortex", "--version"
  end
end
