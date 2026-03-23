class CatalystEdge < Formula
  desc "Hyperparameter optimization for cortex agents"
  homepage "https://github.com/archetypeai/catalyst"
  url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.2/catalyst_loop-0.2.0-rc.2.tar.gz",
      headers: ["x-api-key: #{ENV["CATALYST_RELEASE_KEY"]}"]
  sha256 "6bc4ab67827b0fc946c5d50a4de1c0e4e0a1becc6fac00520395af99903b7898"
  license :cannot_represent

  depends_on "python@3.12"

  resource "cortex-client" do
    url "https://d9pwqft6ad7vm.cloudfront.net/v0.2.0-rc.2/cortex_client-0.2.0rc2.tar.gz",
        headers: ["x-api-key: #{ENV["CATALYST_RELEASE_KEY"]}"]
    sha256 "7286c50634d281ba0a9ef7b1d76e773644aa82664d55c87091ac4282c5fa1b8e"
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
