# 📜 Changelog

All notable changes to this project will be documented in this file.

The formate is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org).

---

## [Unreleased]

> 🚧 Features currently under active development:

- Grid testing matrix for Solana, Node.js, and Rust versions.
- Markdown link validation.
- IDL (Interface Definition Language) file consistency checks.
- Docker-based Solana test validator environment.
- Frontend app integration (React + Anchor).
- Rust code coverage reporting.
- Additional Solana program examples beyond counter (token mint, voting app, etc.)

---

## [0.1.0] - 2025-04-28

🎉 Initial public release!

### Added

- Fully working Anchor counter program (`solana_counter`).
- Professional GitHub Actions CI pipeline:
  - Install Rust, Node.js, Yarn.
  - Install Solana CLI (Anza Labs) and Anchor CLI.
  - Restore Dev Wallet and Deploy Wallet from GitHub Secrets.
  - Cache for Cargo, Node.js, Yarn dependencies.
  - Lint (`yarn lint`).
  - Prettier check (`yarn prettier`).
  - Clippy for Rust static analysis (`yarn clippy`).
  - Anchor tests (`yarn test`).
- MIT License.
- Professional README with project structure and diagrams.
- Mermaid diagrams for project layout and CI workflow.
- Start/Stop scripts for validator (`start-validator-native.sh`, etc.)

### Changed

-None (first release)

### Deprecated

- None

### Removed

- None

### Fixed

- None

---

# 📌 Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) (Coming soon!)

---

# 📖 Legend

- 🎉 Feature
- 🐛 Bug fix
- 🛠️ Maintenance
- 🚀 Performance
- 📚 Documentation
- 🔒 Security
