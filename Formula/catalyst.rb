class Catalyst < Formula
  desc "Hyperparameter optimization for cortex agents"
  homepage "https://github.com/archetypeai/catalyst"
  version "0.5.5"
  license :cannot_represent

  @@release_key = ENV.fetch("HOMEBREW_CATALYST_RELEASE_KEY") {
    odie "Set HOMEBREW_CATALYST_RELEASE_KEY to install. See: https://github.com/archetypeai/homebrew-catalyst#setup"
  }
  url "https://d9pwqft6ad7vm.cloudfront.net/stable/v0.5.5/catalyst-darwin-arm64.tar.gz?key=#{@@release_key}"
  sha256 "384262e00c77e4e36db03e161d32f1cba42b1848549123377e73d78fa81f5dc8"

  depends_on "python@3.12"

  # Prevent Homebrew from running install_name_tool on Python extension .so
  # files during keg relocation. Pre-built wheels (cryptography, etc.) have
  # minimal Mach-O headers that can't be rewritten. These load via Python's
  # import system, not dyld, so relinking is unnecessary.
  skip_clean "libexec/lib"

  def install
    # Copy lib/ via cp instead of libexec.install to prevent Homebrew from
    # running install_name_tool on Python extension .so files. Pre-built wheels
    # (cryptography, etc.) have minimal Mach-O headers that can't be rewritten.
    # These load via Python's import system, not dyld, so relinking is unnecessary.
    libexec.mkpath
    system "cp", "-a", "lib", libexec/"lib"
    # S846: single `cp -a share libexec/share` for everything that ships
    # under the tarball's share/ tree. The duplicate copy that lived here
    # previously created a doubled libexec/share/share/ prefix because the
    # second `cp -a SRC DEST` lands inside DEST when DEST already exists
    # (issue #254 Bug 1). Bundle contents (S836 + S838 both live in this
    # one tree, this one copy):
    #   share/cortex/                   — framework source workspace (RC only, S838)
    #   share/cortex-agents/nodes/      — node crate sources (RC only, S838)
    #   share/cortex-agents/<agent>/    — pre-built agents (S836; complete
    #                                     tree with bin/, models/, values/,
    #                                     manifest.yaml, etc.)
    # agent_dir_resolver targets <libexec>/share/cortex-agents/<name>/ — so
    # the canonical single-share path it expects is what gets created here.
    system "cp", "-a", "share", libexec/"share" if Dir.exist?("share")
    libexec.install "catalyst" => "catalyst"
    bin.install_symlink libexec/"catalyst"

    # cortex CLI + cx alias (bundled in the same tarball)
    bin.install "cortex" => "cortex" if File.exist?("cortex")
    bin.install_symlink bin/"cortex" => "cx" if File.exist?(bin/"cortex")
  end

  test do
    system bin/"catalyst", "--version"
    system bin/"cortex", "--version" if (bin/"cortex").exist?
  end
end
