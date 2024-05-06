class Ddir < Formula
    include Language::Python::Virtualenv

    desc "Diff a directory and sync changes."
    homepage "https://github.com/yannickkirschen/ddir"
    url "https://github.com/yannickkirschen/ddir/archive/refs/tags/3.0.1.zip"
    sha256 "bd7a9d052c1a726d3fd85489cee78e85bd421bad5f6f9108fb26a1da4d6e4e2b"
    license :public_domain

    depends_on "python@3.12"

    def install
        virtualenv_install_with_resources
    end

    test do
      system "#{bin}/ddir", "version"
    end
  end
