## 🧹 Augment AI Cleaner for VSCode

This script safely removes all local traces of the Augment AI VSCode extension:

- Closes VSCode
- Deletes all versions of the Augment extension
- Clears chat and config data from workspace and global storage

### 🔧 Run directly (Linux/macOS):
```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/santosh-shetty/augment-cleanup/main/clean-augment.sh)"
