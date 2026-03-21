# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands

```bash
# Install dependencies
bundle install

# Start development server with live reload (http://localhost:4000/blog/)
bundle exec jekyll serve --livereload

# Build site (output to _site/)
bundle exec jekyll build

# Build with drafts visible
bundle exec jekyll serve --drafts

# Build with future-dated posts
bundle exec jekyll serve --future

# Build with verbose output for debugging
bundle exec jekyll build --verbose

# Update gems
bundle update
```

## Architecture

This is a **Jekyll 4.4 static site** (Ruby 4.0) — a trekking/mountaineering blog deployed to GitHub Pages via GitHub Actions on push to `master`.

**Theme**: Trophy (by Thomas Vaeth), fully vendored — styles in `_sass/`, layouts in `_layouts/`, partials in `_includes/`. There is no gem dependency for the theme.

**Content**: All posts are in `_posts/` as `.markdown` or `.adoc` files, named `YYYY-MM-DD-slug.markdown`. Front matter requires `layout: post`, `title`, `date`, `categories`, and optionally `image`.

**Category system**: `_plugins/category_generator.rb` auto-generates a page at `/category/<slug>/` for each category used in post front matter, using `_layouts/category_index.html`. Available categories: `trek`, `course`, `mountaineering`, `organised`, `self`, `blog`.

**Pagination**: Homepage (`index.html`) paginates 5 posts per page via `jekyll-paginate`. Paginated pages are at `/blog/page-:num`.

**Markup**: Supports both kramdown Markdown and AsciiDoc (`.adoc` extension, processed by Asciidoctor). AsciiDoc posts support CodeRay syntax highlighting; Markdown uses Rouge.

**Key config** (`_config.yml`): `baseurl` is `/blog`, so all internal links must account for this prefix. The `url` is `https://ghumakkad.github.io/`.

**Deployment**: GitHub Actions workflow (`.github/workflows/jekyll-gh-pages.yml`) builds with `JEKYLL_ENV=production` and deploys to GitHub Pages automatically on every push to `master`.
