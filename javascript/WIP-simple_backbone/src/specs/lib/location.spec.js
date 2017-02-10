import assert from 'assert';
import {jsdom} from 'jsdom';

import {IfDevEnv} from '../../lib/location'; 

describe('IfDevEnv', () => {

  describe('location is local', () => {

    it('should return the supplied devEnv value', () => {
      jsdom.env(
        '<!DOCTYPE html><html><body><a class="the-link">foo</a></body></html>',

        (err, window) => {
          debugger;
          console.log("contents of a.the-link:", window.$("a.the-link").text());
        }
      );
    });
  });

  describe('location is not local', () => {
    it('should return the supplied prodEnv value', () => {
      assert.equal(-1, [1,2,3].indexOf(4));
    });
  });
});
