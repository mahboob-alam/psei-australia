# Cloudflare Pages Build Configuration

This project requires Flutter to be built during deployment.

## Build Settings for Cloudflare Pages:

1. **Framework preset**: None (Custom)
2. **Build command**: `bash .cloudflare/build.sh` or `.cloudflare/build.sh`
3. **Build output directory**: `build/web`
4. **Root directory**: `/` (project root)

## Environment Variables (Optional):

If using a custom build image:
- `FLUTTER_VERSION`: `stable` (or specific version like `3.24.0`)

## Alternative Build Command (if Flutter is pre-installed):

```bash
flutter pub get && flutter build web --release --no-tree-shake-icons
```

## Notes:

- The build script installs Flutter if not available
- Uses `--no-tree-shake-icons` to ensure all Material icons are included
- Build output is in `build/web` directory
