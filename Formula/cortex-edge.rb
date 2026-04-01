class CortexEdge < Formula
  desc "Build and run cortex agents"
  homepage "https://github.com/archetypeai/catalyst"
  version "0.2.0-rc.23"
  license :cannot_represent

  @@release_key = ENV.fetch("HOMEBREW_CATALYST_RELEASE_KEY") {
    odie "Set HOMEBREW_CATALYST_RELEASE_KEY to install. See: https://github.com/archetypeai/homebrew-catalyst#setup"
  }
  if Hardware::CPU.arm?
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.23/cortex-darwin-arm64.tar.gz?key=#{@@release_key}"
    sha256 "d949ae6fa1230723e122db4c98c54b5a8361915d2c1f824421d0bbcd8cec9fdb"
  else
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.23/cortex-darwin-x86_64.tar.gz?key=#{@@release_key}"
    sha256 "d7c90fd04603d16a73f1c5af4065f13d8e78faf9a2c4ca5204c51647738dcf52"
  end

  def install
    bin.install "cortex"
    bin.install_symlink "cortex" => "cx"
  end

  test do
    system bin/"cortex", "--version"
  end
end
