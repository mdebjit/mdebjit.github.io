const { readFileSync, writeFileSync } = require('node:fs');

const keyDeclaration = "const cartoBasemapKey = '';";

function injectCartoKey(html, key) {
    if (typeof key !== 'string' || !/^[A-Za-z0-9_-]+$/.test(key)) {
        throw new Error('Set CARTO_BASEMAP_KEY to a valid basemap key before deployment.');
    }

    const declarationIndex = html.indexOf(keyDeclaration);
    if (declarationIndex < 0 || declarationIndex !== html.lastIndexOf(keyDeclaration)) {
        throw new Error('Expected exactly one empty CARTO key declaration in the generated map.');
    }

    return html.replace(keyDeclaration, `const cartoBasemapKey = ${JSON.stringify(key)};`);
}

if (require.main === module) {
    const mapPath = process.argv[2] || 'public/india-map-leaflet.html';
    const html = readFileSync(mapPath, 'utf8');
    writeFileSync(mapPath, injectCartoKey(html, process.env.CARTO_BASEMAP_KEY), 'utf8');
}

module.exports = { injectCartoKey };