require('coffee-script');
require('should');

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
    tests: [
      'test/*.coffee',
    ],
    proxies: {
      describe: 'addSuite',
      it: 'addTest',
    }
  });
};
