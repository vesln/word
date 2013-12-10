/**
 * Test config.
 *
 * @param {Object} hydro
 * @api public
 */

module.exports = function(hydro) {
  hydro.set({
    attach: global,
    formatter: 'hydro-simple',
    plugins: ['hydro-bdd', 'hydro-chai', 'hydro-coffee'],
    chai: {
      styles: 'should',
      diff: true,
      stack: true
    },
    tests: [
      'test/*.coffee',
    ]
  });
};
