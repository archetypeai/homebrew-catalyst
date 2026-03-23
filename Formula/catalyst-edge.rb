class CatalystEdge < Formula
  desc "Hyperparameter optimization for cortex agents"
  homepage "https://github.com/archetypeai/catalyst"
  url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.6/catalyst_loop-0.2.0rc6.tar.gz?key=#{ENV["CATALYST_RELEASE_KEY"]}"
  sha256 "f0a40fa2cd370e1316ecdfef0f4da27a6a476c22ec4e8b7fcba37a1952524125"
  license :cannot_represent

  depends_on "python@3.12"

  resource "cortex-client" do
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.6/cortex_client-0.2.0rc6.tar.gz?key=#{ENV["CATALYST_RELEASE_KEY"]}"
    sha256 "f5eabba894933146bafc3ad55817c54a77b3273899c3044d8ef7d0d12ce8b6ad"
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
    venv = virtualenv_create(libexec, "python3.12")
    venv.pip_install resource("cortex-client")
    venv.pip_install_and_link buildpath
  end

  test do
    system bin/"catalyst", "--version"
  end
end
