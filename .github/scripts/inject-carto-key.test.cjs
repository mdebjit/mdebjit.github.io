const assert = require('node:assert/strict');
const { readFileSync } = require('node:fs');
const { join } = require('node:path');
const { test } = require('node:test');
const { injectCartoKey } = require('./inject-carto-key.cjs');

const keyDeclaration = "const cartoBasemapKey = '';";
const mapHtml = readFileSync(join(__dirname, '../../static/india-map-leaflet.html'), 'utf8');

test('injects a basemap key without changing the rest of the map', () => {
    assert.equal(
        injectCartoKey(mapHtml, 'deployment-test-key'),
        mapHtml.replace(keyDeclaration, 'const cartoBasemapKey = "deployment-test-key";')
    );
});

test('rejects missing or unsafe keys without including them in the error', () => {
    for (const invalidKey of [undefined, '', 'key with spaces', 'key\n', "key'", '</script>']) {
        assert.throws(
            () => injectCartoKey(mapHtml, invalidKey),
            { message: 'Set CARTO_BASEMAP_KEY to a valid basemap key before deployment.' }
        );
    }
});

test('rejects generated maps without the expected key declaration', () => {
    assert.throws(
        () => injectCartoKey('<html></html>', 'deployment-test-key'),
        /Expected exactly one empty CARTO key declaration/
    );
});

test('rejects duplicate key declarations', () => {
    assert.throws(
        () => injectCartoKey(mapHtml + keyDeclaration, 'deployment-test-key'),
        /Expected exactly one empty CARTO key declaration/
    );
});

test('refuses to overwrite an already injected key', () => {
    const injectedHtml = injectCartoKey(mapHtml, 'deployment-test-key');
    assert.throws(
        () => injectCartoKey(injectedHtml, 'another-test-key'),
        /Expected exactly one empty CARTO key declaration/
    );
});