# Documentation

Read the Docs: [vanHeemstraSystems-REPOSITORY-NAME](https://vanHeemstraSystems-REPOSITORY-NAME.readthedocs.io/en/latest/)

## 100 - Install ReadTheDocs

Run the following command:

```
$ pip install sphinx sphinx_rtd_theme recommonmark
```

Next to create the docs run:

```
$ cd docs
$ make html
```

Your docs will be created inside ```docs/build```.

## 200 - Autogeneration of ReadTheDocs

1) Make sure there is a ```.readthedocs.yml``` file at the root of your GitHub repository.

2) Connect your GitHub repository to ReadTheDocs at https://readthedocs.org/

1. Go to [ReadTheDocs](https://readthedocs.org/) and create an account
2. Click "Import a Project"
3. Connect your GitHub account if you haven't already
4. Select your repository from the list
5. Configure your project settings

## 300 - Build Your Documentation

1. Push your changes to GitHub
2. ReadTheDocs will automatically build your documentation
3. Visit your project page on ReadTheDocs to see the result

## 400 - Set Up Webhooks (Optional)

ReadTheDocs should automatically set up webhooks, but if not:

1. Go to your repository settings on GitHub
2. Go to Webhooks
3. Add a webhook with the URL from your ReadTheDocs project settings

## 500 - Troubleshooting

- **Build fails**: Check the build logs on ReadTheDocs
- **Missing content**: Ensure all files are included in your `toctree`
- **Formatting issues**: Check that your Markdown/reStructuredText is valid
- **Images not showing**: Verify paths to images are correct

## 600 - Maintaining Your Documentation

- Update your documentation files as needed
- Push changes to GitHub
- ReadTheDocs will automatically rebuild
- Use ReadTheDocs' versioning feature to maintain documentation for different releases

## 700 - Trigger a build on ReadTheDocs

On [ReadTheDocs](https://readthedocs.org/), after logging in navigate to your GitHub repository entry (e.g., ```https://app.readthedocs.org/projects/YOUR-GITHUB-REPOSITOY-NAME/```) and from the dotted menu (...) choose **Rebuild version**.

## 800 - Tips

- **Images**: Move images to `docs/source/_static/` and update references
- **Code blocks**: Ensure proper syntax highlighting is specified
- **Cross-references**: Update to use Sphinx's reference system
- **Metadata**: Add appropriate metadata to each page for better SEO

## 900 - Common Issues

- **Broken links**: Double-check all links after conversion
- **Missing images**: Ensure all image paths are updated
- **Build failures**: Check the ReadTheDocs build logs for errors
- **Formatting differences**: Some Markdown features might render differently in Sphinx

## 1000 - View the Documentation

Visit https://vanHeemstraSystems-REPOSITORY-NAME.readthedocs.io/en/latest/
