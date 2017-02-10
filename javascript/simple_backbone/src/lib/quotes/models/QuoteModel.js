export const QuoteModel = Backbone.Model.extend({
  toJSON: function() {
    const attrs = this.attributes;
    attrs.key = this.key();
    return attrs;
  },
  key: function () {
    return ["theme", "context", "source", "quote"]
      .map((attr) => this.get(attr).
        toLowerCase().
        replace(/\W/gi, " ").
        trim().
        replace(/\s+/gi, "-").
        replace(/\-{2,}/gi, "-")).join(":");
  }
});
