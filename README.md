# Homebrew tap for Koala

Koala runs Linux VMs for development and CI on Apple silicon Macs
(macOS 26 or later). It is a **preview**: its security proofs are not
complete. See the [release notes](https://github.com/kunalkushwaha/koala-releases/releases).

```sh
brew install kunalkushwaha/koala/koala
koala system install          # finish the install for your user (no sudo)
```

To remove it:

```sh
koala system uninstall        # keeps VMs, volumes and images; --purge --yes deletes them
brew uninstall koala
```

Koala is licensed under the Apache License, Version 2.0.
