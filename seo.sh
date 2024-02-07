#!/bin/bash

# Configuration - Update these values based on your project
baseUrl="https://example.com"
defaultDescription="Your default site description."
defaultOGImage="${baseUrl}/path/to/your/og-image.jpg"
distDir="./path/to/your/output/directory" # Update this to your static files directory

# Function to inject meta tags
inject_meta() {
    filePath="$1"
    # Extract the route path
    routePath="${filePath/${distDir}\//}"
    routePath="/${routePath%/index.html}"

    # Customize your title based on the routePath
    title="Your Site Name - "
    case "${routePath}" in
        "/") title+="Welcome" ;;
        # Add your custom routes and titles here
        *) title+="Page Not Found" ;; # Default case
    esac

    # Construct canonical URL and inject meta tags
    canonicalUrl="${baseUrl}${routePath}"
    sed -i'.bak' -e "s|<meta charset=\"utf-8\">|&\n<title>${title}</title>\n<meta name=\"description\" content=\"${defaultDescription}\">\n<link rel=\"canonical\" href=\"${canonicalUrl}\">\n<meta property=\"og:title\" content=\"${title}\">\n<meta property=\"og:image\" content=\"${defaultOGImage}\">\n<meta property=\"og:description\" content=\"${defaultDescription}\">\n<meta property=\"og:url\" content=\"${canonicalUrl}\">\n<meta name=\"twitter:card\" content=\"summary_large_image\">\n<meta name=\"twitter:title\" content=\"${title}\">\n<meta name=\"twitter:description\" content=\"${defaultDescription}\">\n<meta name=\"twitter:image\" content=\"${defaultOGImage}\">|" "${filePath}"

    # Remove backup file
    rm "${filePath}.bak"
}

export -f inject_meta
export baseUrl defaultDescription defaultOGImage distDir

# Apply meta tags to all index.html files
find "${distDir}" -name "index.html" -exec bash -c 'inject_meta "$0"' {} \;

echo "Meta tags injection completed."
