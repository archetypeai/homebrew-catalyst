class UcortexUedge < Formula
  desc "Build and run cortex agents"
  homepage "https://github.com/archetypeai/catalyst"
  version "0.2.0-rc.3"
  license :cannot_represent

  if Hardware::CPU.arm?
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.3/cortex-darwin-arm64.tar.gz",
        headers: ["x-api-key: #{ENV["CATALYST_RELEASE_KEY"]}"]
    sha256 "1b58ef884acc9a713270a299d9d7b7298377bcdbecd87d08c1aaa11e208fdc1f"
  else
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.3/cortex-darwin-x86_64.tar.gz",
        headers: ["x-api-key: #{ENV["CATALYST_RELEASE_KEY"]}"]
    sha256 "d8843e647b46981eab2713407d471209caf0978d78b9c29440ee06f191825759"
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
