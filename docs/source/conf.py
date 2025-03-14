# Configuration file for the Sphinx documentation builder.

# -- Project information -----------------------------------------------------
project = 'Your Project Name'
copyright = '2025 - present, van Heemstra Systems'
author = 'Willem van Heemstra'

release = '0.1'
version = '0.1.0'

# -- General configuration ---------------------------------------------------
extensions = [
    'recommonmark',
    'sphinx.ext.autosectionlabel',
]

templates_path = ['_templates']
exclude_patterns = []

# -- Options for HTML output -------------------------------------------------
html_theme = 'sphinx_rtd_theme'
html_static_path = ['_static']
