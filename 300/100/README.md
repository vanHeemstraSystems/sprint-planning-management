# 100 - Why Use an Nx Monorepo?

In this tutorial, we'll set up a monorepo that is configured with a set of features that work together toward the goal of allowing developers to focus on building features rather than the configuration, coordination and maintenance of the tooling in the repo.

You'll notice that instead of using npm/yarn/pnpm workspaces, projects within the repository are linked using typescript path aliases that are defined in the ```tsconfig.base.json``` file. Also, since we're creating projects using Nx plugin generators, all new projects come preconfigured with useful tools like Prettier, ESLint and Jest.

Nx Plugins are optional packages that extend the capabilities of Nx, catering to various specific technologies. For instance, we have plugins tailored to React (e.g., ```@nx/react```), Vite (```@nx/vite```), Cypress (```@nx/cypress```), and more. These plugins offer additional features, making your development experience more efficient and enjoyable when working with specific tech stacks.

Features we'll use in this monorepo:

- [Install dependencies at the root by default](https://nx.dev/concepts/decisions/dependency-management#single-version-policy)
- [Scaffold new code with generators](https://nx.dev/features/generate-code)
- [Updates dependencies with automated migrations](https://nx.dev/features/automate-updating-dependencies)

Visit our "[Why Nx](https://nx.dev/getting-started/why-nx)" page for more details.
