class Catalyst < Formula
  desc "Hyperparameter optimization for cortex agents"
  homepage "https://github.com/archetypeai/catalyst"
  url "https://github.com/archetypeai/catalyst/releases/download/v0.1.0/catalyst_loop-0.1.0.tar.gz",
      using: CurlDownloadStrategy
  sha256 "a4d0a26802c9ef2a4095fd12983c8ee9f3cf310dc01588ba73d97195e136a9ac"
  license :cannot_represent

  depends_on "python@3.12"

  resource "cortex-client" do
    url "https://github.com/archetypeai/catalyst/releases/download/v0.1.0/cortex_client-0.1.0.tar.gz",
        using: CurlDownloadStrategy
    sha256 "2be1c37a92240bc08c7a6d2a5fd43ba05c5d63e79e4acfad17438829c3f61f4d"
  end

  def install
    venv = virtualenv_create(libexec, "python3.12")
    venv.pip_install resource("cortex-client")
    venv.pip_install_and_link buildpath
  end

  test do
    system bin/"catalyst", "--version"
  end
end
