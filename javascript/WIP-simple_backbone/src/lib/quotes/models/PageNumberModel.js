export const PageNumberModel = Backbone.Model.extend({
  toJSON: function() {
    const attrs = this.attributes;
    attrs.current = this.current();
    return attrs;
  },
  current: () => {
    const matches = location.search.match(/page=(\d+)/gi);
    if (matches == null || matches.length == 0) { return 1; }
    const number = Number(matches[0].match(/\d+/)[0]);
    if (number <= 0) { return 1; }
    return number;
  }
});

