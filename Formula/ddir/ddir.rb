class Ddir < Formula
    include Language::Python::Virtualenv

    desc "Diff a directory and sync changes."
    homepage "https://github.com/yannickkirschen/ddir"
    url "https://github.com/yannickkirschen/ddir/archive/refs/tags/3.1.1.zip"
    sha256 "0b59e10dbf164ef019258486b70f5223877086972787b69bd563a06658a49ca5"
    license :public_domain

    depends_on "python@3.12"

    def install
        virtualenv_install_with_resources
    end

    test do
      system "#{bin}/ddir", "version"
    end
  end
