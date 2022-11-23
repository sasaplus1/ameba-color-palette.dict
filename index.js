/**
 * Extract CSS variables from ameba-color-palette.css with css-tree
 */

const fs = require('fs');

const cssTree = require('css-tree');

const css = fs.readFileSync(
  require.resolve('ameba-color-palette.css/ameba-color-palette.css'),
  'utf8'
);
const ast = cssTree.parse(css);

const properties = [];

cssTree.walk(ast, function(node) {
  const { property, type } = node;

  if (type !== 'Declaration' || !property.startsWith('--')) {
    return;
  }

  properties.push(property);
});

process.stdout.write(
  properties.join('\n') + '\n'
);
