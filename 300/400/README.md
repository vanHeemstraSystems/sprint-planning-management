# 400 - Building the New React Monorepo

## 100 - Test the Built Application

First, let's serve the application:

```
npx nx serve hatch_project
```

This will:
- Start a development server
- Usually on http://localhost:4200
- Auto-reload on changes

## 200 - Set up Continuous Integration

To set up CI with GitHub Actions:

a. Create the workflow file:

```
mkdir -p .github/workflows
```

b. Create the CI configuration:

```
name: CI
on:
  push:
    branches:
      - main
  pull_request:

jobs:
  main:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v3
        with:
          node-version: 20
          cache: 'npm'
      - run: npm cache clean --force
      - run: npm ci
      - run: npm install -g @nrwl/cli
      - run: |
          npm install --save-dev @swc-node/register @swc/core \
          @nx/webpack webpack-cli \
          @nx/eslint-plugin eslint-plugin-playwright \
          @playwright/test jest \
          @nx/jest @nx/react @nx/eslint @nx/playwright
      - run: npx nx run-many -t build --verbose
      - run: npx nx run-many -t test
```
.github/workflows/ci.yml

Our GitHub Actions workflow is now set up and successfully running builds and tests.
