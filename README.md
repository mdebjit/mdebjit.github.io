# Ctrl + Alt + Escape Blog

A Hugo-powered blog using the LoveIt theme.

## Quick Setup

For Windows users:

1. Clone this repository:
   ```powershell
   git clone https://github.com/mdebjit/mdebjit.github.io.git
   cd mdebjit.github.io
   ```

2. Run the setup script:
   ```powershell
   .\setup.ps1
   ```

3. Start the development server:
   ```powershell
   hugo server
   ```

4. Open your browser to: `http://localhost:1313/`

## Manual Setup (if the script fails)

1. Install Hugo Extended from: https://github.com/gohugoio/hugo/releases
2. Initialize git submodules: `git submodule update --init --recursive`
3. Build the site: `hugo`
4. Start the server: `hugo server`

## Creating New Posts

```powershell
hugo new posts/your-awesome-post.md
```

## Building for Production

```powershell
hugo --minify
```

The built site will be in the `public/` directory.

## Deployment

This site is configured for GitHub Pages deployment. Push to the `master` branch and GitHub Actions should handle the rest.

## Theme

This blog uses the [LoveIt](https://github.com/dillonzq/LoveIt) theme. Theme documentation can be found [here](https://hugoloveit.com/).

## Configuration

Main configuration is in `hugo.toml`. Refer to [Hugo documentation](https://gohugo.io/getting-started/configuration/) for available options.

---