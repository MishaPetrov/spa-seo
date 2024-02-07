# SPA SEO

A shell script to dynamically inject SEO meta tags into static HTML files, tailored for Single Page Applications (SPA) where SEO optimizations are challenging due to client-side rendering.

## Getting Started

### Prerequisites

- Bash environment (Unix/Linux/macOS)
- `sed` command-line utility

### Installation

1. Clone this repository or download the `inject-seo.sh` script directly.
2. Make the script executable:
```bash
chmod +x inject-seo.sh
```


### Configuration
Before running the script, customize the following variables within inject-seo.sh to match your project's configuration:

`baseUrl`: The base URL of your site.

`defaultDescription`: A default description for your site's pages.

`defaultOGImage`: A default Open Graph image URL.

`distDir`: The directory where your static files are located.


### Usage
*Run the script after generating your static site files:*

```bash
./inject-seo.sh
```

The script will iterate through each index.html file in distDir and inject SEO meta tags based on the specified configuration.

*Customizing Routes and Titles*
To add custom titles for specific routes, modify the case statement within the inject_meta function. For example:

```shell
"/about") title+="About Us" ;;
```

Add your routes and corresponding titles as needed.

### Contributions
Contributions are welcome! Please feel free to submit a pull request or create an issue for any enhancements, bug fixes, or improvements.

### License
This project is licensed under the MIT License - see the LICENSE file for details.