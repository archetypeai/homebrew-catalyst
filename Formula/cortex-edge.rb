class CortexEdge < Formula
  desc "Build and run cortex agents"
  homepage "https://github.com/archetypeai/catalyst"
  version "0.2.0-rc.6"
  license :cannot_represent

  if Hardware::CPU.arm?
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.6/cortex-darwin-arm64.tar.gz?key=#{ENV["CATALYST_RELEASE_KEY"]}"
    sha256 "4cdabc89fd5621d694c5894447e39be6f31b1a94d38dbb12a19f13a05dd1719b"
  else
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.6/cortex-darwin-x86_64.tar.gz?key=#{ENV["CATALYST_RELEASE_KEY"]}"
    sha256 "15ce3317ede13995d8731368472e84f00f196bbdb8fa6c7843b483dffe65763b"
  end

  def install
    if ENV["CATALYST_RELEASE_KEY"].nil? || ENV["CATALYST_RELEASE_KEY"].empty?
      odie <<~EOS
        CATALYST_RELEASE_KEY is not set. This is required to download release artifacts.

        Get the key:
          eval "$(scripts/get-release-key.sh)"

        Or add to ~/.zshrc:
          export CATALYST_RELEASE_KEY=<your-key>
      EOS
    end
    bin.install "cortex"
    bin.install_symlink "cortex" => "cx"
  end

  test do
    system bin/"cortex", "--version"
  end
end
