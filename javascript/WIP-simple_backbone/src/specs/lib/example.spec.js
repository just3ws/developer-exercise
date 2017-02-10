import assert from 'assert';

describe('Array', () => {
  describe('#indexOf ()', () => {
    it('should return -1 when the value is not present', () => {
      assert.equal(-1, [1,2,3].indexOf(4));
    });

    it('should return that 1 equals 1', () => {
      assert.equal(1, 1);
    });
  });
});
