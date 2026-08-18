require "language/node"

class Opencues < Formula
  desc "AI anywhere you type - inline agents and prompting (just type _)"
  homepage "https://opencues.com"
  url "https://registry.npmjs.org/opencues/-/opencues-0.7.5.tgz"
  sha256 "3c9a325cbd76cd102c813ba2205c10a6bc475513272aaff6a61c8e49b7e6408e"
  license "Apache-2.0"

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  def caveats
    <<~EOS
      opencues needs git at runtime (it fetches its runtime repo on first
      use, pinned to this version). macOS ships git with the Command Line
      Tools; `xcode-select --install` if missing.

      Get started:
        opencues set-key cerebras csk-...
        opencues install claude-code
    EOS
  end

  test do
    assert_match "0.7.5", shell_output("#{bin}/opencues --version")
  end
end
