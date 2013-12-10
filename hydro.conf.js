require('coffee-script');

var chai = require('chai');

chai.should();

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
