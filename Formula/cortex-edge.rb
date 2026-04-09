class CortexEdge < Formula
  desc "Build and run cortex agents"
  homepage "https://github.com/archetypeai/catalyst"
  version "0.2.0-rc.92"
  license :cannot_represent

  @@release_key = ENV.fetch("HOMEBREW_CATALYST_RELEASE_KEY") {
    odie "Set HOMEBREW_CATALYST_RELEASE_KEY to install. See: https://github.com/archetypeai/homebrew-catalyst#setup"
  }
  if Hardware::CPU.arm?
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.92/cortex-darwin-arm64.tar.gz?key=#{@@release_key}"
    sha256 "c165dc3894502b956397fe49ed7062c1c876839880feea268aaa138545fa4cac"
  else
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.92/cortex-darwin-x86_64.tar.gz?key=#{@@release_key}"
    sha256 "37af684c08633672f17feab8097a489b2869b2b93c127e173c79bb1fd2388af4"
  end

  def install
    bin.install "cortex"
    bin.install_symlink "cortex" => "cx"
  end

  test do
    system bin/"cortex", "--version"
  end
end
